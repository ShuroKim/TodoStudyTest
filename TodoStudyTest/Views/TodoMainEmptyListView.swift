//
//  TodoMainEmptyListView.swift
//  TodoStudyTest
//
//  Created by Shuraw on 3/26/24.
//

import SwiftUI

struct TodoMainEmptyListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20, content: {
                Spacer(minLength: 40)
                
                Text("작성된 메모가 없다")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("자신의 기억 조각을 저장해보세요.")
                
                NavigationLink {
                    TodoAddView()
                } label: {
                    Text("첫 메모 작성하기")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.blue)
                        }
                }

            })
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    TodoMainEmptyListView()
}
