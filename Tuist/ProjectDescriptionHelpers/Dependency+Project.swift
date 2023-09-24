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
	static let Common = TargetDependency.project(target: "Common", path: .relativeToRoot("Projects/Common"))
}
