//
//  NicknameView.swift
//  FeatureOnboarding
//
//  Created by 박지은 on 11/25/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import Combine

public struct NicknameView: View {
	@ObservedObject var viewModel: OnboardingViewModel
	
	@State private var nickName = ""
	@State private var isMain = false
	
	var phoneNumber: String
	var birthDay: String
	var sex: String
	
	public init(
		viewModel: OnboardingViewModel,
		phoneNumber: String,
		birthDay: String,
		sex: String
	) {
		self.viewModel = viewModel
		self.phoneNumber = phoneNumber
		self.birthDay = birthDay
		self.sex = sex
	}
	
	public var body: some View {
		NavigationStack {
			VStack(alignment: .center, spacing: 0) {
				Spacer()
				
				HStack(spacing: 0) {
					Text("닉네임")
						.foregroundColor(.Primary)
						.SF24B()
					Text("을 입력해주세요")
						.SF24B()
				}
				.padding(.bottom, 24)
				
				TextField("걸쭉한막걸리", text: $nickName)
					.frame(width: 300)
					.padding(.bottom, 8)
					.keyboardType(.default)
					.textFieldStyle(NicknameTextFieldStyle(showNickDupli: viewModel.showNickDupli))
					.onChange(of: nickName) { _ in
						viewModel.showNickDupli = .normal
					}
					.onReceive(Just(nickName)) { newValue in
						self.nickName = newValue.replacingOccurrences(of: " ", with: "")
						if self.nickName.count == 7 {
							self.nickName.removeLast()
						}
					}
				
				switch viewModel.showNickDupli {
				case .normal:
					EmptyView()
				case .duplicate:
					Text("중복된 닉네임이에요")
						.SF12B()
						.foregroundColor(.Alert)
				case .notduplicate:
					Text("사용할 수 있는 닉네임이에요!")
						.SF12B()
						.foregroundColor(.Primary2)
				}
				
				Spacer()
				
				HStack(spacing: 0) {
					Link(destination: URL(string: "https://yawner.notion.site/4b903a09999046d78a2ce8d35fcd8992?pvs=4")!) {
						Text("이용약관")
							.foregroundColor(.Primary2)
					}
					Text("과 ")
						.foregroundColor(.W50)
					Link(destination: URL(string: "https://yawner.notion.site/24c563728a9c44db8e81b779ac41f425?pvs=4")!) {
						Text("개인정보처리방침")
							.foregroundColor(.Primary2)
					}
					Text("에 동의하고 시작합니다.")
						.foregroundColor(.W50)
				}
				.font(.style(.SF12B))
				.padding(.bottom, 16)
				
				nextButton()
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
			.fullScreenCover(isPresented: $isMain, content: {
				SubRootView()
			})
		}
	}
}

private extension NicknameView {
	@ViewBuilder
	func nextButton() -> some View {
		Button {
			if viewModel.showNickDupli == .notduplicate {
				Task {
					do {
						try await viewModel.phoneSignin(nickname: nickName,
														sex: sex,
														phoneNumber: phoneNumber,
														birth: birthDay)
						viewModel.alertItem = AlertItem(title: Text("완료했어요!"),
														message: Text("이제 ‘내 정보’의 핸드폰 번호 로그인으로 내 데이터를 불러올 수 있어요!"),
														dismissButton: .default(Text("확인")) {
							isMain = true
						})
					} catch {
						viewModel.errorState = true
					}
				}
			} else {
				viewModel.checkNickname(nickname: nickName)
			}
		} label: {
			RoundedRectangle(cornerRadius: 12)
				.foregroundColor(viewModel.showNickDupli == .notduplicate ? .Primary : .Lilac)
				.frame(height: 50)
				.overlay {
					Text(viewModel.showNickDupli == .notduplicate ? "완료" : "닉네임 중복 검사")
						.foregroundColor(.White)
						.SF17R()
				}
				.padding(.bottom, 16)
		}
		.disabled(nickName == "")
	}
	
	struct NicknameTextFieldStyle: TextFieldStyle {
		var showNickDupli: NicknameState = .normal
		
		func _body(configuration: TextField<Self._Label>) -> some View {
			ZStack {
				Rectangle()
					.cornerRadius(12)
					.frame(width: 300, height: 58)
					.foregroundColor(.DarkBase)
					.overlay(
						RoundedRectangle(cornerRadius: 12)
							.stroke(showNickDupli == .duplicate ? Color.Alert :
										showNickDupli == .notduplicate ? Color.Lilac :
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
