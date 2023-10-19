//
//  MockData.swift
//  Core
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public class MockData {
	
	public init() { }

	/// 느린마을  막걸리 10개
	public static func createNormalMockMakgeolli() -> [MockMakgeolliModel] {
		var mockMakgeolliArray = [MockMakgeolliModel]()
		for _ in 0..<10 {
			mockMakgeolliArray.append(MockMakgeolliModel())
		}
		return mockMakgeolliArray
	}
}
