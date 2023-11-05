//
//  ContentView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

public struct InformationView: View {
	
	@StateObject var viewModel: InformationViewModel
	
	public init(makHoly: MakHoly) {
		self._viewModel = StateObject(wrappedValue: InformationViewModel(makHoly: makHoly))
	}
	
	public var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				
				InfoMyCommentView(viewModel: viewModel)
				
				TasteScoreView(type: .large, sweetness: -1, sourness: 1, thickness: 2, freshness: 5)
				
				LikeControllerView()
					.padding(.horizontal, 16)
				
				InfoAwardsView()
					.padding(.leading, 16)
				
				InfoIngredientsView()
					.padding(.horizontal, 16)
				
				InfoLinkView(brewery: Brewery.mockADA)
					.padding(.horizontal, 16)
				
			}
		}
		.onAppear(perform: {
			viewModel.fetchDatas()
		})
		.actionSheet(isPresented: $viewModel.showActionSheet, content: {
			ActionSheet(title: Text("Action Sheet title"))
		})
	}
}

struct InformationView_Previews: PreviewProvider {
	static var previews: some View {
		InformationView(makHoly: MakHoly.test1)
	}
}
