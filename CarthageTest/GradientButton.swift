//
//  GradientButton.swift
//  SmartSentosa
//
//  Created by Yangfan Liu on 14/4/17.
//  Copyright © 2017 Yangfan Liu. All rights reserved.
//

import UIKit

class GradientButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        self.applyGradient(colours: [UIColor.sntOrangeish, UIColor.sntTomato])
    }

}
