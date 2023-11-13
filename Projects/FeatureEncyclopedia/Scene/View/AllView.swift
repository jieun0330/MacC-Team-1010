//
//  AllView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//


import SwiftUI
import Core

enum EncyclopediaType {
    case all
    case like
    case dislike
    case bookmark
    case comment
}

// 전체 뷰
struct AllView: View {
    
    @ObservedObject var viewModel: EncyclopediaViewModel
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    private let type = EncyclopediaType.all
    private let drink = User.user1.likes + User.user1.dislikes
    
    public var body: some View {
        
        ScrollView(showsIndicators: false) {
            HStack {
                Text("\(viewModel.makModel.count)개 중 \((viewModel.makModel.filter { $0.reactionLike == "LIKE" } + viewModel.makModel.filter { $0.reactionLike == "DISLIKE" }).count)개를 마셔봤어요!")
                    .SF12R()
                    .foregroundColor(.W50)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            
            LazyVGrid(columns: columns, spacing: 16, content: {
                ForEach(viewModel.makModel, id: \.self) { mak in
                    ThumbnailView(mak: mak, type: .all)
                }
            }
            )
            .padding(.bottom)
        }
    }
}
