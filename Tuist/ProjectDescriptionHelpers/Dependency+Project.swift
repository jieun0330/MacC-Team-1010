//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/09/24.
//

import ProjectDescription

public extension TargetDependency {
	enum Project {}
}

public extension TargetDependency.Project {
	static let Core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
	static let Common = TargetDependency.project(target: "Common", path: .relativeToRoot("Projects/Common"))
	static let DesignSystem = TargetDependency.project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
	static let Feature = TargetDependency.project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
	static let FeatureMain = TargetDependency.project(target: "FeatureMain", path: .relativeToRoot("Projects/FeatureMain"))
}
