//
//  Config.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 27/04/21.
//

import Foundation

class Config {
    private static func valueDictionary(key: String) -> String {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) {
                return dic[key] as? String ?? ""
            }
        }
        
        return ""
    }
    
    public static var photosApiUrl: String {
        get {
            return valueDictionary(key: "PHOTOS_API_URL")
        }
    }
    
    public static var photosApiKey: String {
        get {
            return valueDictionary(key: "PHOTOS_API_KEY")
        }
    }
    
    public static var placesApiUrl: String {
        get {
            return valueDictionary(key: "PLACES_API_URL")
        }
    }
}
