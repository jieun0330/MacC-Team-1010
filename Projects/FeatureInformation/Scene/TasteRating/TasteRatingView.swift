//
//  TasteRatingView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

enum TasteRating: Int {
    case taste5 = 5
    case taste4 = 4
    case taste3 = 3
    case taste2 = 2
    case taste1 = 1
    
    var backgroundColor: Color {
        switch self {
        case .taste5: return Color(uiColor: .designSystem(.tasteCircle)!)
        case .taste4: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.8)
        case .taste3: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.6)
        case .taste2: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.4)
        case .taste1: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.2)
        }
    }
}

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

public struct TasteRatingView: View {
    public init() {}
    @State private var tasteRating1: TasteRating = .taste5
    @State private var tasteRating2: TasteRating = .taste4
    @State private var tasteRating3: TasteRating = .taste3
    @State private var tasteRating4: TasteRating = .taste2
    
    public var body: some View {
        VStack {
            HStack(spacing: 10) {
                Spacer()
                FlavorRatingView(flavorName: "단 맛", tasteRating: $tasteRating1)
                FlavorRatingView(flavorName: "신 맛", tasteRating: $tasteRating2)
                FlavorRatingView(flavorName: "걸쭉함", tasteRating: $tasteRating3)
                FlavorRatingView(flavorName: "청량감", tasteRating: $tasteRating4)
                Spacer()
            }
            .padding()
        }
        .background(Color(uiColor: .designSystem(.blackBlock)!))
        .cornerRadius(10)
    }
}

struct TasteRatingView_Previews: PreviewProvider {
    static var previews: some View {
        TasteRatingView()
    }
}
