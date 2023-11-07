//
//  InfoIngredientsView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct InfoIngredientsView: View {
	@ObservedObject var viewModel: InformationViewModel
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			
			HStack {
				Text("원재료")
					.font(.style(.SF20B))
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
				Spacer()

			}
			.padding(.vertical, 20)
			
			Text(viewModel.makHoly.description)
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: .designSystem(.w85)!))
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.fixedSize(horizontal: false, vertical: true)
				.padding(.bottom, 20)
			
		}
	}
}
