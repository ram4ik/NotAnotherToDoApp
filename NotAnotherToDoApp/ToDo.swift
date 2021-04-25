//
//  ToDo.swift
//  NotAnotherToDoApp
//
//  Created by Ramill Ibragimov on 25.04.2021.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [
            ToDo(name: "Get Groceries"),
            ToDo(name: "Make Appointment", completed: true)
        ]
    }
}
