//
//  CustomActionSheet.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/10.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

struct CustomActionSheet: View {
    
    @Binding var showModal: Bool
    @Binding var showingAlert: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: { showModal = true }) { Text("수정하기") }
                Button(action: { showingAlert = true }) { Text("삭제하기") }
                Button(action: { }) { Text("취소하기") }
            }
        }
    }
}

