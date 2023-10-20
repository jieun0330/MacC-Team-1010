//
//  HashtagView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Common

struct HashtagView: View {
	@State var selectedType: CharacteristicsType = .sweet
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 10) {
				ForEach(CharacteristicsType.allCases, id: \.self) { characteristics in
					HashtagSingleView(selected: $selectedType, title: characteristics)
				}
			}
		}
	}
}

struct HashtagView_Previews: PreviewProvider {
	static var previews: some View {
		HashtagView()
	}
}
