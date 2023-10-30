//
//  NewItemSingleView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct NewItemSingleView: View {
	var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.fill(Color(uiColor: .designSystem(.darkgrey)!))
			.frame(width: 130, height: 244)
	}
}
