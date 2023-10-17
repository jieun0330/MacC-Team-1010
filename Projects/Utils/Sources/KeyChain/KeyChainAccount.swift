//
//  KeyChainAccount.swift
//  Utils
//
//  Created by Kim SungHun on 2023/10/14.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum KeyChainAccount {
	case accessToken
	case accesstokenExpiredTime
	case refreshToken
	case refreshTokenExpiredTime
	
	var description: String {
		return String(describing: self)
	}
	
	var keyChainClass: CFString {
		switch self {
		case .accessToken:
			return kSecClassGenericPassword
		case .accesstokenExpiredTime:
			return kSecClassGenericPassword
		case .refreshToken:
			return kSecClassGenericPassword
		case .refreshTokenExpiredTime:
			return kSecClassGenericPassword
		}
	}
}
