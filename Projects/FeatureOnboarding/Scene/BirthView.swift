//
//  BirthView.swift
//  FeatureOnboarding
//
//  Created by 박지은 on 11/23/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Combine

public struct BirthView: View {
    
    @State var birthDay = ""
    @State private var isAgreed = false
    
    public init() {
        
    }
    
    public var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("본인 확인을 위해")
            .SF24B()
            
            HStack {
                Text("생년월일")
                    .foregroundColor(.Primary)
                    .SF24B()
                Text("을 입력해주세요")
                    .SF24B()
            }
            .padding(.bottom, 8)
            
            Text("본인 확인 이후에 데이터 연동이 가능해져요!")
                .SF14R()
                .foregroundColor(.W50)
                .padding(.bottom, 24)
            
            ZStack {
                // 기본 설정
//                Image(uiImage: .designSystem(.numBox)!)
                // 생년월일 retry
                Image(uiImage: .designSystem(.numBox_warmRed)!)
                TextField("980123", text: $birthDay)
                    .frame(width: 300)
                    .textFieldStyle(CertiNumTextFieldStyle())
                    .keyboardType(.numberPad)
                    .onReceive(Just(birthDay)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.birthDay = filtered
                        }
                        if self.birthDay.count == 7 {
                            self.birthDay.removeLast()
                        }
                    }
            }
            .padding(.bottom, 8)
            
            Text("19세 이상의 성인만 이용할 수 있어요")
                .SF12B()
                .foregroundColor(.Alert)
                .padding(.bottom, 24)
            
            HStack {
                Text("개인정보(연락처, 생년월일) 수집 이용에 동의합니다")
                    .SF12B()
                    .foregroundColor(.W85)
                
                Button(action: {
                    self.isAgreed.toggle()
                }, label: {
                    isAgreed ? Image(uiImage: .designSystem(.isSelectedTrue)!) : Image(uiImage: .designSystem(.circle)!)
                })
            }
            
            Spacer()
            
            Button {

            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(uiColor: .designSystem(birthDay.isEmpty ? .w10 :.goldenyellow)!))
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
}
