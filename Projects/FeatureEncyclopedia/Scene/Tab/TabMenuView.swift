//
//  TabMenuView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct TabMenuView: View {
    
    public init() { }
    
    @State var index = 0
    
    public var body: some View {
        
        VStack {
            TabNameView(index: $index)
            TabView(selection: $index) {
                ForEach (0..<5) { pageId in
                    
                    if pageId == 0 {
                        EncyclopediaView()
                    }
                    else if pageId == 1 {
                        GoodView()
                    }
                    else if pageId == 2 {
                        BadView()
                    }
                    else if pageId == 3 {
                        LikeView()
                    }
                    else {
                        CommentView()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        
    }
}
