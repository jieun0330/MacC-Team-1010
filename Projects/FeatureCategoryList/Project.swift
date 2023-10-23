import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "FeatureCategoryList",
	product: .framework,
//	product: .app,
	dependencies: [
		.SPM.Kingfisher,
		.Project.Core,
		.Project.DesignSystem,
		.Project.FeatureInformation
	],
	sources: ["Scene/**"]
)
