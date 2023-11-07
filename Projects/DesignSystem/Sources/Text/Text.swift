//
//  Text.swift
//  DesignSystem
//
//  Created by Eric Lee on 11/7/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

extension Text {
	func customTextStyle(fontSize : CGFloat, fontWeight: Font.Weight, lineSpacingPer: CGFloat) -> some View {
		self
			.font(.system(size: fontSize, weight: fontWeight))
			.lineSpacing(fontSize / 2 * (lineSpacingPer - 100)/100)
	}
	
	func customTextStyle(fontSize : CGFloat, fontWeight: Font.Weight, lineSpacing: CGFloat) -> some View {
		self
			.font(.system(size: fontSize, weight: fontWeight))
			.lineSpacing(lineSpacing)
	}
}

extension Text {
	
	public func SFTitle() -> some View {
		customTextStyle(fontSize: 34, fontWeight: .bold, lineSpacingPer: 0)
	}
	
	public func SF24B() -> some View {
		customTextStyle(fontSize: 24, fontWeight: .bold, lineSpacingPer: 0)
	}
	
	public func SF22B() -> some View {
		customTextStyle(fontSize: 22, fontWeight: .bold, lineSpacingPer: 150)
	}
	
	public func SF12B() -> some View {
		customTextStyle(fontSize: 12, fontWeight: .bold, lineSpacingPer: 150)
	}
	
	public func SF10B() -> some View {
		customTextStyle(fontSize: 10, fontWeight: .bold, lineSpacingPer: 0)
	}
	
	public func SF14R() -> some View {
		customTextStyle(fontSize: 14, fontWeight: .regular, lineSpacingPer: 140)
	}
	
	public func SF12R() -> some View {
		customTextStyle(fontSize: 12, fontWeight: .regular, lineSpacingPer: 140)
	}
	
	public func SF17R() -> some View {
		customTextStyle(fontSize: 17, fontWeight: .regular, lineSpacingPer: 17)
			.padding(.horizontal, 1000)
			.kerning(-0.4)
			.drawingGroup()
			.padding(.horizontal, -1000)
	}
	
	public func SF16R() -> some View {
		customTextStyle(fontSize: 16, fontWeight: .regular, lineSpacing: 18)
	}
	
	public func SF28B() -> some View {
		customTextStyle(fontSize: 28, fontWeight: .bold, lineSpacing: 34)
	}
	
	public func SF17B() -> some View {
		customTextStyle(fontSize: 17, fontWeight: .bold, lineSpacing: 34)
	}
	
	public func SF20B() -> some View {
		customTextStyle(fontSize: 20, fontWeight: .bold, lineSpacing: 22)
	}
	
}
