import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "Core",
	product: .staticFramework,
	dependencies: [
		.Project.Utils,
		.SPM.Moya,
		.SPM.FirebaseAuth,
		.SPM.FirebaseFirestore,
		.SPM.FirebaseAnalytics,
		.SPM.FirebaseRemoteConfig
	],
	sources: ["Sources/**"]
)
