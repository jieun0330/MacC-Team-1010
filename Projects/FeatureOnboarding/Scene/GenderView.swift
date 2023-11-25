//
//  GenderView.swift
//  FeatureOnboarding
//
//  Created by 박지은 on 11/25/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct GenderView: View {
    
    @State public var genderSelected: Int?
    @State var selected = [false, false, false]
    
    let genders = ["남성", "여성", "기타"]
    
    public init(genderSelected: Int? = nil, selected: [Bool] = [false, false, false]) {
        self.genderSelected = genderSelected
        self.selected = selected
    }
    
    public var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .center) {
                
                Spacer()
                
                HStack(spacing: 0) {
                    Text("성별")
                        .foregroundColor(.Primary)
                        .SF24B()
                    Text("을 알려주세요")
                        .SF24B()
                }
                .padding(.bottom, 8)
                
                Text("막걸리 추천이 더 정확해져요!")
                    .SF14R()
                    .foregroundColor(.W50)
                    .padding(.bottom, 24)
                
                HStack(spacing: 8) {
                    ForEach(0..<genders.count) { button in
                        Button(action: {
                            self.selected = self.selected.enumerated().map { $0.offset == button }
                        }, label: {
                            ZStack {
                                
                                Rectangle()
                                    .cornerRadius(12)
                                    .frame(width: 94, height: 58)
                                    .foregroundColor(self.selected[button] ? Color.Lilac : Color.DarkBase)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.Lilac, lineWidth: 3)
                                    )
                                Text(self.genders[button])
                                    .SF20B()
                                    .foregroundColor(self.selected != nil ? Color.White : Color.W85)
                            }
                        })
                    }
                }
                
                Spacer()
                
                nextButton()
            }
        }
    }
}


extension GenderView {
    @ViewBuilder
    func nextButton() -> some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 50)
                .overlay {
                    Text("다음")
                        .foregroundColor(.White)
                        .SF17R()
                }
                .padding(.bottom, 16)
        }
    }
}
