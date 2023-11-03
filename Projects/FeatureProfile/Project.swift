import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "FeatureProfile",
	product: .staticFramework,
//	product: .app,
	dependencies: [
		.SPM.Kingfisher,
		.Project.Core,
		.Project.DesignSystem
	],
	sources: ["Scene/**"]
)
