//
//  SplashView.swift
//  Feature
//
//  Created by been on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI

public struct SplashView: View {
    public var body: some View {
        VStack{
            CharacterTurnView()
                .frame(width: 200)
                .aspectRatio(contentMode: .fit)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
    
    public init() {
        
    }
}
