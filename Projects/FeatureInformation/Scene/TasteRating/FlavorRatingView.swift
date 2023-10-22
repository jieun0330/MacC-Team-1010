//
//  FlavorRatingView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct FlavorRatingView: View {
    let flavorName: String
    @Binding var tasteRating: TasteRating
    
    public var body: some View {
        VStack {
            Text(flavorName)
                .bold()
                .font(.system(size: 12))
                .foregroundColor(.white)
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(tasteRating.backgroundColor)
                .overlay(
                    Text("\(tasteRating.rawValue)")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                )
        }
    }
}


//struct FlavorRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlavorRatingView()
//    }
//}
