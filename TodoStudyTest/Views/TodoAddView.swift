//
//  TodoAddView.swift
//  TodoStudyTest
//
//  Created by Shuraw on 3/26/24.
//

import SwiftUI

struct TodoAddView: View {    
    @EnvironmentObject var todoVM: TodoMainViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var strMemo: String = ""
    @State var isShowAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("메모를 작성해주세요.", text: $strMemo)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(Color.gray)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                    }
                
                Button {
                    if checkEmptyMemo() {
                        btnAddMemoAction()
                    } else {
                        
                    }
                } label: {
                    Text("메모 추가하기")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            Color.blue
                                .cornerRadius(16)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                        }
                }
            }
            .padding()
        }
        .navigationTitle("메모 작성")
        .alert("메모가 짧습니다.", isPresented: $isShowAlert) {
            
        } message: {
            Text("메모를 더 길게 작성해주세요.")
        }
    }
    
    func btnAddMemoAction() {
        todoVM.insertItem(title: strMemo)
        dismiss()
    }
    
    func checkEmptyMemo() -> Bool {
        if !strMemo.isEmpty && strMemo.count > 2 {
            return true
        }
        isShowAlert.toggle()
        return false
    }
}

#Preview {
    NavigationView {
        TodoAddView()
    }
    .environmentObject(TodoMainViewModel())
}
