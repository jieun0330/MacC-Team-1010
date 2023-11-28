//
//  KeyChainAccount.swift
//  Utils
//
//  Created by Kim SungHun on 2023/10/14.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum KeyChainAccount {
	case userId
	case nickname
	case phoneBackNum
	case profileImage
	
	var description: String {
		return String(describing: self)
	}
	
	var keyChainClass: CFString {
		switch self {
		case .userId:
			return kSecClassGenericPassword
		case .nickname:
			return kSecClassGenericPassword
		case .phoneBackNum:
			return kSecClassGenericPassword
		case .profileImage:
			return kSecClassGenericPassword
		}
	}
}
