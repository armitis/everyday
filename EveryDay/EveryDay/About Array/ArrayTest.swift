//
//  ArrayTest.swift
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/18.
//

import Foundation

class Student: Hashable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return true
    }
    
    //swift4.2 以后 推荐实现这个方法就可以，系统会通过它去算出hash
    func hash(into hasher: inout Hasher) {
        
    }
}

func s() {
    var array = [Student]()
    array.append(Student())
    array.append(Student())
    array.append(Student())
}
