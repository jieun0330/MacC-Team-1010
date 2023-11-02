//
//  Thumbnail.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct Thumbnail: Identifiable {
    public let id = UUID()
    var comment: Image
    var save: Image
    var makgeolliImage: Image
    
    var liked: Image
    var title: String
}

extension Thumbnail {
    public static var dummyThumbNailModel: [Thumbnail] {
        (0...30).map { (number: Int) in
            
            Thumbnail(comment: Image(systemName: "ellipsis.message.fill"),
                      save: Image(systemName: "heart.fill"),
                      makgeolliImage: Image(uiImage: .designSystem(.mockMakgeolli)!),
                      liked: Image(systemName: "hand.thumbsdown.fill"),
                      title: "막걸리 이름")
        }
    }
}


