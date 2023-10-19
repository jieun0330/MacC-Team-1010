//
//  RegionSingleView.swift
//  FeatureCategory
//
//  Created by Kim SungHun on 2023/10/19.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct RegionSingleView: View {
	
	let title: String
	
	var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.fill(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
			.aspectRatio(contentMode: .fit)
			.overlay {
				VStack {
					Spacer()
					Rectangle()
						.fill(Color(uiColor: .designSystem(.tempLightGrayColor)!))
						.padding(.top, 10.0)
						.cornerRadius(9.0)
						.padding(.top, -10.0)
						.frame(height: 48)
						.overlay {
							HStack {
								Spacer()
									.frame(width: 16)
								Text(title)
									.font(.system(size: 20, weight: .regular))
									.foregroundColor(.white)
								Spacer()
							}
						}
				}
			}
	}
}

struct RegionSingleView_Previews: PreviewProvider {
    static var previews: some View {
        RegionSingleView(title: "")
    }
}

