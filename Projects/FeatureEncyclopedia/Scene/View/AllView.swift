//
//  AllView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//


import SwiftUI
import Core
import FeatureInformation

enum EncyclopediaType {
	case all
	case like
	case dislike
	case bookmark
	case comment
}

struct AllView: View {
	@StateObject var viewModel = EncyclopediaViewModel(userRepository: DefaultUserRepository())
	
	private let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 3)
	private let type = EncyclopediaType.all
	private let drink = User.user1.likes + User.user1.dislikes
	
	public var body: some View {
		if viewModel.fetchLoading {
			ProgressView()
				.modifier(ProgressViewBackground())
				.alert(isPresented: $viewModel.errorState) {
					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
						  dismissButton: .default(Text("확인")))
				}
				.onAppear {
					viewModel.getUserMakFolder()
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
				ScrollView(showsIndicators: false) {
					HStack {
						Text("\(viewModel.totalMak)개 중 \(viewModel.totalElement)개를 기록했어요!")
							.SF12R()
							.foregroundColor(.W50)
						Spacer()
					}
					.padding(.top, 12)
					.padding(.leading, 16)
					
					LazyVGrid(columns: columns, spacing: 16, content: {
						ForEach(viewModel.makModel, id: \.self) { mak in
							Button {
								if let id = mak.makSeq {
									viewModel.resultMakHolyId = id
								}
							} label: {
								ThumbnailView(mak: mak, type: .all)
									.onAppear {
										if mak == viewModel.makModel.last {
											if !viewModel.isLastPage {
												var offset = viewModel.currentOffset
												offset += 1
												withAnimation {
													viewModel.nextGetUserMakFolder(offset: offset)
												}
											}
										}
									}
							}
							.padding(.horizontal, 8)
						}
					})
					.padding(.horizontal, 8)
				}
				.fullScreenCover(item: $viewModel.resultMakHolyId) { makHolyId in
					InformationView(makHolyId: makHolyId,
									mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																			 myTerm: "전체"))
				}
			}
		}
	}
}
