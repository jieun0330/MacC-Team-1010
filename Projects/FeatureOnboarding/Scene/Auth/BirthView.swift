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
	@ObservedObject var viewModel: OnboardingViewModel
	
	@State private var birthDay = ""
	@State private var isAgreed = false
	@State private var adultChk = false
	@State private var showAlert = false
	
	var phoneNumber: String
	
	public init(
		viewModel: OnboardingViewModel,
		phoneNumber: String = ""
	) {
		self.viewModel = viewModel
		self.phoneNumber = phoneNumber
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			Spacer()
			
			Text("본인 확인을 위해")
				.SF24B()
				.padding(.bottom, 4)
			HStack {
				Text("생년월일")
					.foregroundColor(.Primary)
					.SF24B()
				Text("을 입력해주세요")
					.SF24B()
			}
			.padding(.bottom, 8)
			
			Text("본인 확인 이후에 데이터 연동이 가능해져요!")
				.SF14R()
				.foregroundColor(.W50)
				.padding(.bottom, 24)
			
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
				let cleanedPhoneNumber = phoneNumber.replacingOccurrences(of: "-", with: "")
				viewModel.findMatchAccount(phoneNumber: cleanedPhoneNumber, birth: birthDay)
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(
						Color(uiColor: .designSystem(birthDay.count != 6 || !isAgreed ? .w10 :.goldenyellow)!)
					)
					.frame(height: 50)
					.overlay {
						Text("다음")
							.foregroundColor(birthDay.count != 6 || !isAgreed ? .W25 : .White)
							.SF17R()
					}
					.padding(.bottom, 16)
			}
			.disabled(birthDay.count != 6 || !isAgreed)
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
		.modifier(OnboardingBackground())
		.navigationDestination(isPresented: $viewModel.navigationGender) {
			GenderView(viewModel: viewModel, phoneNumber: phoneNumber, birthDay: birthDay)
		}
		.navigationDestination(isPresented: $viewModel.navigationLoadData) {
			LoadDataView(findMatchUserData: viewModel.findMatchUserData ?? FindMatchAccountUserResult())
		}
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
