//
//  FooyoIndex.swift
//  FooyoSDKExample
//
//  Created by Yangfan Liu on 30/8/17.
//  Copyright © 2017 Yangfan Liu. All rights reserved.
//

import UIKit

public class FooyoIndex: NSObject {
    var category: String?
    var levelOneId: Int?
    var levelTwoId: Int?
    
    init(category: String) {
        super.init()
        self.category = category
    }
    init(category: String, levelOneId: Int) {
        super.init()
        self.category = category
        self.levelOneId = levelOneId
    }
    init(category: String, levelOneId: Int, levelTwoId: Int) {
        super.init()
        self.category = category
        self.levelOneId = levelOneId
        self.levelTwoId = levelTwoId
    }
}
