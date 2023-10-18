//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/06.
//

import SwiftUI
import Core
import DesignSystem

public struct MainView: View {
	
	public init() {}
	
	public var body: some View {
		ScrollView {
			VStack {
				// Search Bar
				RoundedRectangle(cornerRadius: 4)
					.fill(.gray)
					.frame(height: 36)
				Spacer()
			}
		}
		.padding(.horizontal, 16)
		.background(Color(uiColor: .designSystem(.bgColor)!))
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
