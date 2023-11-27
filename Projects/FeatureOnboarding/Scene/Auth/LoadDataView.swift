//
//  LoadDataView.swift
//  FeatureOnboarding
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

public struct LoadDataView: View {
	@State private var showAlert = false
	@State private var isSkip = false
	
	public init() { }
	
	public var body: some View {
		VStack(spacing: 0) {
			Spacer()
			
			HStack {
				Text("이전 데이터를")
					.foregroundColor(.Primary)
					.SF24B()
				Text("발견했어요!")
					.SF24B()
			}
			
			Spacer()
				.frame(height: 24)
			
			Text("이전에 저장했던 데이터를 불러올까요?")
				.foregroundColor(.W85)
				.SF14R()
			
			Spacer()
			
			NavigationLink {
				BirthView()
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color.W10)
					.frame(height: 50)
					.overlay {
						Text("아니오, 새로운 데이터로 시작할게요.")
							.foregroundColor(.White)
							.SF17R()
					}
			}
			.padding(.horizontal, 16)
			.padding(.bottom, 8)
			
			NavigationLink {
				BirthView(isLoadDataState: true)
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color.GoldenYellow)
					.frame(height: 50)
					.overlay {
						Text("네, 이전 데이터를 불러올게요.")
							.foregroundColor(.White)
							.SF17R()
					}
			}
			.padding(.horizontal, 16)
		}
		.navigationBarItems(trailing: Button(action: {
			showAlert = true
		}, label: {
			Text("건너뛰기").SF14R().foregroundColor(.W25)
		}))
		.alert(isPresented: $showAlert) {
			Alert(title: Text("막걸리 정보를 보관할 수 없어요"),
				  message: Text("번호를 입력하지 않으면 기기 변동 시 내 막걸리 정보를 불러올 수 없어요"),
				  primaryButton: .cancel(Text("취소")) { },
				  secondaryButton: .default(Text("건너뛰기")) {
				isSkip = true
			})
		}
		.modifier(OnboardingBackground())
		.fullScreenCover(isPresented: $isSkip, content: {
			SkipNicknameView()
		})
	}
}
