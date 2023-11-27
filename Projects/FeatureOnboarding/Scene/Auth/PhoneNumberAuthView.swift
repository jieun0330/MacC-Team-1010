//
//  PhoneNumberAuthView.swift
//  FeatureOnboarding
//
//  Created by 박지은 on 2023/11/20.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core
import Combine
import Foundation

public struct PhoneNumberAuthView: View {
	enum PhoneNumberTimerStatus {
		case normal
		case retry
		case timeout
	}
	
	@State private var timerStatus: PhoneNumberTimerStatus = .normal
	@State private var phoneNumber = ""
	@State private var isNavigation = false
	@State private var certificationNumber = ""
	@State private var showSecondTextField = false
	@State private var timeRemaining: Int = 180
	@State private var showAlert = false
	@State private var isSkip = false
	
	let date = Date()
	var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	public init() { }
	
	public var body: some View {
		NavigationStack {
			VStack(alignment: .center, spacing: 0) {
				Spacer()
				
				headerView()
				
				if showSecondTextField {
					VStack(spacing: 0) {
						TextField("000000", text: $certificationNumber)
							.frame(width: 300)
							.padding(.top, 24)
							.padding(.bottom, 8)
							.textFieldStyle(PhoneNumTextFieldStyle(alertStatus: timerStatus))
							.keyboardType(.numberPad)
							.onReceive(Just(certificationNumber)) { newValue in
								let filtered = newValue.filter { "0123456789".contains($0) }
								if filtered != newValue {
									self.certificationNumber = filtered
								}
								if self.certificationNumber.count == 7 {
									self.certificationNumber.removeLast()
								}
							}
						
						HStack {
							switch timerStatus {
							case .normal:
								Text("인증번호가 발송되었어요!")
									.SF12B()
									.foregroundColor(.Primary2)
							case .retry:
								Text("인증 번호를 다시 확인해주세요")
									.SF12B()
									.foregroundColor(.Alert)
							case .timeout:
								Text("인증시간이 지났어요")
									.SF12B()
									.foregroundColor(.Alert)
							}
							
							Spacer()
							
							Text(converSecondsToTime(timeInSeconds: timeRemaining))
								.SF14R()
								.onReceive(timer) { _ in
									if timeRemaining > 0 {
										timeRemaining -= 1
									} else {
										timerStatus = .timeout
									}
								}
							Button {
								timerStatus = .normal
								timeRemaining = 180
								certificationNumber = ""
							} label: {
								Text("인증번호 재전송")
									.SF12B()
									.foregroundColor(.Primary)
							}
						}
						.frame(width: 300)
					}
				}
				
				TextField("010-1234-5678", text: $phoneNumber)
					.foregroundColor(showSecondTextField ? Color.W85 : .White)
					.padding(.top, 24)
					.textFieldStyle(PhoneNumTextFieldStyle(inputPhoneNumberState: showSecondTextField))
					.keyboardType(.numberPad)
					.onChange(of: phoneNumber) { _ in
						var withoutHypen = String(phoneNumber.replacingOccurrences(of: "-", with: "").prefix(11))
						if withoutHypen.count >= 8  {
							withoutHypen.insert("-", at: phoneNumber.index(phoneNumber.startIndex, offsetBy: 3))
							withoutHypen.insert("-", at: phoneNumber.index(phoneNumber.endIndex, offsetBy: -5))
							phoneNumber = withoutHypen
						} else {
							phoneNumber = withoutHypen
						}
					}
					.disabled(showSecondTextField)
				
				Spacer()
				
				nextButton()
			}
			.navigationBarItems(trailing: Button(action: {
				showAlert = true
			}, label: {
				Text("건너뛰기").SF14R().foregroundColor(.W25)
			}))
			.alert(isPresented: $showAlert) {
				Alert(title: Text("막걸리 정보를 보관할 수 없어요"),
					  message: Text("번호를 입력하지 않으면 기기 변동 시 내 막걸리 정보를 불러올 수 없어요"),
					  primaryButton: .cancel(Text("취소")) { },
					  secondaryButton: .default(Text("건너뛰기")) {
					isSkip = true
				})
			}
			.modifier(OnboardingBackground())
		}
	}
}

private extension PhoneNumberAuthView {
	@ViewBuilder
	func headerView() -> some View {
		VStack(spacing: 4) {
			Text("반가워요!")
				.SF24B()
			HStack(spacing: 0) {
				Text("본인 확인")
					.foregroundColor(.Primary)
					.SF24B()
				Text("을 해주세요")
					.SF24B()
			}
		}
	}
	
	@ViewBuilder
	func nextButton() -> some View {
		if showSecondTextField {
			NavigationLink {
				// 인증번호 확인 후 맞으면
				
				// 1. 이미 데이터가 있으면?
				// 이미 데이터가 있어요 뷰
				
				// 2. 데이터가 없으면?
				// 생년월일 뷰로 이동 + 뒤로 못가게
				BirthView()
				
				// 인증번호 틀리면
				// alertStatus =. retry
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(
						certificationNumber.count != 6 || timerStatus == .timeout ? .w10 : .goldenyellow)!)
					)
					.frame(height: 50)
					.overlay {
						Text("다음")
							.foregroundColor(
								certificationNumber.count != 6 || timerStatus == .timeout ? .W25 : .White
							)
							.SF17R()
					}
					.padding(.bottom, 16)
			}
			.disabled(certificationNumber.count != 6 || timerStatus == .timeout)
		} else {
			Button {
				// 인증번호 보내기
				withAnimation {
					showSecondTextField = true
				}
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(phoneNumber.isEmpty ? .w10 : .goldenyellow)!))
					.frame(height: 50)
					.overlay {
						Text("다음")
							.foregroundColor(phoneNumber.isEmpty ? .W25 : .White)
							.SF17R()
					}
					.padding(.bottom, 16)
			}
			.disabled(phoneNumber.isEmpty || !phoneNumber.validatePhone(number: phoneNumber))
		}
	}
	
	func converSecondsToTime(timeInSeconds: Int) -> String {
		let hours = timeInSeconds / 3600
		let minutes = (timeInSeconds - hours*3600) / 60
		let seconds = timeInSeconds % 60
		return String(format: "%02i:%02i", minutes,seconds)
	}
	
	func calcRemain() {
		let calendar = Calendar.current
		let targetTime: Date = calendar.date(byAdding: .second,
											 value: 3800,
											 to: date,
											 wrappingComponents: false) ?? Date()
		let remainSeconds = Int(targetTime.timeIntervalSince(date))
		self.timeRemaining = remainSeconds
	}
	
	struct PhoneNumTextFieldStyle: TextFieldStyle {
		var inputPhoneNumberState: Bool = false
		var alertStatus: PhoneNumberTimerStatus = .normal
		
		func _body(configuration: TextField<Self._Label>) -> some View {
			ZStack {
				Rectangle()
					.cornerRadius(12)
					.frame(width: 300, height: 58)
					.foregroundColor(.DarkBase)
					.overlay(
						RoundedRectangle(cornerRadius: 12)
							.stroke(inputPhoneNumberState ? Color.W85 :
										(alertStatus == .retry || alertStatus == .timeout) ? Color.Alert :
										Color.Lilac, lineWidth: 3)
					)
				configuration
					.font(.style(.SF24B))
					.kerning(3)
					.multilineTextAlignment(.center)
					.padding()
			}
		}
	}
}
