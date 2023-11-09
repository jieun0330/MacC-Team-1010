//
//  DislikeView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

public struct DislikeView: View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    public var body: some View {
        
        ScrollView {
            
            HStack {
                Text("\((User.user1.dislikes).count)개의 막걸리가 아쉬워요")
                    .SF12R()
                    .foregroundColor(.W50)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            
            LazyVGrid(columns: columns, spacing: 16, content: {
                                
                ForEach(User.user1.dislikes, id: \.self) { makId in
                    ThumbnailView(makId: makId, type: .dislike)
                }
            })
        }
    }
}
