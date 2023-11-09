import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "FeatureOnboarding",
	product: .staticFramework,
//	product: .app,
	dependencies: [
		.Project.Core,
		.Project.DesignSystem,
		.Project.FeatureHome,
		.Project.FeatureSearch,
		.Project.FeatureEncyclopedia,
		.Project.FeatureProfile
	],
	sources: ["Scene/**"]
)
