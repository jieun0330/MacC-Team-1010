import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "Feature",
	product: .staticFramework,
	dependencies: [
		.Project.FeatureMain,
		.Project.FeatureAuth,
		.Project.FeatureSearch,
		.Project.FeatureInformation
	],
	sources: ["Scene/**"]
)
