//
//  ContentView.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DoctorListViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.appDarkGray)
                    TextField("Поиск", text: $viewModel.searchText)
                        .font(.system(size: 15))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 8)
                
                
                sortButtons
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.filteredDoctors) { doctor in
                            DoctorCardView(doctor: doctor)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 80)
                }
            }
            .background(Color.appGrey)
            .navigationTitle("Педиатры")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.loadDoctors()
            }
        }
        .toolbarBackground(Color(.systemBackground), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }

    private var sortButtons: some View {
        HStack(spacing: 0) {
            SortButton(title: "По цене", isSelected: viewModel.sortOption == .byPrice, sortAscending: viewModel.sortAscending) {
                if viewModel.sortOption == .byPrice {
                    viewModel.sortAscending.toggle()
                } else {
                    viewModel.sortOption = .byPrice
                    viewModel.sortAscending = true
                }
            }
            SortButton(title: "По стажу", isSelected: viewModel.sortOption == .bySeniority, sortAscending: viewModel.sortAscending) {
                if viewModel.sortOption == .bySeniority {
                    viewModel.sortAscending.toggle()
                } else {
                    viewModel.sortOption = .bySeniority
                    viewModel.sortAscending = true
                }
            }
            SortButton(title: "По рейтингу", isSelected: viewModel.sortOption == .byRating, sortAscending: viewModel.sortAscending) {
                if viewModel.sortOption == .byRating {
                    viewModel.sortAscending.toggle()
                } else {
                    viewModel.sortOption = .byRating
                    viewModel.sortAscending = true
                }
            }
        }
        .background(Color.white)
        .cornerRadius(8)
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}

struct SortButton: View {
    let title: String
    let isSelected: Bool
    let sortAscending: Bool
    let action: () -> Void


    var body: some View {
        Button(action: action) {
            Text(isSelected ? "\(title) \(sortAscending ? "↑" : "↓")" : title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .white : Color.appDarkGray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(isSelected ? Color.appPink : .clear)
                .cornerRadius(8)
        }
    }
}

//#Preview {
//    ContentView()
//}
