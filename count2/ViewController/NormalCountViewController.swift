//
//  NormalCountViewController.swift
//  count2
//
//  Created by ST20591 on 2018/01/09.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

class NormalCountViewController: CounterBaseViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Constants.tintColor
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        label.constraintTo(fullWidthOf: view, withHeight: 50, centerY: view.safeAreaLayoutGuide.centerYAnchor, yOffset: -30)
        
        let edgeView = EdgeView(contentView: countButton, position: .bottom)
        edgeView.backgroundColor = Constants.tintColor
        edgeView.contentViewHeight = 60
        edgeView.addTo(viewController: self)
        
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.bottomAnchor.constraint(equalTo: edgeView.topAnchor, constant: -20),
            resetButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 50)
            ])
        resetButton.layer.cornerRadius = 25
        
        counter.observe { [weak self] value in
            self?.label.text = "\(value)"
        }
    }
}
