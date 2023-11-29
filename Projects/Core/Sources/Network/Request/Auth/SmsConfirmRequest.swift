//
//  SmsConfirmRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct SmsConfirmRequest: Codable {
	let phone: String
	let certificationNumber: String
	
	public init(phone: String, certificationNumber: String) {
		self.phone = phone
		self.certificationNumber = certificationNumber
	}
}
