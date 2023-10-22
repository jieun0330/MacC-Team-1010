//
//  SearchResultSingleView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/22.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct SearchResultSingleView: View {
    
    let makgeolliData: MockMakgeolliModel
    
    var body: some View {
        HStack {
            Image(uiImage: .designSystem(makgeolliData.imageName)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 21, height: 42)
            
            Spacer()
                .frame(width: 16)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(makgeolliData.name)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                Spacer()
                    .frame(width: 5)
                Text(makgeolliData.breweryName)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                    .opacity(0.5)
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
