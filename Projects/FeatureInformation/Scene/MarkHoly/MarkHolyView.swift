//
//  MarkHolyView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct MarkHolyView: View {
    public init() {}
    
    
    public var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 90, height: 180)
                    .foregroundColor(Color(uiColor: .designSystem(.blueTemp)!).opacity(0.2))
                VStack(alignment: .leading) {
                    Text("양조장 이름")
                        .bold()
                        .font(.system(size: 16))
                        .opacity(0.5)
                    Text("하늘달6 생막걸리 길면 두줄까지 가능")
                        .bold()
                        .font(.system(size: 20))
                        .frame(height: 51, alignment: .top)
                    InfoRow(title: "도수", value: "0%")
                    InfoRow(title: "용량", value: "100ml")
                    InfoRow(title: "가격", value: "1000원")
                }
                .foregroundColor(.white)
                .padding(.leading, 20)
                Spacer()
            }
            .padding()
        }
        .padding()
        .background(Color(uiColor: .designSystem(.blackBlock)!))
        .cornerRadius(10)
    }
}

//public struct InfoRow: View {
//    let title: String
//    let value: String
//
//    public var body: some View {
//        HStack {
//            Text(title)
//                .opacity(0.5)
//                .padding(.trailing, 16)
//            Text(value)
//                .font(.system(size: 16))
//        }
//    }
//}

struct MarkHolyView_Previews: PreviewProvider {
    static var previews: some View {
        MarkHolyView()
    }
}
