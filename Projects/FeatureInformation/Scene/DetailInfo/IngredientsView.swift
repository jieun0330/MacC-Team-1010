//
//  IngredientsView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct IngredientsView: View {
    public init() {}
    public var body: some View {
        MarkHolyDetail(title: "원재료", content: "쌀(국내산/무농약), 효모, 누룩(밀/국내산), 정제수")
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
