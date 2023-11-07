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
	
	public init(makHolyMini: MakHolyMini) {
		self._viewModel = StateObject(wrappedValue: InformationViewModel(makHolyMini: makHolyMini))
	}
	
	public var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				
				TasteScoreView(type: .large,
							   sweetness: viewModel.makHolyMini.sweetness,
							   sourness: viewModel.makHolyMini.sourness,
							   thickness: viewModel.makHolyMini.thickness,
							   freshness: viewModel.makHolyMini.freshness)
				
				InfoMyCommentView(viewModel: viewModel)
				
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
			viewModel.fetchMakHoly()
			viewModel.fetchReactions()
		})
		.actionSheet(isPresented: $viewModel.showActionSheet, content: {
			ActionSheet(title: Text("Action Sheet title"))
		})
	}
}

struct InformationView_Previews: PreviewProvider {
	static var previews: some View {
		InformationView(makHolyMini: MakHolyMini.test1)
	}
}
