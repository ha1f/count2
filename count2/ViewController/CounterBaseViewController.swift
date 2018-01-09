//
//  CounterBaseViewController.swift
//  count2
//
//  Created by ST20591 on 2018/01/09.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

class CounterBaseViewController: UIViewController {
    lazy var counter: Counter = {
        let counter = Counter()
        return counter
    }()
    
    lazy var countButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitle("+", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = Constants.tintColor
        button.addTarget(self, action: #selector(self.onCountButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitle("C", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = Constants.tintColor
        button.addTarget(self, action: #selector(self.onResetButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
    }
    
    @objc
    func onCountButtonPressed(_ button: UIButton) {
        counter.count()
    }
    
    @objc
    func onResetButtonPressed(_ button: UIButton) {
        counter.resetCounter()
    }
    
    deinit {
        counter.resetObserver()
    }
}
