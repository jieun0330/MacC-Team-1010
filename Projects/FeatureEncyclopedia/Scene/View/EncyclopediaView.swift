//
//  EncyclopediaView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct EncyclopediaView: View {
    public init() { }
    
    let columns: [GridItem] = Array(repeating: .init(.fixed(110)), count: 3)
        
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(Thumbnail.dummyThumbNailModel, content: { (dataItem: Thumbnail) in
                    
                    ThumbnailView(model: dataItem)
                })
            })
        }

    }
}
