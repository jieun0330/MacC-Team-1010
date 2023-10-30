//
//  EncyclopediaView.swift
//  FeatureEncyclopedia
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct Model: Identifiable {
    public let id = UUID()
    var product: String
    var title: String
}

extension Model {
    public static var dummyModel: [Model] {
        (0...30).map { (number: Int) in
            Model(product: "임시", title: "몰라")
        }
    }
}

public struct EncyclopediaView: View {
	public init() { }
    
    public var dummyModel = Model.dummyModel
	
	public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.fixed(110)), GridItem(.fixed(110)), GridItem(.fixed(110))], content: {
                ForEach(dummyModel, content: { (dataItem: Model) in
                    
                    Rectangle()
//                        .foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
                        .cornerRadius(10)
                        .frame(height: 190)
                        .overlay(
                            VStack {
                                
                                HStack {
                                    Image(systemName: "ellipsis.message.fill")
                                    Image(systemName: "heart.fill")
                                }
                                
                                Image("MockMakgeolli")
                                    
                                
//                                Circle()
//                                    .frame(width: 100)
//                                    .foregroundColor(.black)
//                                Text(dataItem.product)
//                                Text(dataItem.title)
                            }
                        )
                    
//                    Rectangle()
//                        .foregroundColor(.gray)
//                        .overlay(
//                            Text(dataItem.product)
//                            Text(dataItem.title)
//                        )
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
