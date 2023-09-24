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
	],
	resources: ["Resources/**"],
	infoPlist: .file(path: "Support/Info.plist")
)
