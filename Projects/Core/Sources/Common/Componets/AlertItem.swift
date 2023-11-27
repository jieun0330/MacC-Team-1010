//
//  AlertItem.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI

public struct AlertItem: Identifiable {
	public var id = UUID()
	public var title: Text
	public var message: Text?
	public var dismissButton: Alert.Button?
	public var primaryButton: Alert.Button?
	public var secondaryButton: Alert.Button?
	
	public init(id: UUID = UUID(),
				title: Text,
				message: Text? = nil,
				dismissButton: Alert.Button? = nil,
				primaryButton: Alert.Button? = nil,
				secondaryButton: Alert.Button? = nil
	) {
		self.id = id
		self.title = title
		self.message = message
		self.dismissButton = dismissButton
		self.primaryButton = primaryButton
		self.secondaryButton = secondaryButton
	}
}
