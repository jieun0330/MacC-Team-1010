//
//  TabNameView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct TabNameView: View {
    
    @Binding var index: Int
    var titles = ["전체", "좋았어요", "아쉬워요", "찜", "코멘트"]
    
    var body: some View {
        
        ScrollViewReader { proxy in
            
            HStack(spacing: 10) {
                
                ForEach(titles.indices) {id in
                    let title = Text(titles[id])
                        .SF14R()
                        .frame(width: 52)
                        .onTapGesture {
                            index = id
                        }
                    VStack {
                        Spacer()
                            .frame(height: 10)
                        title
                            .foregroundColor(self.index == id ? .white : .gray)
                        Capsule()
                            .frame(width: 68, height: 2)
                            .foregroundColor(self.index == id ? .Primary2 : .black)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
