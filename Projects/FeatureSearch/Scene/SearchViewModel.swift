//
//  SearchViewModel.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var searchHistorys: [String] = []
    
    func clearSearchHistory() {
        searchHistorys = []
        saveSearchHistorys()
    }
    
    func addSearchHistory() {
        if let existingIndex = searchHistorys.firstIndex(of: searchText) {
            searchHistorys.remove(at: existingIndex)
        }
        searchHistorys.append(searchText)
        saveSearchHistorys()
    }
    
    func fetchSearchHistorys() {
        if let savedHistorys = UserDefaults.standard.array(forKey: "searchHistorys") as? [String] {
            searchHistorys = savedHistorys
        }
    }
    
    func deleteSearchHistory(_ searchText: String) {
        if let existingIndex = searchHistorys.firstIndex(of: searchText) {
            searchHistorys.remove(at: existingIndex)
        }
        UISearchBar.appearance().tintColor = .green
    }
    
    func setCompletion(_ completion: String) {
        self.searchText = completion
    }
    
    func saveSearchHistorys() {
        UserDefaults.standard.set(searchHistorys, forKey: "searchHistorys")
    }
    
}
