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
    
    /// You must override this property!!!
    var valueView: CounterValueViewType {
        return UILabel()
    }
    
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
        
        counter.observe { [weak self] value in
            DispatchQueue.main.async {
                self?.valueView.setCounterValue(value)
            }
        }
    }
    
    /// 良くないけど時短のため
    func setupCountButtonAsBottomEdge() -> EdgeView {
        let edgeView: EdgeView = {
            let edgeView = EdgeView(contentView: countButton, position: .bottom)
            edgeView.backgroundColor = Constants.tintColor
            edgeView.contentViewHeight = 60
            return edgeView
        }()
        edgeView.addTo(viewController: self)
        return edgeView
    }
    
    /// 良くないけど時短のため
    func setupValueViewAsCenterLabel() -> UILabel {
        let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = Constants.tintColor
            label.font = UIFont.systemFont(ofSize: 50)
            return label
        }()
        view.addSubview(label)
        label.constraintTo(fullWidthOf: view, withHeight: 50, centerY: view.safeAreaLayoutGuide.centerYAnchor, yOffset: -30)
        return label
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
