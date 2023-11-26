import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "FeatureCamera",
	product: .staticFramework,
//	product: .app,
	dependencies: [
		.Project.Core,
		.Project.DesignSystem
	],
	sources: ["Scene/**"]
)
