//
//  Dependency+SPM.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/09/24.
//

import ProjectDescription

public extension TargetDependency {
	enum SPM {}
}

public extension TargetDependency.SPM {
	static let Kingfisher = TargetDependency.external(name: "Kingfisher")
	static let Moya = TargetDependency.external(name: "Moya")
	static let FirebaseAuth         = TargetDependency.external(name: "FirebaseAuth")
	static let FirebaseAnalytics    = TargetDependency.external(name: "FirebaseAnalytics")
	static let FirebaseFirestore    = TargetDependency.external(name: "FirebaseFirestore")
	static let FirebaseRemoteConfig = TargetDependency.external(name: "FirebaseRemoteConfig")
}
