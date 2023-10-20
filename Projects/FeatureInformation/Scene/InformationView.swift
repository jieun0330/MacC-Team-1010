//
//  ContentView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct InformationView: View {
    public init() {}
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isclickHearted: Bool = false
    
    //Mark: - Navigation Back Button Custom
    public var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("돌아가기")
            }
            .foregroundColor(Color(uiColor: .designSystem(.grayFont)!))
        }
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                MarkHolyView()
                TasteRatingView()
                MarkHolyInfoView()
                AwardView()
                IngredientsView()
                BreweryInfoView()
                PairingFoodView()
                HomepageView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing:
                                Button(action: {
            self.isclickHearted.toggle()
        }, label: {
            isclickHearted ?
            Image(systemName: "heart.fill")
                .foregroundColor(Color(uiColor: .designSystem(.yellowHeart)!))
            : Image(systemName: "heart")
                .foregroundColor(Color(uiColor: .designSystem(.yellowHeart)!))
        })
        )
        .toolbarBackground(Color.black, for: .navigationBar)
        .background(Color.black)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
