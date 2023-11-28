//
//  BackgroundModifier.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct OnboardingBackground: ViewModifier {
	public init() { }
	
	public func body(content: Content) -> some View {
		content
			.font(.style(.SF12R))
			.padding(.horizontal, 8)
			.padding(.vertical, 16)
			.background(Color(uiColor: .designSystem(.darkbase)!))
			.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!), for: .navigationBar)
			.navigationBarBackButtonHidden()
			.background(Color(uiColor: .designSystem(.darkbase)!))
	}
}

public struct ProgressViewBackground: ViewModifier {
	public init() { }
	
	public func body(content: Content) -> some View {
		content
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
			.foregroundColor(Color(uiColor: .designSystem(.white)!))
			.background(Color.DarkBase)
	}
}

public struct NavigationBarBackground: ViewModifier {
	private var title: String
	
	public init(_ title: String = "") {
		self.title = title
	}
	
	public func body(content: Content) -> some View {
		content
			.background(Color(uiColor: .designSystem(.darkbase)!))
			.navigationTitle(title)
			.navigationBarTitleDisplayMode(.inline)
//			.navigationBarBackButtonHidden()
//			.navigationBarItems(leading: CustomBackButton())
			.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!), for: .navigationBar)
	}
}
