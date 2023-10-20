import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "Feature",
	product: .staticFramework,
	dependencies: [
		.Project.FeatureMain,
		.Project.FeatureAuth,
		.Project.FeatureInformation,
		.Project.FeatureCategory
	],
	sources: ["Scene/**"]
)
