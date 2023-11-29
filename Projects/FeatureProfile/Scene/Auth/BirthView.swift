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
	@Environment(\.dismiss) private var dismiss
	
	@ObservedObject var viewModel: ProfileViewModel
	
	@State private var birthDay = ""
	@State private var isAgreed = false
	
	var phoneNumber: String
	
	public init(
		viewModel: ProfileViewModel,
		phoneNumber: String = ""
	) {
		self.viewModel = viewModel
		self.phoneNumber = phoneNumber
	}
	
	public var body: some View {
		ZStack {
			VStack(spacing: 0) {
				Spacer()
				HStack(spacing: 0) {
					Text("생년월일")
						.foregroundColor(.Primary)
						.SF24B()
					Text("을 입력해주세요")
						.SF24B()
				}
				.padding(.bottom, 8)
				
				Text("휴대폰 번호 변경 시에도 계정을 보호합니다")
					.SF14R()
					.foregroundColor(.W50)
					.padding(.bottom, 4)
				Text("수정이 불가하니 정확하게 입력해주세요")
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
					viewModel.findMatchAccount(phoneNumber: phoneNumber, birth: birthDay)
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
			if viewModel.fetchLoading {
				ProgressView()
					.modifier(ProgressViewBackground())
					.opacity(0.5)
			}
		}
		.alert(isPresented: $viewModel.savedAlert) {
			Alert(title: Text("저장했어요!"), message: Text("데이터를 성공적으로 저장했어요. 앱을 재시작 해주세요."),
				  dismissButton: .default(Text("확인"), action: {
				UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
				DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
					exit(0)
				}
			}))
		}
		.navigationBarItems(trailing: Button(action: {
			dismiss()
		}, label: {
			Image(systemName: "xmark.circle.fill")
				.resizable()
				.foregroundColor(.W25)
				.frame(width: 24, height: 24)
		}))
		.modifier(OnboardingBackground())
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
