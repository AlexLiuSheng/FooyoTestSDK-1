//
//  HTTPClient.swift
//  SmartSentosa
//
//  Created by Yangfan Liu on 23/2/17.
//  Copyright © 2017 Yangfan Liu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Mapbox


protocol HttpClientDelegte: class {
    func alertMessage(title: String, message: String)
    func logout()
}

class HttpClient: NSObject {
    static let sharedInstance = HttpClient()
    weak var delegate: HttpClientDelegte?
    
    // MARK: - Items
    func getItems(completion: @escaping (_ items: [Item]?, _ isSuccess: Bool) -> Void) {
        Alamofire.request("\(Constants.EndPoint.baseURL)/places", method: .get, encoding: JSONEncoding.default).responseJSON { (response) -> Void in
            debugPrint(response)
            let code = (response.response?.statusCode) ?? 500
            if code >= 200 && code <= 299 {
                if let json = response.result.value {
                    let data = JSON(json)
                    if data["places"] != nil {
                        var items = [Item]()
                        items = data["places"].arrayValue.map{ Item(json: $0) }
                        completion(items, true)
                        return
                    }
                }
            } else if code == 401 {
                self.delegate?.logout()
                return
            } else {
                if let json = response.result.value {
                    if let json = json as? [String: AnyObject] {
                        if let errors = json["errors"] as? [String] {
                            if errors.count != 0 {
                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
                            }
                        }
                    }
                }
            }
            completion(nil, false)
        }
    }
    
//    func getItemDetail(id: Int, completion: @escaping (_ item: Item?, _ isSuccess: Bool) -> Void) {
//        Alamofire.request("\(Constants.EndPoint.baseURL)/places/\(id)", method: .get, encoding: JSONEncoding.default).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["place"] != nil {
//                        let item = Item(json: data["place"])
//                        completion(item, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    
//    func searchItems(key: String, completion: @escaping (_ items: [Item]?, _ isSuccess: Bool) -> Void) {
//        let params: [String: String] = [
//            "q": key
//        ]
//        Alamofire.request("\(Constants.EndPoint.baseURL)/places", method: .get, parameters: params).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["places"] != nil {
//                        var items = [Item]()
//                        items = data["places"].arrayValue.map{ Item(json: $0) }
//                        completion(items, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    
//    // MARK: - Navigation
//    func findNavigationFor(start: CLLocationCoordinate2D, end: CLLocationCoordinate2D, completion: @escaping (_ routes: [Route]?, _ isSuccess: Bool) -> Void) {
//        let startLat = start.latitude
//        let startLon = start.longitude
//        let endLat = end.latitude
//        let endLon = end.longitude
//        let url = "\(Constants.EndPoint.baseURL)/routes?point[]=\(startLat)%2C\(startLon)&point[]=\(endLat)%2C\(endLon)"
//        debugPrint(url)
//        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["routes"] != nil {
//                        var routes = [Route]()
//                        routes = data["routes"].arrayValue.map{ Route(json: $0) }
//                        completion(routes, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    
//    // MARK: - Itinerary
//    func optimizeRoute(start: Int, all: [Int], keep: Bool = false, type: String, budget: Double, time: String, completion: @escaping (_ itinerary: Itinerary?, _ isSuccess: Bool) -> Void) {
//        var params = [String: [String: Any]]()
//        debugPrint("i am going to test here")
//        if keep {
//            params = [
//                "itinerary": [
//                    "no_order_change": keep,
//                    "start_place_id": start,
//                    "place_ids": all,
//                    "budget": budget,
//                    "trip_type": type,
//                    "start_time": time
//                ]
//            ]
//        } else {
//            params = [
//                "itinerary": [
//                    "start_place_id": start,
//                    "place_ids": all,
//                    "budget": budget,
//                    "trip_type": type,
//                    "start_time": time
//                ]
//            ]
//        }
//        debugPrint(params)
//        Alamofire.request("\(Constants.EndPoint.baseURL)/itineraries/build", method: .post, parameters: params).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["itinerary"] != nil {
//                        let itinerary = Itinerary(json: data["itinerary"])
//                        completion(itinerary, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    
//    func createItinerary(startId: Int, allId: [Int], start: String, name: String, budget: Double, type: String, completion: @escaping (_ itinerary: Itinerary?, _ isSuccess: Bool) -> Void) {
//        let params: [String: [String: Any]] = [
//            "itinerary": [
//                "start_place_id": startId,
//                "place_ids": allId,
//                "start_time": start,
//                "name": name,
//                "budget": budget,
//                "trip_type": type
//            ]
//        ]
//        debugPrint(params)
//        Alamofire.request("\(Constants.EndPoint.baseURL)/itineraries", method: .post, parameters: params).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["itinerary"] != nil {
//                        let itinerary = Itinerary(json: data["itinerary"])
//                        completion(itinerary, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    
//    func getItineraries(completion: @escaping (_ itineraries: [Itinerary]?, _ isSuccess: Bool) -> Void) {
//        Alamofire.request("\(Constants.EndPoint.baseURL)/itineraries", method: .get).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["itineraries"] != nil {
//                        let itineraries = data["itineraries"].arrayValue.map{ Itinerary(json: $0) }
//                        completion(itineraries, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    
//    func getItinerary(id: Int, completion: @escaping (_ itinerary: Itinerary?, _ isSuccess: Bool) -> Void) {
//        Alamofire.request("\(Constants.EndPoint.baseURL)/itineraries/\(id)", method: .get).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["itinerary"] != nil {
//                        let itinerary = Itinerary(json: data["itinerary"])
//                        completion(itinerary, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    
//    func updateItinerary(id: Int, allId: [Int], name: String, type: String, completion: @escaping (_ itinerary: Itinerary?, _ isSuccess: Bool) -> Void) {
////        let params: [String: [String: Any]] = [
////            "itinerary": [
////                "place_ids": allId,
////                "name": name,
////                "trip_typr": type
////            ]
////        ]
//        let params: [String: [String: Any]] = [
//            "itinerary": [
//                "place_ids": allId,
//                "name": name
//            ]
//        ]
//        debugPrint(params)
//        Alamofire.request("\(Constants.EndPoint.baseURL)/itineraries/\(id)", method: .put, parameters: params).responseJSON { (response) -> Void in
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    if data["itinerary"] != nil {
//                        let itinerary = Itinerary(json: data["itinerary"])
//                        completion(itinerary, true)
//                        return
//                    }
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }
//    // MARK: - Suggestions
//    // http://sentosa.staging.fooyo.sg/v1/itineraries/:id/suggestions?current_place_id=1
//    func getSuggestion(itineraryId: Int, placeId: Int, completion: @escaping (_ suggestion: DynamicSuggestion?, _ isSuccess: Bool) -> Void) {
//        Alamofire.request("\(Constants.EndPoint.baseURL)/itineraries/\(itineraryId)/suggestions?next_place_id=\(placeId)", method: .get).responseJSON { (response) -> Void in
//            debugPrint("getting suggestions")
//            debugPrint(response)
//            let code = (response.response?.statusCode) ?? 500
//            if code >= 200 && code <= 299 {
//                if let json = response.result.value {
//                    let data = JSON(json)
//                    let suggestion = DynamicSuggestion(json: data)
//                    completion(suggestion, true)
//                    return
//                }
//            } else if code == 401 {
//                self.delegate?.logout()
//                return
//            } else {
//                if let json = response.result.value {
//                    if let json = json as? [String: AnyObject] {
//                        if let errors = json["errors"] as? [String] {
//                            if errors.count != 0 {
//                                self.delegate?.alertMessage(title: "Error Message", message: errors[0])
//                            }
//                        }
//                    }
//                }
//            }
//            completion(nil, false)
//        }
//    }

    
}
