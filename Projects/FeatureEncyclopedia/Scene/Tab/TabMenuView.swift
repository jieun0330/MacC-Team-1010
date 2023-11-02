//
//  TabMenuView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct TabMenuView: View {
    
    public init() { }
    
    @State var index = 0
    
    public var body: some View {
        
        NavigationStack {
            ZStack {
                TabView(selection: $index) {
                    ForEach (0..<5) { pageId in
                        switch pageId {
                            
                        case 0:
                            EncyclopediaView()
                        case 1:
                            GoodView()
                        case 2:
                            BadView()
                        case 3:
                            LikeView()
                        default:
                            CommentView()
                        }
                    }
                }
//                                .tabViewStyle(.page(indexDisplayMode: .never))
                VStack {
                    TabNameView(index: $index)
                        .background(Color.black)
                    Spacer()
                }
            }
            .navigationTitle("내 막걸리")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

