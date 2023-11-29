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
import Utils

public struct LoadDataView: View {
	@StateObject var viewModel = OnboardingViewModel(
		userRepository: DefaultUserRepository(),
		authRepository: DefaultAuthRepository(),
		accountRepository: DefaultAccountRepository()
	)
	
	@State private var isMain = false
	
	var findMatchUserData: FindMatchAccountUserResult
	
	public init(findMatchUserData: FindMatchAccountUserResult) {
		self.findMatchUserData = findMatchUserData
	}
	
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
			
			Button {
				Task {
					try KeyChainManager.shared.create(account: .userId,
													  data: "\(findMatchUserData.userID ?? 0)")
					try KeyChainManager.shared.create(account: .profileImage,
													  data: "\("profileIcon1")")
					try KeyChainManager.shared.create(account: .nickname,
													  data: "\(findMatchUserData.userNickName ?? "")")
					try KeyChainManager.shared.create(account: .phoneBackNum,
													  data: "\(findMatchUserData.userPhone ?? "")")
					isMain = true
				}
			} label: {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color.GoldenYellow)
					.frame(height: 50)
					.overlay {
						Text("데이터 불러오기")
							.foregroundColor(.White)
							.SF17R()
					}
			}
			.padding(.horizontal, 16)
		}
		.modifier(OnboardingBackground())
		.fullScreenCover(isPresented: $isMain, content: {
			SubRootView()
		})
	}
}
