//
//  Color+.swift
//  DesignSystem
//
//  Created by Eric Lee on 11/7/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

extension Color {
	
	init(hex: String, opacity: Double = 1.0) {
		let scanner = Scanner(string: hex)
		_ = scanner.scanString("#")
		
		var rgb: UInt64 = 0
		scanner.scanHexInt64(&rgb)
		
		let red = Double((rgb >> 16) & 0xff) / 255
		let green = Double((rgb >> 8) & 0xff) / 255
		let blue = Double((rgb >> 0) & 0xff) / 255
		
		self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
	}
	
}

extension Color {
	
	// MARK: - Dark Scale
	public static let DarkBase = Color(hex: "#15151A")
	public static let DarkWindow = Color(hex: "#15151A",opacity: 0.75)
	public static let DarkGrey = Color(hex: "#202028")
	
	// MARK: - White Scale
	public static let W10 = Color(hex: "#E5E5FF", opacity: 0.1)
	public static let W25 = Color(hex: "#E5E5FF", opacity: 0.25)
	public static let W50 = Color(hex: "#E5E5FF", opacity: 0.5)
	public static let W85 = Color(hex: "#E5E5FF", opacity: 0.85)
	public static let White = Color(hex: "#FFFFFF")
	
	// MARK: - Yellow Scale
	public static let Primary = Color(hex: "#FFC805")
	public static let GoldenYellow = Color(hex: "#DFA100")
	
	// MARK: - Ivory
	public static let Primary2 = Color(hex: "#6868FF")
	public static let Lilac = Color(hex: "#7676D3")
	
	// MARK: - Point
	public static let Alert = Color(hex: "#FF1F70")
	public static let Ivory = Color(hex: "#FFE5A5")
	
	// MARK: - Linear Gradient
	public static let SunriseTop = Color(hex: "#DFA100")
	public static let SunriseBottom = Color(hex: "#7676D3")
	
	public static let NightSkyTop = Color(hex: "#B6A87B")
	public static let NightSkyBottom = Color(hex: "#2F2F64")
	
	public static let NightSky2Top = Color(hex: "#736D70")
	public static let NightSky2Bottom = Color(hex: "#252545")
	
	public static let CircleTop = Color(hex: "3D3D72")
	public static let CircleBottom = Color(hex: "000000", opacity: 0)
}
