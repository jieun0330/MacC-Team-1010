//
//  CategoryListView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/20.
//

import SwiftUI
import DesignSystem
import Common

public struct CategoryListView: View {
	public init() { }

	public var body: some View {
		VStack {
			HashtagView()
				.padding(.leading, 16)
			
			Spacer()
				.frame(height: 16)
			
			MakgeolliInformationView()
				.padding(.horizontal, 16)
		}
		.background(Color(uiColor: .designSystem(.bgColor)!))
		.navigationTitle("맛맛맛")
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton())
	}
}

struct CategoryListView_Previews: PreviewProvider {
	static var previews: some View {
		CategoryListView()
	}
}
