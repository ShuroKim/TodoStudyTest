//
//  TodoModel.swift
//  TodoStudyTest
//
//  Created by Shuraw on 3/26/24.
//

import Foundation

struct TodoModel: Identifiable, Codable {
    
    var id: String
    var title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() -> TodoModel {
        TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
