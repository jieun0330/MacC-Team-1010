import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "App",
	platform: .iOS,
	product: .app,
	dependencies: [
		.Project.Feature,
		.SPM.FirebaseAuth,
		.SPM.FirebaseFirestore,
		.SPM.FirebaseAnalytics,
		.SPM.FirebaseRemoteConfig
	],
	sources: ["Sources/**"],
	resources: ["Resources/**"],
	infoPlist: .file(path: "Support/Info.plist")
)
