//
//  TodoMainListItemView.swift
//  TodoStudyTest
//
//  Created by Shuraw on 3/26/24.
//

import SwiftUI

struct TodoMainListItemView: View {    
    let item: TodoModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle( item.isCompleted ? Color.green : Color.red )
            
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 4)
    }
}

#Preview {
    Group {
        TodoMainListItemView(item: TodoModel(title: "Cell Name"))
        TodoMainListItemView(item: TodoModel(title: "Cell Name", isCompleted: true))
        TodoMainListItemView(item: TodoModel(title: "Cell Name"))
    }
        .previewLayout(.sizeThatFits)
}
