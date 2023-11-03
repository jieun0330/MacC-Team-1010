import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "FeatureCategory",
	product: .staticFramework,
//	product: .app,
	dependencies: [
		.SPM.Kingfisher,
		.Project.Core,
		.Project.DesignSystem,
		.Project.FeatureInformation
	],
	sources: ["Scene/**"]
)
