import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "TenTen",
	platform: .iOS,
	product: .app,
	dependencies: [
		.SPM.Kingfisher,
		.SPM.Moya,
		.Project.Common,
		.Project.DesignSystem,
		.Project.Core,
		.Project.Feature
	],
	sources: ["Sources/**"],
	resources: ["Resources/**"],
	infoPlist: .file(path: "Support/Info.plist")
)
