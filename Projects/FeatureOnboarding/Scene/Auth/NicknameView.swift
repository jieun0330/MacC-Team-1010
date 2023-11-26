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
	enum NicknameState {
		case normal
		case notduplicate
		case duplicate
	}
	
	@State private var nickName = ""
	@State private var showNickDupli: NicknameState = .normal
	@State private var alertItem: AlertItem?
	@State private var isSkip = false
	
	public init() { }
	
	public var body: some View {
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
				.textFieldStyle(NicknameTextFieldStyle(showNickDupli: showNickDupli))
				.onReceive(Just(nickName)) { newValue in
					if self.nickName.count == 7 {
						self.nickName.removeLast()
					}
				}
			
			switch showNickDupli {
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
									   primaryButton: .cancel(Text("안하기")) {
				isSkip = true
			},
									   secondaryButton: .default(Text("보관하기")) { })
		}, label: {
			Text("건너뛰기").SF14R().foregroundColor(.W25)
		}))
		.modifier(OnboardingBackground())
		.fullScreenCover(isPresented: $isSkip, content: {
			SkipNicknameView()
		})
	}
}

private extension NicknameView {
	@ViewBuilder
	func nextButton() -> some View {
		Button {
			if showNickDupli == .notduplicate {
				self.alertItem = AlertItem(title: Text("완료했어요!"),
										   message: Text("이제 ‘내 정보’의 핸드폰 번호 로그인으로 내 데이터를 불러올 수 있어요!"),
										   dismissButton: .default(Text("확인")) {
					// fullmodal home
				})
			} else {
				// 닉네임 중복 확인
				
				// 중복이면
				// showNickDupli = .duplicate
				
				// 중복아니면
				// showNickDupli = .notduplicate
			}
		} label: {
			RoundedRectangle(cornerRadius: 12)
				.foregroundColor(showNickDupli == .notduplicate ? .Primary : .Lilac)
				.frame(height: 50)
				.overlay {
					Text(showNickDupli == .notduplicate ? "완료" : "닉네임 중복 검사")
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
	
	// 추후에 빼서 alert 2개씩 쓰는 부분에 적용시키기
	struct AlertItem: Identifiable {
		var id = UUID()
		var title: Text
		var message: Text?
		var dismissButton: Alert.Button?
		var primaryButton: Alert.Button?
		var secondaryButton: Alert.Button?
	}
}
