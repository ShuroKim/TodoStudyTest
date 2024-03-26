//
//  TodoMainView.swift
//  TodoStudyTest
//
//  Created by Shuraw on 3/26/24.
//

import SwiftUI

struct TodoMainView: View {
    @EnvironmentObject var listVM: TodoMainViewModel
    
    var body: some View {
        ZStack {
            if !listVM.todoList.isEmpty {
                List {
                    ForEach(listVM.todoList) { item in
                        TodoMainListItemView(item: item)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    listVM.updateItem(item: item)
                                }
                            }
                    }
                    .onMove(perform: listVM.moveItem)
                    .onDelete(perform: listVM.deleteItem)
                }
                .listStyle(.plain)
            }else {
                TodoMainEmptyListView()
            }
        }
        .navigationTitle("메모장")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    TodoAddView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
    }
}

#Preview {
    NavigationView {
        TodoMainView()
    }
    .environmentObject(TodoMainViewModel())
}
