//
//  CounterValueViewType.swift
//  count2
//
//  Created by ST20591 on 2018/01/11.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

protocol CounterValueViewType {
    func setCounterValue(_ value: Int)
}

extension UILabel: CounterValueViewType {
    func setCounterValue(_ value: Int) {
        self.text = "\(value)"
    }
}
