//
//  EditProfileView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/11/28.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Core
import Combine
import DesignSystem
import Utils

struct EditProfileView: View {
	@Environment(\.dismiss) private var dismiss
	
	@ObservedObject var viewModel: ProfileViewModel
	
	@State private var nickName = ""
	@State private var selectedProfileIcon = KeyChainManager.shared.read(account: .profileImage)
	
	var body: some View {
		ZStack {
			VStack(alignment: .center, spacing: 0) {
				Spacer()
				
				HStack(spacing: 0) {
					Text("프로필")
						.foregroundColor(.Primary)
						.SF24B()
					Text("을 편집해보세요")
						.SF24B()
				}
				.padding(.bottom, 24)
				
				TextField(KeyChainManager.shared.read(account: .nickname), text: $nickName)
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
				
				HStack(spacing: 16) {
					Button {
						selectedProfileIcon = "profileIcon1"
					} label: {
						Image(uiImage: .designSystem(.profileIcon1)!)
							.opacity(selectedProfileIcon == "profileIcon1" ? 1.0 : 0.5)
					}
					Button {
						selectedProfileIcon = "profileIcon2"
					} label: {
						Image(uiImage: .designSystem(.profileIcon2)!)
							.opacity(selectedProfileIcon == "profileIcon2" ? 1.0 : 0.5)
					}
					Button {
						selectedProfileIcon = "profileIcon3"
					} label: {
						Image(uiImage: .designSystem(.profileIcon3)!)
							.opacity(selectedProfileIcon == "profileIcon3" ? 1.0 : 0.5)
					}
					Button {
						selectedProfileIcon = "profileIcon4"
					} label: {
						Image(uiImage: .designSystem(.profileIcon4)!)
							.opacity(selectedProfileIcon == "profileIcon4" ? 1.0 : 0.5)
					}
				}
				.padding(.top, 24)
				.padding(.bottom, 16)
				
				HStack(spacing: 16) {
					Button {
						selectedProfileIcon = "profileIcon5"
					} label: {
						Image(uiImage: .designSystem(.profileIcon5)!)
							.opacity(selectedProfileIcon == "profileIcon5" ? 1.0 : 0.5)
					}
					Button {
						selectedProfileIcon = "profileIcon6"
					} label: {
						Image(uiImage: .designSystem(.profileIcon6)!)
							.opacity(selectedProfileIcon == "profileIcon6" ? 1.0 : 0.5)
					}
					Button {
						selectedProfileIcon = "profileIcon7"
					} label: {
						Image(uiImage: .designSystem(.profileIcon7)!)
							.opacity(selectedProfileIcon == "profileIcon7" ? 1.0 : 0.5)
					}
					Button {
						selectedProfileIcon = "profileIcon8"
					} label: {
						Image(uiImage: .designSystem(.profileIcon8)!)
							.opacity(selectedProfileIcon == "profileIcon8" ? 1.0 : 0.5)
					}
				}
				
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
		.modifier(NavigationBarBackground())
	}
}

private extension EditProfileView {
	@ViewBuilder
	func nextButton() -> some View {
		Button {
			if viewModel.showNickDupli == .notduplicate {
				Task {
					do {
						try await viewModel.modifyUserNickname(nickname: nickName,
															   selectedProfileIcon: selectedProfileIcon)
						
						viewModel.alertItem = AlertItem(title: Text("완료했어요!"),
														message: Text("성공적으로 프로필 정보가 변경되었어요."),
														dismissButton: .default(Text("확인")) {
							dismiss()
						})
					} catch {
						viewModel.alertItem = AlertItem(title: Text("네트워크 에러"),
														message: Text("인터넷 연결상태를 확인해주세요."),
														dismissButton: .default(Text("확인")))
					}
				}
			} else {
				Task {
					try await viewModel.checkNickname(nickname: nickName)
				}
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
