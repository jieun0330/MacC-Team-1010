//
//  ContentView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct ContentView: View {
    
    public init() {}
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var clickHeart: Bool = false
    
    //Mark: - Navigation Back Button Custom
    public var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("돌아가기")
            }
//            .foregroundColor(.grayFont)
        }
    }

    public var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay(
                ScrollView {
                    VStack {
                        MarkHolyView()
                        TasteRatingView()
                    }
                }
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: backButton, trailing:
                                            Button(action: {
                                                self.clickHeart.toggle()
                                            }, label: {
                                                clickHeart ?
                                                Image(systemName: "heart.fill")
//                                                    .foregroundColor(.yellowHeart)
                                                : Image(systemName: "heart")
//                                                    .foregroundColor(.yellowHeart)
                                            })
                                       )
            )
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
