//
//  EncyclopediaView.swift
//  FeatureEncyclopedia
//
//  Created by Park Jieun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct Model: Identifiable {
    public let id = UUID()
    var product: Image
    var title: String
}

extension Model {
    public static var dummyModel: [Model] {
        (0...30).map { (number: Int) in
            Model(product: Image(systemName: "hand.thumbsdown.fill"), title: "막걸리 이름")
        }
    }
}

public struct EncyclopediaView: View {
    public init() { }
    
    let columns = [GridItem(.fixed(110)), GridItem(.fixed(110)), GridItem(.fixed(110))]
    
    public var dummyModel = Model.dummyModel
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(dummyModel, content: { (dataItem: Model) in
                    
                    VStack {
                        Rectangle()
                            .foregroundColor(Color(uiColor: .designSystem(.darkGrey)!))
                            .cornerRadius(10)
                            .frame(height: 190)
                            .overlay(
                                VStack {
                                    HStack {
                                        Image(systemName: "ellipsis.message.fill")
                                        Spacer()
                                        Image(systemName: "heart.fill")
                                    }
                                    .opacity(0.5)
                                    .padding(.horizontal, 10)
                                    
                                    Image(uiImage: .designSystem(.mockMakgeolli)!)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 66, height: 136)
                                }
                            )
                        HStack {
                            dataItem.product
                            Text(dataItem.title)
                                
                        }
                    }
                })
            })
        }
    }
}

struct EncyclopediaView_Previews: PreviewProvider {
    static var previews: some View {
        EncyclopediaView()
    }
}
