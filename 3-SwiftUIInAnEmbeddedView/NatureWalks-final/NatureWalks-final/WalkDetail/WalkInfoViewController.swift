//
//  WalkInfoViewController.swift
//  NatureWalks-final
//
//  Created by Natalia Panferova on 24/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

class WalkInfoViewController: UIHostingController<WalkInfoWrapperView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(
            coder: aDecoder,
            rootView: WalkInfoWrapperView(walk: nil)
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.invalidateIntrinsicContentSize()
    }
}

struct WalkInfoWrapperView: View {
    let walk: Walk?
    
    var body: some View {
        if let walk = walk {
            WalkInfoView(walk: walk)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
        } else {
            Text("No walk is selected.")
        }
    }
}
