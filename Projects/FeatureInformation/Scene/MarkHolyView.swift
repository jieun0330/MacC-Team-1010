//
//  MarkHolyView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct MarkHolyView: View {
    
    public init() {}
    
    public var body: some View {
        
        Color.black
            .ignoresSafeArea()
            .overlay(
        
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 90, height: 180)
                    .foregroundColor(.gray)
//                    .foregroundColor(.blueTemp .opacity(0.2))
                VStack(alignment: .leading) {
                    Text("양조장 이름")
                        .bold()
                        .font(.system(size: 16))
                        .opacity(0.5)
                    Text("막걸리 이름")
                        .bold()
                        .font(.system(size: 20))
                        .frame(height: 51, alignment: .top)
                    HStack {
                        Text("도수")
                            .opacity(0.5)
                            .padding(.trailing, 16)
                        Text("0%")
                    }
                    .font(.system(size: 16))
                    HStack {
                        Text("용량")
                            .opacity(0.5)
                            .padding(.trailing, 16)
                        Text("100ml")
                    }
                    .font(.system(size: 16))
                    HStack {
                        Text("가격")
                            .opacity(0.5)
                            .padding(.trailing, 16)
                        Text("1000원")
                    }
                    .font(.system(size: 16))
                }
                .foregroundColor(.white)
                .padding(.leading, 20)
                
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

struct MarkHolyView_Previews: PreviewProvider {
    static var previews: some View {
        MarkHolyView()
    }
}
