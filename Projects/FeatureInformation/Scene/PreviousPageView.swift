//
//  InformationView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/12.
//

import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

public struct PreviousPageView: View {
    public init() {}
    public var body: some View {
        NavigationView {
            NavigationLink(destination: InformationView(), label: {
                Text("Previous Page")
            })
        }
    }
}

struct PreviousPageView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousPageView()
    }
}

