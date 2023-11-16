//
//  OnboardingView.swift
//  FeatureOnboarding
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Combine
import DesignSystem
import Utils

public struct OnboardingView: View {
	@StateObject var viewModel = OnboardingViewModel(userRepository: DefaultUserRepository())
	
	@State var nickname: String
	@State var selectedImage: ImageName = .additive
	@State var isNavigation = false
	
	enum ImageName: String {
		case additive, refresh, sour,
			 sweet, thick, free
	}
	
	public init (nickname: String) {
		self.nickname = nickname
	}
	
	public var body: some View {
		NavigationStack {
			ZStack {
				VStack(spacing: 0) {
					MakeProfileView(name: $nickname)
					
					Spacer()
						.frame(height: 40)
					
					TextField("닉네임을 입력해주세요", text: $nickname)
						.onChange(of: nickname) { newValue in
							self.nickname = newValue.filter { !$0.isWhitespace }
						}
						.onReceive(Just(nickname)) { newValue in
							if newValue.count > 6 {
								nickname.removeLast()
							}
						}
						.font(.style(.SF20B))
						.underlined()
					
					Spacer()
						.frame(height: 80)
					
					SetUserIconView()
					
					Spacer()
					
					HStack(spacing: 0) {
						Link(destination: URL(string: "https://yawner.notion.site/4b903a09999046d78a2ce8d35fcd8992?pvs=4")!) {
							Text("이용약관")
								.foregroundColor(.Primary)
								.SF12B()
						}
						Text("과 ")
							.foregroundColor(.W50)
							.SF12B()
						Link(destination: URL(string: "https://yawner.notion.site/24c563728a9c44db8e81b779ac41f425?pvs=4")!) {
							Text("개인정보처리방침")
								.foregroundColor(.Primary)
								.SF12B()
						}
						Text("에 동의하고 시작합니다.")
							.foregroundColor(.W50)
							.SF12B()
					}
					.padding(.bottom, 16)
					
					Button {
						isNavigation = true
					} label: {
						RoundedRectangle(cornerRadius: 12)
							.fill(Color(uiColor: .designSystem(nickname.isEmpty ? .w10 :.goldenyellow)!))
							.frame(height: 50)
							.overlay {
								Text("다음")
									.foregroundColor(.white)
									.SF17R()
							}
							.padding(.bottom, 16)
					}
					.disabled(nickname.isEmpty ? true : false)
				}
				.padding(.horizontal, 16)
				.background(Color(uiColor: .designSystem(.darkbase)!))
				.ignoresSafeArea(.keyboard)
				.navigationDestination(isPresented: $isNavigation) {
					CustomizationInfoView(viewModel: viewModel, nickname: $nickname)
						.background(Color(uiColor: .designSystem(.darkbase)!))
						.navigationBarBackButtonHidden(true)
						.navigationBarItems(leading: CustomBackButton())
						.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!),
										   for: .navigationBar)
						.onAppear {
							UserDefaultsSetting.profileImage = selectedImage.rawValue
						}
				}
			}
			.onTapGesture {
				self.hideKeyboard()
			}
		}
	}
}

private extension OnboardingView {
	@ViewBuilder
	func MakeProfileView(name: Binding<String>) -> some View {
		Spacer()
			.frame(height: 100)
		
		HStack(spacing: 0) {
			Text(name.wrappedValue)
				.SF24B()
				.foregroundColor(.Primary2)
			Text("님,")
				.SF24B()
		}
		.padding(.bottom, 4)
		
		Text("프로필을 만들어보세요!")
			.SF24B()
	}
	
	@ViewBuilder
	func SetUserIconView() -> some View {
		HStack(spacing: 20) {
			Button {
				selectedImage = .additive
			} label: {
				Image(uiImage: .designSystem(.additive)!)
					.opacity(selectedImage == .additive ? 1 : 0.2)
			}
			
			Button {
				selectedImage = .refresh
			} label: {
				Image(uiImage: .designSystem(.refresh)!)
					.opacity(selectedImage == .refresh ? 1 : 0.2)
			}
			
			Button {
				selectedImage = .sour
			} label: {
				Image(uiImage: .designSystem(.sour)!)
					.opacity(selectedImage == .sour ? 1 : 0.2)
			}
		}
		
		Spacer()
			.frame(height: 20)
		
		HStack(spacing: 20) {
			Button {
				selectedImage = .sweet
			} label: {
				Image(uiImage: .designSystem(.sweet)!)
					.opacity(selectedImage == .sweet ? 1 : 0.2)
			}
			Button {
				selectedImage = .thick
			} label: {
				Image(uiImage: .designSystem(.thick)!)
					.opacity(selectedImage == .thick ? 1 : 0.2)
			}
			Button {
				selectedImage = .free
			} label: {
				Image(uiImage: .designSystem(.free)!)
					.opacity(selectedImage == .free ? 1 : 0.2)
			}
		}
	}
}
