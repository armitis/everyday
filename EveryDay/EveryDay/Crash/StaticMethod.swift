//
//  SaticMethod.swift
//  EveryDay
//
//  Created by zhengzhiwen on 2021/9/6.
//

import Foundation

@objc public class TestClass: NSObject {
    
    @objc public static func test(zoneID: String, time: Int64, format: String) -> String {
        
        objc_sync_enter(self)
        let tmpTime = time / 1000
        let date = Date(timeIntervalSince1970: TimeInterval(tmpTime))
        let formatter = DateFormatter()
        objc_sync_exit(self)
        
        
        return formatter.string(from: date)
    }
}
