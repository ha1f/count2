//
//  NormalCountViewController.swift
//  count2
//
//  Created by ST20591 on 2018/01/09.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

class NormalCountViewController: CounterBaseViewController {
    
    override var valueView: CounterValueViewType {
        return label ?? UILabel()
    }
    
    var label: UILabel? = nil
    var edgeView: EdgeView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label = setupValueViewAsCenterLabel()
        
        edgeView = setupCountButtonAsBottomEdge()
        
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.bottomAnchor.constraint(equalTo: edgeView!.topAnchor, constant: -20),
            resetButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 50)
            ])
        resetButton.layer.cornerRadius = 25
    }
}
