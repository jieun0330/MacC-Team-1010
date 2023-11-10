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

struct MakgeolliInfoView: View {
	@ObservedObject var viewModel: CategoryViewModel
	
	@State var showAlert = false
	
	let type: CategoryType
	let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
	let targetTitle: [CharacteristicsType]
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			ScrollViewReader { reader in
				HStack(spacing: 4) {
					Image(systemName: "questionmark.circle.fill")
						.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					Button {
						showAlert = true
					} label: {
						Text("리스트 순서가 궁금하신가요")
							.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					}
					.alert(isPresented: $showAlert) {
						Alert(title: Text("추천순으로 정렬"), message: Text("데이터베이스에 등록된 순서대로 리스트에 보여져요. 추천순으로 보여드릴 수 있도록 준비중이니 업데이트 될 때까지 조금만 기다려주세요!"),
							  dismissButton: .default(Text("확인")))
					}
					Spacer()
					Text("추천순")
						.foregroundColor(Color(uiColor: .designSystem(.primary)!))
				}
				.font(.style(.SF12R))
				.padding(.horizontal, 8)
				.padding(.vertical, 16)
				
				LazyVGrid(columns: columns) {
					ForEach(viewModel.makHolys, id: \.self) { data in
						MakgeolliInfoSingleView(makHoly: data)
							.padding(.horizontal, 8)
							.padding(.bottom, 30)
							.onAppear {
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
