//
//  UIView+Extension.swift
//  CropViewController
//
//  Created by ST20591 on 2017/10/27.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

enum EdgePosition: UInt8 {
    case top = 1
    case left = 2
    case right = 4
    case bottom = 8
}

enum CornerPosition: UInt8 {
    case topLeft = 3
    case topRight = 5
    case bottomLeft = 10
    case bottomRight = 12
    var isTop: Bool {
        return (self.rawValue & EdgePosition.top.rawValue) > 0
    }
    var isLeft: Bool {
        return (self.rawValue & EdgePosition.left.rawValue) > 0
    }
}

// AutoLayoutHelper
// TODO: safeAreaをどうするか
extension UIView {
    
    /// 四隅
    func constraintTo(cornerOf view: UIView, withPosition position: CornerPosition, width: CGFloat, height: CGFloat, xMargin: CGFloat = 0, yMargin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
        ]
        if position.isTop {
            constraints.append(topAnchor.constraint(equalTo: view.topAnchor, constant: yMargin))
        } else {
            constraints.append(bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -yMargin))
        }
        
        if position.isLeft {
            constraints.append(leftAnchor.constraint(equalTo: view.leftAnchor, constant: xMargin))
        } else {
            constraints.append(rightAnchor.constraint(equalTo: view.rightAnchor, constant: -xMargin))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 横幅いっぱい
    func constraintTo(fullWidthOf view: UIView, withHeight height: CGFloat, centerY: NSLayoutYAxisAnchor, yOffset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: centerY, constant: yOffset),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            heightAnchor.constraint(equalToConstant: height)
            ])
    }
    
    /// 中央
    func constraintTo(centerOf view: UIView, width: CGFloat, height: CGFloat, xOffset: CGFloat = 0, yOffset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset),
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset),
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
            ])
    }
    
    /// 同フレーム
    func constraintTo(frameOf view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    /// safeArea
    @available(iOS 11.0, *)
    func constraintTo(safeAreaOf view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
