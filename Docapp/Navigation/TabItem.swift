//
//  TabItem.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import Foundation

enum TabItem: CaseIterable, Hashable {
    case home
    case appointments
    case chat
    case profile

    var title: String {
        switch self {
        case .home:         return "Главная"
        case .appointments: return "Приёмы"
        case .chat:         return "Чат"
        case .profile:      return "Профиль"
        }
    }

    var icon: String {
            switch self {
            case .home:         return "House"
            case .appointments: return "Calendar"
            case .chat:         return "Chat"
            case .profile:      return "Profile"
            }
        }
    }
