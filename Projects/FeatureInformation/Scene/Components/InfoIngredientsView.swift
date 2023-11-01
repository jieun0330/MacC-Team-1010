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
	var ingredients: [String] = ["쌀(국내산/무농약)", "효모", "누룩(밀/국내산)", "정제수", "밀가루(수입산)", "발효미강(미강), 곡자(누룩)", "조효소제(밀), 사카린나트륨(감미료)", "젖산", "식품첨가물혼합제제(충무정제효소, 송천효모)"]
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			
			HStack {
				Text("원재료")
					.font(.style(.SF22B))
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
				Spacer()

			}
			.padding(.vertical, 20)
			
			Text(ingredients.joined(separator: ", "))
				.font(.style(.SF16R))
				.foregroundColor(Color(uiColor: .designSystem(.w85)!))
				.fixedSize(horizontal: false, vertical: true)
				.padding(.bottom, 20)
			
		}
	}
}

struct InfoIngredientsView_Previews: PreviewProvider {
	static var previews: some View {
		InfoIngredientsView()
	}
}
