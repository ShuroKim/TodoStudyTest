//
//  TodoMainViewModel.swift
//  TodoStudyTest
//
//  Created by Shuraw on 3/26/24.
//

import Foundation

class TodoMainViewModel: ObservableObject {
    
    static let UD_KEY_TODO = "key_todo"
    
    @Published var todoList: [TodoModel] = [] {
        didSet {
            saveItemList()
        }
    }
    
    
    init() {
        initData()
    }
    
    func initData() {
//        let list: [TodoModel] = [
//            TodoModel(title: "아이템22"),
//            TodoModel(title: "아이템33", isCompleted: true),
//            TodoModel(title: "아이템44"),
//            TodoModel(title: "아이템55")
//        ]
//        todoList.append(contentsOf: list)
        
        guard
            let data = UserDefaults.standard.data(forKey: TodoMainViewModel.UD_KEY_TODO),
            let list = try? JSONDecoder().decode([TodoModel].self, from: data)
        else {
            return
        }
        todoList.append(contentsOf: list)
    }

    func insertItem(title: String) {
        todoList.append(TodoModel(title: title))
    }
    
    func updateItem(item: TodoModel) {
        if let index = todoList.firstIndex(where: { $0.id == item.id } ) {
            todoList[index] = item.updateCompleted()
        }
    }
    
    func moveItem(from: IndexSet, to: Int) {
        todoList.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteItem(indexSet: IndexSet) {
        todoList.remove(atOffsets: indexSet)
    }
    
    
    func saveItemList() {
        if let data = try? JSONEncoder().encode(todoList) {
            UserDefaults.standard.setValue(data, forKey: TodoMainViewModel.UD_KEY_TODO)
        }
    }
}
