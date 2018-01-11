//
//  TimerCountViewController.swift
//  count2
//
//  Created by ST20591 on 2018/01/09.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

class TimerCountViewController: CounterBaseViewController {
    var label: UILabel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label = setupValueViewAsCenterLabel()
        
        label?.textColor = Constants.backgroundColor
        view.backgroundColor = Constants.tintColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        counter.countWithTimer(timeInterval: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        counter.invalidateTimer()
    }
}
