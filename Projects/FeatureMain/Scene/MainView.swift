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
	
	let mockMakgeollis = MockMakgeolli()

	public init() {}
	
	public var body: some View {
		ScrollView {
			VStack {
				ForEach(mockMakgeollis, id: \.self) { mockMakgeolli in
					Image(uiImage: .designSystem(.mockImage)!)
					Text("\(mockMakgeolli.name)")
					Text("\(mockMakgeolli.breweryName)")
				}
			}
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
