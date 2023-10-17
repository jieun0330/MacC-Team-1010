//
//  KeyChainManager.swift
//  Utils
//
//  Created by Kim SungHun on 2023/10/14.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Security

public final class KeyChainManager {
	
	public static let shared = KeyChainManager()
	static let serviceName = "kr.tenten.com"
	
	public init() { }
	
	public func create(account: KeyChainAccount, data: String) throws {
		let query = [
			kSecClass: account.keyChainClass,
			kSecAttrService: KeyChainManager.serviceName,
			kSecAttrAccount: account.description,
			kSecValueData: (data as AnyObject).data(using: String.Encoding.utf8.rawValue) as Any
		] as CFDictionary
		
		SecItemDelete(query as CFDictionary)
		
		let status = SecItemAdd(query as CFDictionary, nil)
		
		guard status == noErr else {
			throw KeyChainError.unhandledError(status: status)
		}
	}
	
	public func read(account: KeyChainAccount) -> String {
		let query = [
			kSecClass: account.keyChainClass,
			kSecAttrService: KeyChainManager.serviceName,
			kSecAttrAccount: account.description,
			kSecReturnData: true
		] as [CFString : Any] as CFDictionary
		
		var dataTypeRef: AnyObject?
		let status = SecItemCopyMatching(query, &dataTypeRef)

		if status == errSecSuccess,
		   let item = dataTypeRef as? Data,
		   let data = String(data: item, encoding: String.Encoding.utf8) {
			return data
		}
		
		return ""
	}
	
	public func delete(account: KeyChainAccount) throws {
		let query = [
			kSecClass: account.keyChainClass,
			kSecAttrService: KeyChainManager.serviceName,
			kSecAttrAccount: account.description
		] as [CFString : Any] as CFDictionary
		
		let status = SecItemDelete(query)
		
		guard status == errSecSuccess || status == errSecItemNotFound else {
			throw KeyChainError.unhandledError(status: status)
		}
	}
}
