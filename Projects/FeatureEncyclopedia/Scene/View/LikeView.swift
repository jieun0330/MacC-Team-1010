//
//  LikeView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

// 좋았어요 뷰
public struct LikeView: View {
    @ObservedObject var viewModel: EncyclopediaViewModel
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    public var body: some View {
        
        ScrollView {
            HStack {
                Text("\((viewModel.testModel.filter {$0.reactionLike == "LIKE"}).count )개의 막걸리가 좋았어요")
                    .SF12R()
                    .foregroundColor(.W50)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            
            LazyVGrid(columns: columns, spacing: 16, content: {
                ForEach(viewModel.testModel, id: \.self) { mak in
                    if mak.reactionLike == "LIKE" {
                        ThumbnailView(mak: mak, type: .like)
                    }
                }
            })
        }
    }
}
