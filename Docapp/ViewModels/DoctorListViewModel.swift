//
//  DoctorListViewModel.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import Foundation
import Combine


enum SortOption {
    case byPrice
    case bySeniority
    case byRating
}

@MainActor
final class DoctorListViewModel: ObservableObject {
    
    @Published var doctors: [Doctor] = []
    @Published var searchText: String = ""
    @Published var sortOption: SortOption = .byPrice
    @Published var sortAscending: Bool = true
    
    var filteredDoctors: [Doctor] {
        let filtered = searchText.isEmpty
        ? doctors
        : doctors.filter { $0.fullName.localizedStandardContains(searchText) }
        
        switch sortOption {
        case .byPrice:
            return filtered.sorted { sortAscending ? $0.minPrice < $1.minPrice : $0.minPrice > $1.minPrice }
        case .bySeniority:
            return filtered.sorted { sortAscending ? $0.seniority < $1.seniority : $0.seniority > $1.seniority }
        case .byRating:
            return filtered.sorted { sortAscending ? $0.ratingsRating < $1.ratingsRating : $0.ratingsRating > $1.ratingsRating }
        }
    }
    
    func loadDoctors() {
        let decoder = JSONDecoder()
        
        guard let url = Bundle.main.url(forResource: "doctors", withExtension: "json") else {
            print("Файл не найден")
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Не удалось прочитать файл")
            return
        }
        
        if let response = try? decoder.decode(DoctorsResponse.self, from: data) {
            doctors = response.record.data.users
            print("Загружено врачей: \(doctors.count)")
        } else {
            print("Ошибка декодирования")
        }
    }
}
