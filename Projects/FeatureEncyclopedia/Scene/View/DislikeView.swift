//
//  DislikeView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import FeatureInformation

public struct DislikeView: View {
	@StateObject var viewModel = EncyclopediaViewModel(userRepository: DefaultUserRepository())
	
	private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
	
	public var body: some View {
		if viewModel.fetchLoading {
			ProgressView()
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
				.foregroundColor(Color(uiColor: .designSystem(.white)!))
				.background(Color.DarkBase)
				.alert(isPresented: $viewModel.errorState) {
					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
						  dismissButton: .default(Text("확인")))
				}
				.onAppear {
					viewModel.getUserMakFolder(segmentName: "dislike")
				}
		} else {
			if viewModel.makModel.isEmpty {
				VStack(spacing: 20) {
                    Spacer()
					Text("비어있어요..")
						.SF17R()
						.foregroundColor(.W50)
					Image(uiImage: .designSystem(.character)!)
                    Spacer()

				}
			} else {
				ScrollView {
					HStack {
						Text("\((viewModel.makModel).count)개의 막걸리가 아쉬워요")
							.SF12R()
							.foregroundColor(.W50)
						Spacer()
					}
					.padding(.vertical, 10)
					.padding(.leading, 12)
					
					LazyVGrid(columns: columns, spacing: 16, content: {
						ForEach(viewModel.makModel, id: \.self) { mak in
							Button {
								if let id = mak.makSeq {
									viewModel.resultMakHolyId = id
								}
							} label: {
								ThumbnailView(mak: mak, type: .dislike)
									.onAppear {
										if mak == viewModel.makModel.last {
											if !viewModel.isLastPage {
												var offset = viewModel.currentOffset
												offset += 1
												withAnimation {
													viewModel.getUserMakFolder(segmentName: "dislike", offset: offset)
												}
											}
										}
									}
							}
						}
					})
					
				}
				.fullScreenCover(item: $viewModel.resultMakHolyId) { makHolyId in
					InformationView(makHolyId: makHolyId)
				}
			}
		}
	}
}
