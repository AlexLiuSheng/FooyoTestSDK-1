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
    static var vivo = Item()
    
    var name: String?
    var category: String?
    var coordinateLan: String?
    var coordinateLon: String?
    var coverImages: [String]?// = ["https://www.tsttourist.com/UserFiles/Image/vivocity.jpg"]
    var isBookmarked: Bool?
    var operation: String?
    var overView: String?
    var adm: String?
    var admRestriction: String?
    var getThere: String?
    var address: String?
    var email: String?
    var phone: String?
    var website: String?
    // for attraction
    var queueTime: Int?
    // for show
    var nextShowTime: String?
    var schedule: String?
    // for stop
    var buses: [Bus]?
    // for restaurant
    var type: String?
    
    var arrivingTime: String?
    var visitingTime: Int? = 30
    var lowBudgetVisitingTime: Int? = 30

    var crowd: String?
    var budget: Double?
    var themes: [Theme]?
    
//    var cat
    public init(json: JSON) {
        super.init()
        id = json["id"].int
        name = json["name"].string
        category = json["category"].string
        coordinateLan = json["lat"].string
        coordinateLon = json["lng"].string
        if json["images"] != nil {
            if json["images"].count != 0 {
                coverImages = json["images"].arrayValue.map{ $0.string! }
            }
        }
        isBookmarked = json["bookmarked"].bool
        operation = json["operation_hours"].string
        overView = json["overview"].string
        adm = json["admission"].string
        admRestriction = json["admission_restriction"].string
        getThere = json["get_there"].string
        address = json["address"].string
        queueTime = json["queue_time"].int
        type = json["cuisine_type"].string
        schedule = json["schedule"].string
        email = json["email"].string
        phone = json["phone"].string
        website = json["website"].string
        nextShowTime = json["next_show_time"].string
        arrivingTime = json["arriving_time"].string
        visitingTime = json["visiting_time"].int
        lowBudgetVisitingTime = json["low_budget_visiting_time"].int

        crowd = json["crowd"].string
        if json["budget"].double != nil {
            budget = json["budget"].double
        } else if json["budget"].string != nil {
            budget = Double(json["budget"].string!)
        }
        
        if json["buses"] != nil {
            buses = json["buses"].arrayValue.map{ Bus(json: $0) }
            for each in buses! {
                each.queueTime = self.queueTime
            }
        }
        if json["themes"] != nil {
            themes = json["themes"].arrayValue.map{ Theme(json: $0) }
        }
    }
    
    override public init() {
        super.init()
    }
    func getState() -> String {
//        if check24hr() {
//            return "Open 24 hours"
//        }
//        if let category = self.category {
//            switch category {
//            case "attraction":
//                return checkAttractionState()
//            case "show":
//                return checkShowState()
//            case "restaurant":
//                return checkRestaurantState()
//            case "shop":
//                return checkShopState()
//            case "bus_stop":
//                var state = ""
//                for each in buses! {
//                    state.append(each.giveState() + "\n")
//                }
//                state = String(state.characters.dropLast())
//                return state
//            case "express_stop":
//                var state = ""
//                for each in buses! {
//                    state.append(each.giveState() + "\n")
//                }
//                state = String(state.characters.dropLast())
//                return state
//            case "restroom":
//                return "Open"
//            default:
//                return "Some text here"
//            }
//        }
        return "Some text here"
    }
    
