//
//  LikeView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

// 좋았어요 뷰
public struct LikeView: View {
	@ObservedObject var viewModel: EncyclopediaViewModel
	
	@State var viewOpacityValue = 0.0
	
	private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
	public var body: some View {
		ScrollView {
			HStack {
				Text("\((viewModel.makModel.filter { $0.reactionLike == "LIKE" }).count)개의 막걸리가 좋았어요")
					.SF12R()
					.foregroundColor(.W50)
				Spacer()
			}
			.padding(.vertical, 10)
			.padding(.leading, 12)
			
			LazyVGrid(columns: columns, spacing: 16, content: {
				ForEach(viewModel.makModel, id: \.self) { mak in
					if mak.reactionLike == "LIKE" {
						ThumbnailView(mak: mak, type: .like)
					}
				}
			})
		}
		.background(Color.DarkBase)
		.opacity(viewOpacityValue)
		.onAppear {
			print("111 LikeView onAppear")
			self.viewOpacityValue = 0.0
			withAnimation(.easeInOut(duration: 2.0)) {
				self.viewOpacityValue = 1.0
			}
		}

		
//		if viewModel.fetchLoading {
//			ProgressView()
//				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//				.foregroundColor(Color(uiColor: .designSystem(.white)!))
//				.background(Color.DarkBase)
//				.alert(isPresented: $viewModel.errorState) {
//					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
//						  dismissButton: .default(Text("확인")))
//				}
//		} else {
//			ScrollView {
//				HStack {
//					Text("\((viewModel.makModel.filter { $0.reactionLike == "LIKE" }).count)개의 막걸리가 좋았어요")
//						.SF12R()
//						.foregroundColor(.W50)
//					Spacer()
//				}
//				.padding(.vertical, 10)
//				.padding(.leading, 12)
//
//				LazyVGrid(columns: columns, spacing: 16, content: {
//					ForEach(viewModel.makModel, id: \.self) { mak in
//						if mak.reactionLike == "LIKE" {
//							ThumbnailView(mak: mak, type: .like)
//						}
//					}
//				})
//			}
//			.opacity(viewOpacityValue)
//			.onAppear {
//				self.viewOpacityValue = 0.0
//				withAnimation(.easeInOut(duration: 2.0)) {
//					self.viewOpacityValue = 1.0
//				}
//			}
//		}
	}
}
