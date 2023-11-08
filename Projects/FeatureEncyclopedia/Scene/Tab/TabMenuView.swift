//
//  TabMenuView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct TabMenuView: View {
    
    public init() { }
    
    @State var index = 0
    
    public var body: some View {
        
        NavigationStack {
            VStack {
                TabNameView(index: $index)
                

                

                TabView(selection: $index) {
                    ForEach (0..<5) { pageId in
                        switch pageId {
                        case 0:
                            EncyclopediaView()
                        case 1:
                            LikeView()
                        case 2:
                            DislikeView()
                        case 3:
                            BookmarkView()
                        default:
                            CommentView()
                        }
                    }
                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("내 막걸리")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

