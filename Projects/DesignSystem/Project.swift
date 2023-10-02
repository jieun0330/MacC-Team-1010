import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
	name: "DesignSystem",
	product: .staticFramework,
	dependencies: [
		
	],
	sources: ["Sources/**"],
	resources: ["Resources/**"]
)
