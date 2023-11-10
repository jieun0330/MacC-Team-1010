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
	@Published var resultMakHolies: [SearchResult] = []
	@Published var fetchLoading = true
	
	private var cancellables = Set<AnyCancellable>()
	
	let searchRepository: DefaultSearchRepository
	
	init(searchRepository: DefaultSearchRepository) {
		self.searchRepository = searchRepository
		addSubscribers()
	}
	
	private func addSubscribers() {
		$searchText
			.debounce(for: 0.5, scheduler: DispatchQueue.main)
			.sink { [weak self] (searchText) in
				if searchText != "" {
					self?.searchMakHolies(searchText: searchText)
				}
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
	}
	
	func saveSearchHistorys() {
		UserDefaults.standard.set(searchHistorys, forKey: "searchHistorys")
	}
	
	func searchMakHolies(searchText: String) {
		Task {
			do {
				let response = try await searchRepository.fetchSearch(keyword: searchText)
				DispatchQueue.main.async {
					self.resultMakHolies = response.result ?? []
				}
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
}
