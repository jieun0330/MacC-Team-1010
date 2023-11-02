//
//  DividerView.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct DividerView: View {
	let topPadding: CGFloat
	let bottomPadding: CGFloat
	let leadingPadding: CGFloat
	let trailingPadding: CGFloat
	
	public init(
		topPadding: CGFloat = 0,
		bottomPadding: CGFloat = 0,
		leadingPadding: CGFloat = 0,
		trailingPadding: CGFloat = 0
	) {
		self.topPadding = topPadding
		self.bottomPadding = bottomPadding
		self.leadingPadding = leadingPadding
		self.trailingPadding = trailingPadding
	}
	
	public var body: some View {
		Divider()
			.background(Color(uiColor: .designSystem(.w25)!))
			.frame(height: 0.33)
			.padding(.top, topPadding)
			.padding(.bottom, bottomPadding)
			.padding(.leading, leadingPadding)
			.padding(.trailing, trailingPadding)
	}
}
