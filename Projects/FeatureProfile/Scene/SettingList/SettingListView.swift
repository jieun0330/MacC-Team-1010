//
//  SettingListView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct SettingListView: View {
	@ObservedObject var viewModel: ProfileViewModel
	
	@State var deleteAlert = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 14) {
			VStack(alignment: .center, spacing: 0) {
				Link(destination: URL(string: "https://forms.gle/wBx1vmudpuGKcxDbA")!) {
					HStack {
						Text("문의하기")
							.font(.style(.SF17R))
						Spacer()
						Image(systemName: "chevron.right")
							.font(.style(.SF20B))
					}
					.foregroundColor(.White)
				}
			}
			.padding(.top, 16)
			.padding(.horizontal, 16)
			
			DividerView()
				.padding(.horizontal, 16)
			
			VStack(alignment: .center, spacing: 0) {
				Link(destination: URL(string: "https://forms.gle/hrDZnbBxABgNEkhF8")!) {
					HStack {
						Text("의견 보내기")
							.font(.style(.SF17R))
						Spacer()
						Image(systemName: "chevron.right")
							.font(.style(.SF20B))
					}
					.foregroundColor(.White)
				}
			}
			.padding(.horizontal, 16)
			
			DividerView()
				.padding(.horizontal, 16)
			
			VStack(alignment: .center, spacing: 0) {
				Link(destination: URL(string: "https://yawner.notion.site/4b903a09999046d78a2ce8d35fcd8992?pvs=4")!) {
					HStack {
						Text("이용약관")
							.font(.style(.SF17R))
						Spacer()
						Image(systemName: "chevron.right")
							.font(.style(.SF20B))
					}
					.foregroundColor(.White)
				}
			}
			.padding(.horizontal, 16)
			
			DividerView()
				.padding(.horizontal, 16)
			
			VStack(alignment: .center, spacing: 0) {
				Link(destination: URL(string: "https://yawner.notion.site/24c563728a9c44db8e81b779ac41f425?pvs=4")!) {
					HStack {
						Text("개인정보처리방침")
							.font(.style(.SF17R))
						Spacer()
						Image(systemName: "chevron.right")
							.font(.style(.SF20B))
					}
					.foregroundColor(.White)
				}
			}
			.padding(.horizontal, 16)
			
			DividerView()
				.padding(.horizontal, 16)
			
			VStack(spacing: 0) {
				HStack {
					Text("버전정보")
						.font(.style(.SF17R))
					Spacer()
					Text("1.1.0")
						.font(.style(.SF12B))
				}
			}
			.padding(.horizontal, 16)
			.padding(.bottom, 24)
			
			Text("탈퇴하기")
				.foregroundColor(.Alert)
				.font(.style(.SF12B))
				.padding(.horizontal, 16)
				.onTapGesture {
					deleteAlert = true
				}
		}
		.alert(isPresented: $deleteAlert) {
			Alert(title: Text("정말 탈퇴하시겠어요?"), message: Text("탈퇴 시 계정의 모든 정보가 삭제되며, 복구되지 않아요. 탈퇴 시 앱이 종료돼요."),
				  primaryButton: .cancel(
					Text("취소"),
					action: {}
				  ), secondaryButton: .destructive(
					Text("탈퇴"),
					action: {
						viewModel.deleteUserAccount()
					}
				  ))
		}
	}
}
