//
//  MakgeolliInformationView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct MakgeolliInfoView: View {
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			ForEach(MockData.createMockMakgeolli(), id: \.self) { data in
				MakgeolliInfoSingleView(makgeolliData: data)
					.background(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
					.cornerRadius(10)
			}
		}
		.background(Color(uiColor: .designSystem(.bgColor)!))
	}
}

struct MakgeolliInformationView_Previews: PreviewProvider {
	static var previews: some View {
		MakgeolliInfoView()
	}
}
