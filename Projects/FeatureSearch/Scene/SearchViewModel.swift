//
//  SearchViewModel.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Combine

final class SearchViewModel: ObservableObject {
	@Published var searchText: String = ""
	@Published var searchHistorys: [String] = []
	@Published var resultMakHolies: [MakHoly] = []
	@Published var fetchLoading = true
	
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		addSubscribers()
	}
	
	private func addSubscribers() {
		$searchText
			.debounce(for: 0.3, scheduler: DispatchQueue.main)
			.sink { [weak self] (searchText) in
				self?.searchMakHolies(searchText: searchText)
			}
			.store(in: &cancellables)
	}
	
	func clearSearchHistory() {
		searchHistorys = []
		saveSearchHistorys()
	}
	
	func addSearchHistory() {
		if let existingIndex = searchHistorys.firstIndex(of: searchText) {
			searchHistorys.remove(at: existingIndex)
		}
		searchHistorys.append(searchText)
		
		if searchHistorys.count > 10 {
			searchHistorys.removeFirst()
		}
		
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
		self.addSearchHistory()
	}
	
	func saveSearchHistorys() {
		UserDefaults.standard.set(searchHistorys, forKey: "searchHistorys")
	}
	
	func searchMakHolies(searchText: String) {
		resultMakHolies = []
		
		for makHoly in MakHoly.mockDatas {
			if makHoly.name.contains(searchText) ||
				makHoly.brewery.name.contains(searchText) ||
				makHoly.ingredients.contains(searchText) ||
				makHoly.awards.contains(where: { $0.name.contains(searchText) })
			{
				self.resultMakHolies.append(makHoly)
			}
		}
		
	}
}
