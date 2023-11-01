//
//  GoodView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct GoodView: View {
    public init() { }
    
    let columns: [GridItem] = Array(repeating: .init(.fixed(110)), count: 3)
    
    public var dummyModel = Thumbnail.dummyThumbNailModel
    
    public var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(dummyModel, content: { (dataItem: Thumbnail) in
                    ThumbnailView(model: dataItem)
                })
            })
        }
    }
}
