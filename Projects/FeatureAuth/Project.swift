import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "FeatureAuth",
	product: .framework,
//	product: .app,
	dependencies: [
		.Project.Core,
		.Project.DesignSystem,
		.Project.FeatureHome
	],
	sources: ["Scene/**"]
)
