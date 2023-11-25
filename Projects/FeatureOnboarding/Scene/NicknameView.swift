//
//  NicknameView.swift
//  FeatureOnboarding
//
//  Created by 박지은 on 11/25/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Combine

public struct NicknameView: View {
    
    @State var nickName = ""
    @State private var showNickDupli = false
    
    public init(nickName: String = "") {
        self.nickName = nickName
    }
    
    public var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .center) {
                
                Spacer()
                
                HStack(spacing: 0) {
                    Text("닉네임")
                        .foregroundColor(.Primary)
                        .SF24B()
                    Text("을 입력해주세요")
                        .SF24B()
                }
                
                ZStack {
                    // 기본 설정
                    Image(uiImage: .designSystem(.numBox)!)
                    // 닉네임 중복
                    //                    Image(uiImage: .designSystem(.numBox_warmRed)!)
                    TextField("걸쭉한막걸리", text: $nickName)
                        .frame(width: 300)
                        .padding()
                        .keyboardType(.default)
                        .textFieldStyle(NicknameTextFieldStyle())
                        .onReceive(Just(nickName)) { newValue in
                            if self.nickName.count == 7 {
                                self.nickName.removeLast()
                            }
                        }
                }
                .padding(.bottom, 153)
                
                if showNickDupli {
                    Text("사용할 수 있는 닉네임이에요!")
                        .SF12B()
                        .foregroundColor(.Primary2)
                        .padding(.bottom, 90)
                    
                    HStack(spacing: 0) {
                        Text("이용약관")
                            .foregroundStyle(Color.Primary2)
                        Text("과 ")
                            .foregroundStyle(Color.W50)
                        Text("개인정보처리방침")
                            .foregroundStyle(Color.Primary2)
                        Text("에 동의하고 시작합니다.")
                            .foregroundStyle(Color.W50)
                    }
                    .font(.style(.SF12B))
                }
                nextButton()
            }
        }
    }
}


extension NicknameView {
    @ViewBuilder
    func nextButton() -> some View {
        Button {
            showNickDupli.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(showNickDupli ? .Primary : .Lilac)
                .frame(height: 50)
                .overlay {
                    Text(showNickDupli ? "완료" : "닉네임 중복 검사")
                        .foregroundColor(.White)
                        .SF17R()
                }
                .padding(.bottom, 16)
        }
    }
}

struct NicknameTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        configuration
            .font(.style(.SF24B))
            .kerning(28)
            .padding()
    }
}

