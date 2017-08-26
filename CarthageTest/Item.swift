//
//  Item.swift
//  SmartSentosa
//
//  Created by Yangfan Liu on 21/2/17.
//  Copyright © 2017 Yangfan Liu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Mapbox
//import DateToolsSwift

public class Item: BaseModel {
    
    static var items = [Item]()
    
    var ospId: Int?
    var name: String?
    var category: Category?
    var operation: String?
    var budget: Double?
    var coverImages: String?
    var coordinateLan: Double?
    var coordinateLon: Double?
    
    public init(json: JSON) {
        super.init()
        id = json["id"].int
        name = json["name"].string
        operation = json["operation_hours"].string
        if json["category"] != nil {
            category = Category(json: json["category"])
        }
        budget = json["budget"].double
        coordinateLan = json["lat"].double
        coordinateLon = json["lng"].double
        coverImages = json["thumbnail"].string
        ospId = json["osp_id"].int
    }
    
    override public init() {
        super.init()
    }
    
}
