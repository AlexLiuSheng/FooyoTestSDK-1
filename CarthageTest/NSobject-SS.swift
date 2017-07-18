//
//  NSobject-SS.swift
//  SmartSentosa
//
//  Created by Yangfan Liu on 22/2/17.
//  Copyright © 2017 Yangfan Liu. All rights reserved.
//

import UIKit

extension NSObject {
    func findMatchingStr(input: String, regex: String) -> String? {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return nil }
        
        let nsString = input as NSString
        let results  = regex.matches(in: input, options: [], range: NSMakeRange(0, nsString.length))
        let strs = results.map { result in
            (0..<result.numberOfRanges).map { result.rangeAt($0).location != NSNotFound
                ? nsString.substring(with: result.rangeAt($0))
                : ""
            }
        }
        return strs.first?[1]
    }
    func fetchDataAtBackground() {
        debugPrint("fetchDataAtBackground")
        getItineraries()
    }
    func getItineraries() {
    }
    
//    func getBundleImage(name: String) -> UIImage {
//        let bundlePath: String = Bundle.main.path(forResource: "FooyoTestSDK", ofType: "bundle")!
//        let bundle = Bundle(path: bundlePath)
//        let resource: String = bundle!.path(forResource: name, ofType: "png")!
//        return UIImage(contentsOfFile: resource)!
//    }
}
