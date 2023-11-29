//
//  CharacterTurnView.swift
//  Feature
//
//  Created by been on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct CharacterTurnView: View {
    // 각 프레임에 해당하는 Image 뷰를 개별적으로 선언
    let imageFrames: [Image] = [
        Image(uiImage: .designSystem(.ju1)!),
        Image(uiImage: .designSystem(.ju2)!),
        Image(uiImage: .designSystem(.ju3)!),
        Image(uiImage: .designSystem(.ju4)!),
        Image(uiImage: .designSystem(.ju5)!),
        Image(uiImage: .designSystem(.ju6)!),
        Image(uiImage: .designSystem(.ju7)!),
        Image(uiImage: .designSystem(.ju8)!),
        Image(uiImage: .designSystem(.ju9)!),
        Image(uiImage: .designSystem(.ju10)!),
        Image(uiImage: .designSystem(.ju11)!),
        Image(uiImage: .designSystem(.ju12)!),
        Image(uiImage: .designSystem(.ju13)!),
        Image(uiImage: .designSystem(.ju14)!),
        Image(uiImage: .designSystem(.ju15)!),
        Image(uiImage: .designSystem(.ju16)!),
        Image(uiImage: .designSystem(.ju17)!),
        Image(uiImage: .designSystem(.ju18)!),
        Image(uiImage: .designSystem(.ju19)!),
        Image(uiImage: .designSystem(.ju20)!)
    ]
    @State private var currentImageIndex = 0
    let timer = Timer.publish(every: 1/18, on: .main, in: .common).autoconnect()

    public var body: some View {
        imageFrames[currentImageIndex]
            .resizable()
            .scaledToFit()
            .onReceive(timer) { _ in
                // 다음 이미지로 전환
                currentImageIndex = (currentImageIndex + 1) % imageFrames.count
            }
            .onAppear() {
                // 현재 이미지 인덱스를 초기화
                self.currentImageIndex = 0
            }
    }
}
