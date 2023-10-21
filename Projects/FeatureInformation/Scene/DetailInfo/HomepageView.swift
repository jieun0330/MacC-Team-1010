//
//  HomepageView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct HomepageView: View {
    public init() {}
    public var body: some View {
        MakgeolliDetail(title: "홈페이지", content: "www.xn-vbo8x7wc.com/main/index.php")
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
