//
//  TimerCountViewController.swift
//  count2
//
//  Created by ST20591 on 2018/01/09.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import Foundation

class TimerCountViewController: NormalCountViewController {
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgeView.removeFromSuperview()
        resetButton.removeFromSuperview()
        
        label.textColor = Constants.backgroundColor
        view.backgroundColor = Constants.tintColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resetTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        invalidateTimer()
    }
    
    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func resetTimer() {
        invalidateTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.counter.count()
        }
    }
}
