//
//  TabPageView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct TabPageView: View {
    
    public init() { }
    
    @State var tabIndex = 0
    
    public var body: some View {
        
        VStack {
            CustomTopTabBar(tabIndex: $tabIndex)
            if tabIndex == 0 {
                EncyclopediaView()
            }
            else if tabIndex == 1 {
                GoodView()
            }
            else if tabIndex == 2 {
                BadView()
            }
            else if tabIndex == 3 {
                SaveView()
            }
            else {
                CommentView()
            }
        }
    }
}
