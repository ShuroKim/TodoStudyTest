//
//  TodoStudyTestApp.swift
//  TodoStudyTest
//
//  Created by Shuraw on 3/26/24.
//

import SwiftUI

@main
struct TodoStudyTestApp: App {
    
    @StateObject var vm = TodoMainViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoMainView()
                    .environmentObject(vm)
            }
        }
    }
}
