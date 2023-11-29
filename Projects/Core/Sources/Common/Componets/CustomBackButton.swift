//
//  CustomBackButton.swift
//  Common
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct CustomBackButton: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

	let title: String

	public init(title: String = "돌아가기") { self.title = title }

	public var body: some View {
		Button(action: {
			self.presentationMode.wrappedValue.dismiss()
		}) {
			HStack(spacing: 3) {
				Image(systemName: "chevron.left")
				Text(title)
			}
		}
	}
}

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
	super.viewWillLayoutSubviews()
	  navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}
