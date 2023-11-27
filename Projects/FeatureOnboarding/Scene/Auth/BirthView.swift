//
//  BirthView.swift
//  FeatureOnboarding
//
//  Created by 박지은 on 11/23/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import Combine
import FeatureHome

public struct BirthView: View {
	@State private var birthDay = ""
	@State private var isAgreed = false
	@State private var adultChk = false
	@State private var showAlert = false
	@State private var isSkip = false
	@State private var isMain = false
	@State private var alertItem: AlertItem?
	@State private var navigationGenderView = false
	
	var isLoadDataState: Bool
	
	public init(isLoadDataState: Bool = false) {
		self.isLoadDataState = isLoadDataState
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			Spacer()
			
			if !isLoadDataState {
				Text("본인 확인을 위해")
					.SF24B()
					.padding(.bottom, 4)
			}
			HStack {
				Text("생년월일")
					.foregroundColor(.Primary)
					.SF24B()
				Text("을 입력해주세요")
					.SF24B()
			}
			.padding(.bottom, 8)
			
			if isLoadDataState {
				Text("데이터 저장 시 입력하셨던 정보를 알려주세요.")
					.SF14R()
					.foregroundColor(.W50)
					.padding(.bottom, 24)
			} else {
				Text("본인 확인 이후에 데이터 연동이 가능해져요!")
					.SF14R()
					.foregroundColor(.W50)
					.padding(.bottom, 24)
			}
			
			TextField("980123", text: $birthDay)
				.frame(width: 300)
				.textFieldStyle(BirthDayTextFieldStyle())
				.keyboardType(.numberPad)
				.onReceive(Just(birthDay)) { newValue in
					let filtered = newValue.filter { "0123456789".contains($0) }
					if filtered != newValue {
						self.birthDay = filtered
					}
					if self.birthDay.count == 7 {
						self.birthDay.removeLast()
					}
				}
				.padding(.bottom, 24)
			
			HStack {
				Text("개인정보(연락처, 생년월일) 수집 이용에 동의합니다")
					.SF12B()
					.foregroundColor(.W85)
				
				Button(action: {
					self.isAgreed.toggle()
				}, label: {
					isAgreed ? Image(uiImage: .designSystem(.isSelectedTrue)!) :
					Image(uiImage: .designSystem(.circle)!)
				})
			}
			
			Spacer()
			
			Button {
				if isLoadDataState {
					// 기존에 있던 유저인지 확인

					// 1. 일치하는 데이터가 있다?
					self.alertItem = AlertItem(title: Text("데이터를 불러왔어요!"),
											   message: Text("핸드폰 번호에 저장된 막걸리 정보를 불러왔어요!"),
											   dismissButton: .default(Text("완료")) {
						// fullScreen Main으로 이동
						isMain = true
					})

					// 2. 일치하는 데이터가 없다?
					self.alertItem = AlertItem(title: Text("일치하는 정보가 없어요"),
											   message: Text("새로운 데이터로 시작하시겠어요?"),
											   primaryButton: .cancel(Text("새로만들기")) {
						// GenderView로 이동
						navigationGenderView = true
					},
											   secondaryButton: .default(Text("재입력")))
				} else {
					// GenderView로 이동
					navigationGenderView = true
				}
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(
						Color(uiColor: .designSystem(birthDay.count != 6 || !isAgreed ? .w10 :.goldenyellow)!)
					)
					.frame(height: 50)
					.overlay {
						if isLoadDataState {
							Text("데이터 불러오기")
								.foregroundColor(birthDay.count != 6 || !isAgreed ? .W25 : .White)
								.SF17R()
						} else {
							Text("다음")
								.foregroundColor(birthDay.count != 6 || !isAgreed ? .W25 : .White)
								.SF17R()
						}
					}
					.padding(.bottom, 16)
			}
			.disabled(birthDay.count != 6 || !isAgreed)
		}
		.navigationDestination(isPresented: $navigationGenderView, destination: {
			GenderView()
		})
		.alert(item: $alertItem) { alertItem in
			if alertItem.dismissButton == nil {
				return Alert(title: alertItem.title,
							 message: alertItem.message,
							 primaryButton: alertItem.primaryButton!,
							 secondaryButton: alertItem.secondaryButton!)
			} else {
				return Alert(title: alertItem.title,
							 message: alertItem.message,
							 dismissButton: alertItem.dismissButton)
			}
		}
		.navigationBarItems(trailing: Button(action: {
			self.alertItem = AlertItem(title: Text("막걸리 정보를 보관할 수 없어요"),
									   message: Text("번호를 입력하지 않으면 기기 변동 시 내 막걸리 정보를 불러올 수 없어요"),
									   primaryButton: .cancel(Text("취소")) {},
									   secondaryButton: .default(Text("건너뛰기")) {
				isSkip = true
			})
		}, label: {
			Text("건너뛰기").SF14R().foregroundColor(.W25)
		}))
		.modifier(OnboardingBackground())
		.fullScreenCover(isPresented: $isSkip, content: {
			SkipNicknameView()
		})
		.fullScreenCover(isPresented: $isMain, content: {
			HomeView()
		})
	}
}

private extension BirthView {
	struct BirthDayTextFieldStyle: TextFieldStyle {
		func _body(configuration: TextField<Self._Label>) -> some View {
			ZStack {
				Rectangle()
					.cornerRadius(12)
					.frame(width: 300, height: 58)
					.foregroundColor(.DarkBase)
					.overlay(
						RoundedRectangle(cornerRadius: 12)
							.stroke(Color.Lilac, lineWidth: 3)
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
