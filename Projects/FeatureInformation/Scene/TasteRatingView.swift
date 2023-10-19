//
//  TasteRatingView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

//enum TasteRating: Int {
//    case taste5 = 5
//    case taste4 = 4
//    case taste3 = 3
//    case taste2 = 2
//    case taste1 = 1
//
//    var backgroundColor: Color {
//        switch self {
//        case .taste5: return Color.tasteCircle
//        case .taste4: return Color.tasteCircle.opacity(0.8)
//        case .taste3: return Color.tasteCircle.opacity(0.6)
//        case .taste2: return Color.tasteCircle.opacity(0.4)
//        case .taste1: return Color.tasteCircle.opacity(0.2)
//        }
//    }
//}


public struct TasteRatingView: View {
    
    public init() {}
    
//    @State private var tasteRating: TasteRating = .taste5
    
    public var body: some View {
        
        Color.black
            .ignoresSafeArea()
            .overlay(
        
        VStack {
            HStack {
                
                Spacer()
                
                VStack {
                    Text("단맛")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

//                Text("\(tasteRating.rawValue)")
//                    .bold()
//                    .font(.system(size: 30))
//                    .overlay(
//                        Circle()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(tasteRating.backgroundColor)
//                    )
                    
                }
                .padding()
                .padding(.trailing, 10)
                .border(.red)

                
                VStack {
                    Text("신맛")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

//                Text("\(tasteRating.rawValue)")
//                    .bold()
//                    .font(.system(size: 30))
//                    .overlay(
//                        Circle()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(tasteRating.backgroundColor)
//                    )
//                    .padding(.trailing, 10)

                    
                }
                .padding()
                .padding(.trailing, 10)
                .border(.red)


                
                VStack {
                    Text("걸쭉함")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

//                Text("\(tasteRating.rawValue)")
//                    .bold()
//                    .font(.system(size: 30))
//                    .overlay(
//                        Circle()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(tasteRating.backgroundColor)
//                    )
//                    .padding(.trailing, 10)

                    
                }
                .padding()
                .padding(.trailing, 10)
                .border(.red)


                
                VStack {
                    Text("청량감")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

//                Text("\(tasteRating.rawValue)")
//                    .bold()
//                    .font(.system(size: 30))
//                    .overlay(
//                        Circle()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(tasteRating.backgroundColor)
//                    )

                    
                }
                .padding()
                .border(.red)

                
                Spacer()

            }
            .padding()
        }
//        .background(Color.blackBlock)
        .frame(maxWidth: .infinity)
        .cornerRadius(20)
        .padding()
        )
    }
}

struct TasteRatingView_Previews: PreviewProvider {
    static var previews: some View {
        TasteRatingView()
    }
}
