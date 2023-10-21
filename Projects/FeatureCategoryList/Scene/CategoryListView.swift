//
//  CategoryListView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/20.
//

import SwiftUI
import DesignSystem
import Common
import Core

public struct CategoryListView: View {
	let type: CategoryType
	
	@State var targetTitle: String
	
	public init(type: CategoryType, targetTitle: String) {
		self.type = type
		self.targetTitle = targetTitle
	}

	public var body: some View {
		VStack {
			HashtagView(type: self.type, targetTitle: $targetTitle)
				.padding(.leading, 16)
			
			Spacer()
				.frame(height: 16)
			
			MakgeolliInfoView()
				.padding(.horizontal, 16)
		}
		.background(Color(uiColor: .designSystem(.bgColor)!))
		.navigationTitle(targetTitle)
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton())
	}
}