//    func check24hr() -> Bool {
//        if operation == "24hrs" {
//            return true
//        }
//        return false
//    }
//    func checkAttractionState() -> String {
//        var open = false
//        var willOpenInOneHour = false
//        var willCloseInOneHour = false
//        (open, willOpenInOneHour, willCloseInOneHour) = checkOperation()
//        if open {
//            if let crowd = crowd {
//                return "Crowd Status: \(crowd)"
//            } else {
//                if willCloseInOneHour {
//                    return "Will close at " + getCloseTimeString()
//                } else {
//                    return "Open"
//                }
//            }
//        } else {
//            if willOpenInOneHour {
//                return "Opening at " + getOpenTimeString()
//            } else {
//                return "Closed (Operation: \(operation!))"
//            }
//        }
//    }
//    
//    func checkShowState() -> String {
//        var open = false
//        var willOpenInOneHour = false
//        var willCloseInOneHour = false
//
//        (open, willOpenInOneHour, willCloseInOneHour) = checkOperation()
//        if open {
//            if let time = nextShowTime {
//                return "Next Show: \(time)"
//            } else {
//                if willCloseInOneHour {
//                    return "Will close at " + getCloseTimeString()
//                } else {
//                    return "Open"
//                }
//            }
//        } else {
//            if willOpenInOneHour {
//                return "Opening at " + getOpenTimeString()
//            } else {
//                return "Closed (Operation: \(operation!))"
//            }
//        }
//    }
//    
//    func checkRestaurantState() -> String {
//        var open = false
//        var willOpenInOneHour = false
//        var willCloseInOneHour = false
//
//        (open, willOpenInOneHour, willCloseInOneHour) = checkOperation()
//        if open {
//            if willCloseInOneHour {
//                return "Will close at " + getCloseTimeString()
//            } else {
//                return "Open"
//            }
//        } else {
//            if willOpenInOneHour {
//                return "Opening at " + getOpenTimeString()
//            } else {
//                return "Closed (operation: \(operation!))"
//            }
//        }
//    }
//    
//    func checkShopState() -> String {
//        var open = false
//        var willOpenInOneHour = false
//        var willCloseInOneHour = false
//        
//        (open, willOpenInOneHour, willCloseInOneHour) = checkOperation()
//        if open {
//            if willCloseInOneHour {
//                return "Will close at " + getCloseTimeString()
//            } else {
//                return "Open"
//            }
//        } else {
//            if willOpenInOneHour {
//                return "Opening at " + getOpenTimeString()
//            } else {
//                return "Closed (operation: \(operation!))"
//            }
//        }
//    }
    
//    func checkOperation() -> (Bool, Bool, Bool) {
//        let time = DateTimeTool.fromDateToFormatOne(date: Date())
//        let now = DateTimeTool.fromFormatOneToDate(time)
//        let open = DateTimeTool.fromFormatOneToDate(getOpenTimeString())
//        let close = DateTimeTool.fromFormatOneToDate(getCloseTimeString())
//        if now.isEarlierThanOrEqual(to: close) && now.isLaterThanOrEqual(to: open) {
////            if now.hoursEarlierThan(close) < 1 {
////            now.date
//            if now.hoursEarlier(than: close) < 1 {
//                return (true, true, true)
//            } else {
//                return (true, true, false)
//            }
//        } else {
////            if now.isEarlierThan(open) && now.hoursEarlierThan(open) < 1 {
//            if now.isEarlier(than: open) && now.hoursEarlier(than: open) < 1 {
//                return (false, true, true)
//            } else {
//                return (false, false, true)
//            }
//        }
//    }
    
    func getOpenTimeString() -> String {
        return findMatchingStr(input: operation!, regex: "([0-9:]+) ")!
    }
    
    func getCloseTimeString() -> String {
        return findMatchingStr(input: operation!, regex: " ([0-9:]+)")!
    }
    
    func getContact() -> String {
        var contact = ""
        if let phone = phone {
            contact = "Phone: " + phone
        }
        if let email = email {
            contact = contact + "\nEmail: " + email
        }
        if let web = website {
            contact = contact + "\nWebsite: " + web
        }
        if contact == "" {
            contact = "There is no contact information."
        }
        return contact
    }
    
    func getCoor() -> CLLocationCoordinate2D {
        let lat = Double(self.coordinateLan!)!
        let lon = Double(self.coordinateLon!)!
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
    func getDataForStorage() -> [String: Any] {
        var data = [String: Any]()
        data["category"] = self.category!
        data["name"] = self.name!
        data["id"] = self.id!
        return data
    }
    
    func getVisitingTime() -> String {
        if visitingTime! < 60 {
            return "\(String(describing: self.visitingTime!)) mins"
        } else {
            let mins = visitingTime! - 60
            if mins > 0 {
                return "1 hr \(String(mins)) mins"
            } else {
                return "1 hr"
            }
        }
    }
    func getLowBudgetVisitingTime() -> String {
        if lowBudgetVisitingTime! < 60 {
            return "\(String(describing: self.lowBudgetVisitingTime!)) mins"
        } else if lowBudgetVisitingTime! < 120 {
            let mins = lowBudgetVisitingTime! - 60
            if mins > 0 {
                return "1 hr \(String(mins)) mins"
            } else {
                return "1 hr"
            }
        } else {
            let mins = lowBudgetVisitingTime! - 120
            if mins > 0 {
                return "2 hr \(String(mins)) mins"
            } else {
                return "2 hr"
            }
        }
    }
    
    func belongsToTheme(theme: String?) -> Bool {
//        debugPrint(<#T##items: Any...##Any#>)
        if let theme = theme {
            if let themes = themes {
                for each in themes {
                    if each.name!.lowercased() == theme.lowercased() {
                        return true
                    }
                }
            }
        }
        return false
    }
}
