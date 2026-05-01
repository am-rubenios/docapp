//
//  DocappApp.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import SwiftUI

@main
struct DocappApp: App {
    @State private var selectedTab: TabItem = .home

    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case .home:
                        ContentView()
                    case .appointments:
                        Text("Приёмы")
                    case .chat:
                        Text("Чат")
                    case .profile:
                        Text("Профиль")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                TabBarView(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
