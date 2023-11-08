//
//  EncyclopediaView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

enum EncyclopediaType {
    case all
    case like
    case dislike
    case bookmark
    case comment
}

public struct EncyclopediaView: View {
    
    public init() { }
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    let type = EncyclopediaType.all
    
    let combineArray = Array(Set(User.user1.likes + User.user1.dislikes + User.user1.bookmarks + User.user1.comments))
    
    let drink = User.user1.likes + User.user1.dislikes
    
    public var body: some View {
        
        ScrollView {
            
            HStack {
                Text("\(combineArray.count)개 중 \(drink.count)개를 마셔봤어요!")
//                Text("개를 마셔봤어요!")
                    .font(.style(.SF12R))
                    .foregroundColor(Color(uiColor: .designSystem(.w50)!))
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            
            
            LazyVGrid(columns: columns, spacing: 16, content: {
                ForEach(combineArray, id: \.self) { makId in
                    ThumbnailView(makId: makId, type: .all)
                }
            })
        }
    }
}
