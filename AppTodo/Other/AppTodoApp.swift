//
//  AppTodoApp.swift
//  AppTodo
//
//  Created by Renato on 31/08/23.
//

import FirebaseCore
import SwiftUI

@main
struct AppTodoApp: App {

	init() {
		FirebaseApp.configure()
	}
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
