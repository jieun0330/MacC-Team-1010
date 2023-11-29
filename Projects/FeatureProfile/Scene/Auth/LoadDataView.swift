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
	@Environment(\.dismiss) private var dismiss
	
	@StateObject var viewModel = ProfileViewModel(
		userRepository: DefaultUserRepository(),
		authRepository: DefaultAuthRepository(),
		accountRepository: DefaultAccountRepository()
	)
	
	@State private var showAlert = false
	
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
				.frame(height: 24)
			
			Text("이전 데이터를 불러오면 기존 데이터는 사라집니다.")
				.SF14R()
				.foregroundColor(.Primary2)
			
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
					showAlert = true
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
		.alert(isPresented: $showAlert) {
			Alert(title: Text("불러왔어요!"), message: Text("데이터를 성공적으로 불러왔어요. 앱을 재시작 해주세요."),
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
