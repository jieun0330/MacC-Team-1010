//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/09/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
	carthage: [],
	swiftPackageManager: [
		.moya,
		.kingfisher,
		.firebase
	],
	platforms: [.iOS]
)

fileprivate extension Package {
	static let moya: Self = .remote(url: "https://github.com/Moya/Moya", requirement: .upToNextMajor(from: "15.0.0"))
	static let kingfisher: Self = .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.0.0"))
	static let firebase  : Self = .remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement: .upToNextMajor(from: "9.0.0"))
}
