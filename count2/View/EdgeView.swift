//
//  EdgeView.swift
//  Musubi
//
//  Created by はるふ on 2017/12/27.
//  Copyright © 2017年 はるふ. All rights reserved.
//

import UIKit

final class EdgeView: UIView {
    enum Position {
        case top
        case bottom
    }
    
    private(set) var position = Position.top
    private(set) var contentView: UIView = ToolsView()
    
    var contentViewHeightConstraint: NSLayoutConstraint?
    
    var contentViewHeight: CGFloat = 44 {
        didSet {
            contentViewHeightConstraint?.constant = contentViewHeight
        }
    }
    
    private(set) lazy var titleLabel: UILabel = UILabel()
    var title: String = "" {
        didSet {
            titleLabel.text = title
            titleLabel.sizeToFit()
        }
    }
    
    convenience init(contentView: UIView, position: Position = Position.top) {
        self.init()
        self.contentView = contentView
        self.position = position
    }
    
    private func _configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1)
            ])
    }
    
    func addTo(viewController: UIViewController) {
        viewController.view.subviews.filter { ($0 as? EdgeView)?.position == self.position }.forEach { view in
            view.removeFromSuperview()
        }
        viewController.view.addSubview(self)
        
        _configureContentView(viewController: viewController)
        
        _configureTitleLabel()
    }
    
    private func _configureContentView(viewController: UIViewController) {
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalToConstant: contentViewHeight)
        self.contentViewHeightConstraint = contentViewHeightConstraint
        var contentViewConstraints = [
            contentViewHeightConstraint,
            contentView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuideCompatible.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuideCompatible.rightAnchor)
        ]
        switch self.position {
        case .top:
            contentViewConstraints.append(contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuideCompatible.topAnchor))
        case .bottom:
            contentViewConstraints.append(contentView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuideCompatible.bottomAnchor))
        }
        NSLayoutConstraint.activate(contentViewConstraints)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        var viewConstraints = [
            self.leftAnchor.constraint(equalTo: viewController.view.leftAnchor),
            self.rightAnchor.constraint(equalTo: viewController.view.rightAnchor)
        ]
        switch self.position {
        case .top:
            viewConstraints.append(contentsOf: [
                self.topAnchor.constraint(equalTo: viewController.view.topAnchor),
                self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                ])
        case .bottom:
            viewConstraints.append(contentsOf: [
                self.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
                self.topAnchor.constraint(equalTo: contentView.topAnchor)
                ])
        }
        NSLayoutConstraint.activate(viewConstraints)
    }
}
