//
//  ThumbnailModel.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import SwiftUI
import DesignSystem

public struct ThumbnailModel: Identifiable {
    public let id = UUID()
    var comment: Image
    var save: Image
    var makgeolliImage: Image
    
    var product: Image
    var title: String
}

extension ThumbnailModel {
    public static var dummyThumbNailModel: [ThumbnailModel] {
        (0...30).map { (number: Int) in
            
            ThumbnailModel(comment: Image(systemName: "ellipsis.message.fill"),
                           save: Image(systemName: "heart.fill"),
                           makgeolliImage: Image(uiImage: .designSystem(.mockMakgeolli)!),
                           product: Image(systemName: "hand.thumbsdown.fill"),
                           title: "막걸리 이름")
        }
    }
}
