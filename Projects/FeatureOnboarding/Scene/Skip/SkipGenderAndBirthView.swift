//
//  SkipGenderAndBirthView.swift
//  FeatureOnboarding
//
//  Created by Kim SungHun on 2023/11/26.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Combine
import Core
import DesignSystem
import FeatureHome

public struct SkipGenderAndBirthView: View {
	@ObservedObject var viewModel: OnboardingViewModel
	
	@State private var selected = [false, false, false]
	@State private var birthDay = ""
	
	let genders = ["남성", "여성", "기타"]
	var nickName: String
	
	public init( _ viewModel: OnboardingViewModel, _ nickName: String) {
		self.viewModel = viewModel
		self.nickName = nickName
	}
	
	public var body: some View {
		ZStack {
			VStack(alignment: .center, spacing: 0) {
				Spacer()
				
				HStack(spacing: 0) {
					Text("성별, 출생연도")
						.foregroundColor(.Primary)
						.SF24B()
					Text("를 알려주세요")
						.SF24B()
				}
				.padding(.bottom, 8)
				
				Text("막걸리 추천이 더 정확해져요! (선택)")
					.SF14R()
					.foregroundColor(.W50)
					.padding(.bottom, 24)
				
				HStack(spacing: 8) {
					ForEach(0..<3) { button in
						Button(action: {
							self.selected = self.selected.enumerated().map { $0.offset == button }
						}, label: {
							ZStack {
								Rectangle()
									.cornerRadius(12)
									.frame(width: 94, height: 58)
									.foregroundColor(self.selected[button] ? Color.Lilac : Color.DarkBase)
									.overlay(
										RoundedRectangle(cornerRadius: 12)
											.stroke(Color.Lilac, lineWidth: 3)
									)
								Text(self.genders[button])
									.SF20B()
									.foregroundColor(Color.White)
							}
						})
					}
				}
				.padding(.bottom, 24)
				
				TextField("1997", text: $birthDay)
					.frame(width: 200)
					.textFieldStyle(BirthDayTextFieldStyle())
					.keyboardType(.numberPad)
					.onReceive(Just(birthDay)) { newValue in
						let filtered = newValue.filter { "0123456789".contains($0) }
						if filtered != newValue {
							self.birthDay = filtered
						}
						if self.birthDay.count == 5 {
							self.birthDay.removeLast()
						}
					}
					.padding(.bottom, 24)
				
				Spacer()
				
				nextButton()
			}
			if viewModel.fetchLoading {
				ProgressView()
					.modifier(ProgressViewBackground())
					.opacity(0.5)
			}
		}
		.alert(item: $viewModel.alertItem) { alertItem in
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
		.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!), for: .navigationBar)
		.navigationBarBackButtonHidden()
		.background(Color(uiColor: .designSystem(.darkbase)!))
		.fullScreenCover(isPresented: $viewModel.navigationHome, content: {
			SubRootView()
		})
	}
}

private extension SkipGenderAndBirthView {
	@ViewBuilder
	func nextButton() -> some View {
		Button {
			if let idx = selected.firstIndex(of: true) {
				viewModel.skipSignin(nickname: nickName, sex: genders[idx], ageRange: birthDay)
				viewModel.alertItem = AlertItem(title: Text("환영합니다"),
												message: Text("가입이 완료되었어요."),
												dismissButton: .default(Text("확인")) {
					viewModel.navigationHome = true
				})
			} else {
				viewModel.skipSignin(nickname: nickName, sex: "", ageRange: birthDay)
				viewModel.alertItem = AlertItem(title: Text("환영합니다"),
												message: Text("가입이 완료되었어요."),
												dismissButton: .default(Text("확인")) {
					viewModel.navigationHome = true
				})
			}
		} label: {
			RoundedRectangle(cornerRadius: 12)
				.fill(
					Color(uiColor: .designSystem(.goldenyellow)!)
				)
				.frame(height: 50)
				.overlay {
					Text("완료")
						.foregroundColor(.White)
						.SF17R()
				}
				.padding(.bottom, 16)
				.padding(.horizontal, 16)
		}
	}
	
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
