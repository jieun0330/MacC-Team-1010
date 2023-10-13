import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "FeatureSearch",
	product: .framework,
//	product: .app,
	dependencies: [
		.SPM.Kingfisher,
		.Project.Core,
		.Project.DesignSystem
	],
	sources: ["Scene/**"]
)
