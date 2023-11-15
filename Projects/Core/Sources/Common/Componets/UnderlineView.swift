//
//  UnderlineView.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/09.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct UnderlineView: ViewModifier {
	public let spacing: CGFloat
	public let height: CGFloat
	public let color: Color
	
	init(spacing: CGFloat, height: CGFloat, color: Color) {
		self.spacing = spacing
		self.height = height
		self.color = color
	}
	
	public func body(content: Content) -> some View {
		VStack(spacing: spacing) {
			content
			Rectangle()
				.frame(height: height)
				.foregroundColor(color)
		}
	}
}

extension View {
	public func underlined(spacing: CGFloat = 5,
						   height: CGFloat = 2,
						   color: Color = .accentColor) -> some View {
		self.modifier(UnderlineView(spacing: spacing,
									height: height,
									color: color))
	}
}
