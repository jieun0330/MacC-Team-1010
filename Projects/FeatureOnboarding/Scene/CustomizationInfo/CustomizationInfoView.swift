//
//  CustomizationInfoView.swift
//  FeatureOnboarding
//
//  Created by Kim SungHun on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Combine
import DesignSystem
import FeatureHome
import FeatureSearch
import FeatureEncyclopedia
import FeatureProfile

struct CustomizationInfoView: View {
	@ObservedObject var viewModel: OnboardingViewModel
	
	@State var isNavigationRoot = false
	@State var sexType: SexType = .none
	@State var yearOfBirth: String = ""
	
	@Binding var nickname: String
	
	var body: some View {
		ZStack {
			if viewModel.fetchLoading {
				ProgressView()
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
			}
			VStack(spacing: 0) {
				MakeProfileView()
				
				Spacer()
					.frame(height: 36)
				
				SetSexTypeView()
				
				Spacer()
					.frame(height: 40)
				
				TextField("2004 (출생년도)", text: $yearOfBirth)
					.font(.style(.SF20B))
					.keyboardType(.numberPad)
					.onReceive(Just(yearOfBirth)) { newValue in
						let filtered = newValue.filter { "0123456789".contains($0) }
						if filtered != newValue {
							self.yearOfBirth = filtered
						}
						if self.yearOfBirth.count == 5 {
							self.yearOfBirth.removeLast()
						}
					}
					.underlined()
				
				Spacer()
				
				Button {
					viewModel.skipSignin(nickname: nickname, sex: sexType.description,
										 ageRange: yearOfBirth)
				} label: {
					RoundedRectangle(cornerRadius: 12)
						.fill(Color(uiColor: .designSystem(
							!yearOfBirth.isEmpty && sexType != .none ? .goldenyellow : .w10)!)
						)
						.frame(height: 50)
						.overlay {
							Text("완료")
								.foregroundColor(.white)
								.SF17R()
						}
				}
				.padding(.bottom, 16)
				.disabled(!yearOfBirth.isEmpty && sexType != .none ? false : true)
			}
			.navigationDestination(isPresented: $viewModel.navigationState) {
				TabView {
					HomeView()
						.tabItem {
							Image(uiImage: .designSystem(.home)!)
							Text("홈")
								.font(.style(.SF10B))
						}
					SearchView()
						.tabItem {
							Image(uiImage: .designSystem(.search)!)
							Text("검색")
								.font(.style(.SF10B))
						}
					EncyclopediaView()
						.tabItem {
							Image(uiImage: .designSystem(.heart)!)
							Text("내 막걸리")
								.font(.style(.SF10B))
						}
					ProfileView()
						.tabItem {
							Image(uiImage: .designSystem(.person)!)
							Text("내 정보")
								.font(.style(.SF10B))
						}
				}
				.navigationBarBackButtonHidden()
			}
			.padding(.horizontal, 16)
		}
		.alert(isPresented: $viewModel.errorState) {
			Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
				  dismissButton: .default(Text("확인")))
		}
	}
}

private extension CustomizationInfoView {
	@ViewBuilder
	func MakeProfileView() -> some View {
		Spacer()
			.frame(height: 56)
		
		HStack(spacing: 0) {
			Text(nickname)
				.SF24B()
				.foregroundColor(.Primary2)
			Text("님의")
				.SF24B()
		}
		.padding(.bottom, 4)
		
		Text("맞춤 정보를 알려주세요")
			.SF24B()
		
		Spacer()
			.frame(height: 10)
		
		Text("더 나은 막걸리를 추천해드릴게요")
			.foregroundColor(.W50)
			.SF14R()
	}
	
	@ViewBuilder
	func SetSexTypeView() -> some View {
		HStack(spacing: 16) {
			Button {
				sexType = .male
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(sexType == .male
													   ? .lilac : .w10)!))
					.frame(height: 50)
					.overlay {
						Text("남성")
							.foregroundColor(.white)
							.SF17R()
					}
			}
			Button {
				sexType = .female
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(sexType == .female
													   ? .lilac : .w10)!))
					.frame(height: 50)
					.overlay {
						Text("여성")
							.foregroundColor(.white)
							.SF17R()
					}
			}
			Button {
				sexType = .etc
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(sexType == .etc
													   ? .lilac : .w10)!))
					.frame(height: 50)
					.overlay {
						Text("기타")
							.foregroundColor(.white)
							.SF17R()
					}
			}
		}
	}
}
