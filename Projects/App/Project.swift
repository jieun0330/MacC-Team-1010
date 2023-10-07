import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "App",
	platform: .iOS,
	product: .app,
	dependencies: [
		.Project.Feature
	],
	sources: ["Sources/**"],
	resources: ["Resources/**"],
	infoPlist: .file(path: "Support/Info.plist")
)
