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
	let title: String
	
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	public init(title: String = "돌아가기") { self.title = title }
	
	public var body: some View {
		Button(action: {
			self.presentationMode.wrappedValue.dismiss()
		}) {
			HStack(spacing: 3) {
				Image(systemName: "chevron.left")
				Text(title)
			}
			.foregroundColor(Color(uiColor: .designSystem(.tempBackButtonGrayColor)!))
		}
	}
}

extension UINavigationController: UIGestureRecognizerDelegate {
	override open func viewDidLoad() {
		super.viewDidLoad()
		interactivePopGestureRecognizer?.delegate = self
	}
	
	public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
		return viewControllers.count > 1
	}
}
