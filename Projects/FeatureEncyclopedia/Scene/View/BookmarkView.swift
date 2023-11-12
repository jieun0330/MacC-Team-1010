//
//  BookmarkView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

// 찜 뷰
public struct BookmarkView: View {
    
    @ObservedObject var viewModel: EncyclopediaViewModel
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    public var body: some View {
        
        ScrollView {
            HStack {
                Text("\((viewModel.makModel.filter {$0.reactionWish == "WISH"}).count )개의 막걸리를 찜했어요")
                    .SF12R()
                    .foregroundColor(.W50)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            
            LazyVGrid(columns: columns, spacing: 16, content: {
                
                ForEach(viewModel.makModel, id: \.self) { mak in
                    
                    if mak.reactionWish == "WISH" {
                        ThumbnailView(mak: mak, type: .bookmark)
                    }
                }
            })
        }
    }
}
