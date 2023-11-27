//
//  MakgeolliInformationView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import FeatureInformation

struct MakgeolliInfoView: View {
	@ObservedObject var viewModel: CategoryViewModel
	
	@State var showAlert = false
	
	let type: CategoryType
	let mpTerm: String
	let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 2)
	let targetTitle: [CharacteristicsType]
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			ScrollViewReader { reader in
				if type != .event && type != .new {
					HStack(spacing: 4) {
						Button {
							showAlert = true
						} label: {
							Text("어떤 순서로 정렬되나요")
								.foregroundColor(Color(uiColor: .designSystem(.w50)!))
						}
						Image(systemName: "questionmark.circle.fill")
							.foregroundColor(Color(uiColor: .designSystem(.w50)!))
						Spacer()
						Menu {
							Button {
								viewModel.sortText = "추천순"
								viewModel.initFetchCategoryMakgeolli(sort: nil,
																	 offset: nil, categories: targetTitle)
							} label: {
								Text("추천순")
							}
							Button {
								viewModel.sortText = "높은 도수순"
								viewModel.initFetchCategoryMakgeolli(sort: "highAlcohol",
																	 offset: nil, categories: targetTitle)
							} label: {
								Text("높은 도수순")
							}
							Button {
								viewModel.sortText = "낮은 도수순"
								viewModel.initFetchCategoryMakgeolli(sort: "lowAlcohol",
																	 offset: nil, categories: targetTitle)
							} label: {
								Text("낮은 도수순")
							}
						} label: {
							HStack(spacing: 4) {
								Text(viewModel.sortText)
									.SF12B()
									.foregroundColor(Color(uiColor: .designSystem(.primary)!))
								Image(systemName: "chevron.up.chevron.down")
									.font(.style(.SF12B))
									.foregroundColor(Color(uiColor: .designSystem(.primary)!))
							}
						}
					}
					.alert(isPresented: $showAlert) {
						Alert(title: Text("추천순으로 정렬"), message: Text("다른 유저들의 '좋았어요' 평가가 많을수록, 그리고 최근에 나온 막걸리일수록 리스트 상단에 정렬돼요."),
							  dismissButton: .default(Text("확인")))
					}
					.font(.style(.SF12R))
					.padding(.horizontal, 8)
					.padding(.vertical, 16)
				}
				if type != .event && viewModel.makHolys.isEmpty {
					VStack(spacing: 20) {
						Text("검색 결과가 없어요..")
							.SF17R()
							.foregroundColor(.W50)
						Image(uiImage: .designSystem(.character)!)
					}
				} else {
					LazyVGrid(columns: columns, spacing: 0) {
						ForEach(type == .event ? MakContent.mockDatas : viewModel.makHolys, id: \.self) { data in
							MakgeolliInfoSingleView(viewModel: viewModel, makHoly: data)
								.padding(.horizontal, 8)
								.padding(.bottom, 16)
								.onAppear {
									if type != .event {
										if data == viewModel.makHolys.last {
											if !viewModel.isLastPage {
												var offset = viewModel.currentOffset
												offset += 1
												withAnimation {
													viewModel.nextFetchCategoryMakgeolli(sort: nil,
																						 offset: offset,
																						 categories: targetTitle)
												}
											}
										}
									}
								}
						}
					}
				}
			}
		}
		.fullScreenCover(item: $viewModel.resultMakHolyId) { makHolyId in
			switch type {
			case .characteristics:
				InformationView(makHolyId: makHolyId, 
								mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																		 hastagTerm: mpTerm))
			case .event:
				InformationView(makHolyId: makHolyId, 
								mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																		 eventTerm: mpTerm))
			case .new:
				InformationView(makHolyId: makHolyId, 
								mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																		 previousView: .newItemView))
			case .comment:
				// 실행되지 않을거임
				InformationView(makHolyId: makHolyId,
								mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																		 previousView: .newCommentView))
			}
		}
	}
}
