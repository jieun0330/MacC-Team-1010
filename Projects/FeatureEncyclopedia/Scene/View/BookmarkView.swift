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
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    public var body: some View {
        
        ScrollView {
            HStack {
                Text("\((User.user1.bookmarks).count)개의 막걸리를 찜했어요")
                    .SF12R()
                    .foregroundColor(.W50)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            
            LazyVGrid(columns: columns, spacing: 16, content: {
                
                ForEach(User.user1.bookmarks, id: \.self) { makId in
                    ThumbnailView(makId: makId, type: .bookmark)
                }
            })
        }
    }
}
