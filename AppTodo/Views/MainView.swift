//
//  ContentView.swift
//  AppTodo
//
//  Created by Renato on 31/08/23.
//

import SwiftUI

struct MainView: View {

	@StateObject var vm = MainViewViewModel()

	var body: some View {
		//verificar se o usuario está logado
		if vm.isSignedIn, !vm.currentUserId.isEmpty { //se esta logado e o usuário atual nao está em branco entao
			accountView

		} else {
			LoginView()
		} //end if vm.isSignedIn
	} //end var body

	@ViewBuilder
	var accountView: some View {
		TabView{
			ToDoListView(userId: vm.currentUserId)
				.tabItem{
					Label("Home", systemImage: "house")
				}
			ProfileView()
				.tabItem{
					Label("Profile", systemImage: "person.circle")
				}
		} //end TabView
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
