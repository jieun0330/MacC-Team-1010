//
//  Logger.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum Logger {
	public static func debug(
		error: Error,
		message: String,
		file: String = #file,
		function: String = #function,
		line: Int = #line
	) {
		let file = file.components(separatedBy: ["/"]).last ?? ""
		print("\(Date().toString(.log)) [⛔️][\(file)][\(function)][\(line)] -> \(message)")
		print(error.localizedDescription)
		debugPrint(error)
	}
}
