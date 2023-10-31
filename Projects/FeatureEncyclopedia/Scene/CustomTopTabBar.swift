//
//  CustomTopTabBar.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

struct CustomTopTabBar: View {
    
    @Binding var tabIndex: Int
    
    var body: some View {
        HStack(spacing: 40) {
            TabBarButton(text: "전체", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            TabBarButton(text: "좋았어요", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            TabBarButton(text: "아쉬워요", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }
            TabBarButton(text: "찜", isSelected: .constant(tabIndex == 3))
                .onTapGesture { onButtonTapped(index: 3) }
            TabBarButton(text: "코멘트", isSelected: .constant(tabIndex == 4))
                .onTapGesture { onButtonTapped(index: 4) }
        }
    }
    
    private func onButtonTapped(index: Int) {
        //Mark: - Animation 적용할 경우?
        //        withAnimation { tabIndex = index }
        tabIndex = index
    }
}

//struct CustomTopTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTopTabBar()
//    }
//}
