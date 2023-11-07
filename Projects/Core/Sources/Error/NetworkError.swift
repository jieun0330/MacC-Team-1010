//
//  NetworkError.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
	case normal
}

extension NetworkError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .normal:
			return NSLocalizedString("네트워크 에러", comment: "Network Error")
		}
	}
}
