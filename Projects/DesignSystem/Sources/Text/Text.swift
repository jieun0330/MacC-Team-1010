//
//  Text.swift
//  DesignSystem
//
//  Created by Eric Lee on 11/7/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

extension Text {
	
	func customTextStyle(fontSize : CGFloat, fontWeight: Font.Weight, perLineHeight: CGFloat) -> some View {
		self
			.font(.system(size: fontSize, weight: fontWeight))
			.lineSpacing(fontSize/2 * (perLineHeight - 100)/100)
	}
	
	func customTextStyle(fontSize : CGFloat, fontWeight: Font.Weight, customLineHeight: CGFloat) -> some View {
		self
			.font(.system(size: fontSize, weight: fontWeight))
			.lineSpacing(customLineHeight - fontSize)
	}
}

extension Text {
	
	// MARK: - Title
	public func SF24B() -> some View {
		customTextStyle(fontSize: 24, fontWeight: .bold, perLineHeight: 140)
	}
	
	public func SF20B() -> some View {
		customTextStyle(fontSize: 22, fontWeight: .bold, perLineHeight: 140)
	}
	
	public func SF17B() -> some View {
		customTextStyle(fontSize: 17, fontWeight: .bold, customLineHeight: 22)
	}
	
	public func SF12B() -> some View {
		customTextStyle(fontSize: 12, fontWeight: .bold, perLineHeight: 150)
	}
	
	public func SF10B() -> some View {
		customTextStyle(fontSize: 10, fontWeight: .bold, perLineHeight: 140)
	}
	
	// MARK: - Title
	public func SF17R() -> some View {
		customTextStyle(fontSize: 17, fontWeight: .regular, customLineHeight: 22)
			.padding(.horizontal, 1000)
			.kerning(-0.4)
			.drawingGroup()
			.padding(.horizontal, -1000)
	}

	public func SF15R() -> some View {
		customTextStyle(fontSize: 15, fontWeight: .regular, customLineHeight: 18)
	}
	
	public func SF14R() -> some View {
		customTextStyle(fontSize: 14, fontWeight: .regular, perLineHeight: 140)
	}
	
	public func SF12R() -> some View {
		customTextStyle(fontSize: 12, fontWeight: .regular, perLineHeight: 140)
	}
	
	public func SF10R() -> some View {
		customTextStyle(fontSize: 20, fontWeight: .regular, perLineHeight: 140)
	}
	
}
