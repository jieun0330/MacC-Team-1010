//
//  HomepageView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

public struct HomepageView: View {
	let makgeolliData: MockMakgeolliModel

	public init(makgeolliData: MockMakgeolliModel) {
		self.makgeolliData = makgeolliData
	}
	
    public var body: some View {
		MakgeolliDetail(title: "홈페이지", content: makgeolliData.website)
    }
}
