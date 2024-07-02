//
//  ThemeColorPickerView.swift
//  BestParks-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class ThemeColorPickerView: UIView {
    weak var delegate: ThemeColorPickerDelegate?
    
    private lazy var buttons: [UIButton] = {
        let colors: [(name: String, value: UIColor)] = [
            (name: "green", value: .systemGreen),
            (name: "indigo", value: .systemIndigo),
            (name: "yellow", value: .systemYellow),
            (name: "mint", value: .systemCyan)
        ]
        
        return colors.map { (name, value) in
            let button = UIButton(
                frame: .zero,
                primaryAction: UIAction() { [unowned self] _ in
                    delegate?.themeColorPickerView(didSelectColor: value)
                }
            )
            button.accessibilityLabel = "Pick \(name) color"
            button.backgroundColor = value
            button.layer.cornerRadius = 30
            button.layer.cornerCurve = .continuous
            return button
        }
    }()
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init from a decoder is not defined")
    }
    
    private func configureView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            stack.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 0
            ),
            stack.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: 0
            ),
            stack.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: 0
            ),
        ])
    }
}

protocol ThemeColorPickerDelegate: AnyObject {
    func themeColorPickerView(didSelectColor: UIColor)
}
