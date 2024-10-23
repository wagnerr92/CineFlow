//
//  Perssistence.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 22/10/24.
//

import Foundation

class Persistence {
    static func adduserDefault(_ key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func removeuserDefault(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func getuserDefault(_ key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}
