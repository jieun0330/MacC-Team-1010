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
	@State var selectedImage: ImageName = .profileSweet
	
	enum ImageName: String {
		case profileSweet, profileHighlyHydrated, profileThick,
			 profileCarbonicAcid, profileAspartameFree, profileSour
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
						Text("이용약관")
							.foregroundColor(.Primary)
							.SF12B()
						Text("과 ")
							.foregroundColor(.W50)
							.SF12B()
						Text("개인정보처리방침")
							.foregroundColor(.Primary)
							.SF12B()
						Text("에 동의하고 시작합니다.")
							.foregroundColor(.W50)
							.SF12B()
					}
					.padding(.bottom, 16)
					
					NavigationLink {
						CustomizationInfoView(viewModel: viewModel, nickname: $nickname)
							.background(Color(uiColor: .designSystem(.darkbase)!))
							.navigationBarBackButtonHidden(true)
							.navigationBarItems(leading: CustomBackButton())
							.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!),
											   for: .navigationBar)
							.onAppear {
								UserDefaultsSetting.profileImage = selectedImage.rawValue
							}
					} label: {
						RoundedRectangle(cornerRadius: 12)
							.fill(Color(uiColor: .designSystem(.goldenyellow)!))
							.frame(height: 50)
							.overlay {
								Text("다음")
									.foregroundColor(.white)
									.SF17R()
							}
							.padding(.bottom, 16)
					}
				}
				.padding(.horizontal, 16)
				.background(Color(uiColor: .designSystem(.darkbase)!))
				.ignoresSafeArea(.keyboard)
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
				.padding(.bottom, 4)
			Text("님,")
				.SF24B()
		}
		Text("프로필을 만들어보세요!")
			.SF24B()
	}
	
	@ViewBuilder
	func SetUserIconView() -> some View {
		HStack(spacing: 20) {
			Button {
				selectedImage = .profileSweet
			} label: {
				Image(uiImage: .designSystem(.profileSweet)!)
					.opacity(selectedImage == .profileSweet ? 1 : 0.2)
			}
			
			Button {
				selectedImage = .profileThick
			} label: {
				Image(uiImage: .designSystem(.profileThick)!)
					.opacity(selectedImage == .profileThick ? 1 : 0.2)
			}
			
			Button {
				selectedImage = .profileHighlyHydrated
			} label: {
				Image(uiImage: .designSystem(.profileHighlyHydrated)!)
					.opacity(selectedImage == .profileHighlyHydrated ? 1 : 0.2)
			}
		}
		
		Spacer()
			.frame(height: 20)
		
		HStack(spacing: 20) {
			Button {
				selectedImage = .profileCarbonicAcid
			} label: {
				Image(uiImage: .designSystem(.profileCarbonicAcid)!)
					.opacity(selectedImage == .profileCarbonicAcid ? 1 : 0.2)
			}
			Button {
				selectedImage = .profileAspartameFree
			} label: {
				Image(uiImage: .designSystem(.profileAspartameFree)!)
					.opacity(selectedImage == .profileAspartameFree ? 1 : 0.2)
			}
			Button {
				selectedImage = .profileSour
			} label: {
				Image(uiImage: .designSystem(.profileSour)!)
					.opacity(selectedImage == .profileSour ? 1 : 0.2)
			}
		}
	}
}
