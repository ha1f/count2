//
//  ToolsView.swift
//  count2
//
//  Created by ST20591 on 2018/01/11.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

final class ToolsView: UIView {
    let horizontalInset: CGFloat = 8
    
    var rightItem: UIView? {
        didSet {
            // 元々あれば消す
            oldValue?.removeFromSuperview()
            if let item = rightItem {
                self._configureItem(item, position: .right)
            }
        }
    }
    
    var leftItem: UIView? {
        didSet {
            // 元々あれば消す
            oldValue?.removeFromSuperview()
            if let item = leftItem {
                self._configureItem(item, position: .left)
            }
        }
    }
    
    enum ItemPosition {
        case right
        case left
    }
    
    private func _configureItem(_ item: UIView, position: ItemPosition) {
        self.addSubview(item)
        
        item.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [
            item.topAnchor.constraint(equalTo: self.topAnchor),
            item.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            item.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1)
        ]
        switch position {
        case .right:
            constraints.append(item.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -horizontalInset))
        case .left:
            constraints.append(item.leftAnchor.constraint(equalTo: self.leftAnchor, constant: horizontalInset))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}
