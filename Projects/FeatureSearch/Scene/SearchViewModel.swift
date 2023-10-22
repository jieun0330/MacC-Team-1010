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
	@Published var resultMakgeollies: [MockMakgeolliModel] = []
	@Published var fetchLoading = true
	
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		addSubscribers()
	}
	
	private func addSubscribers() {
		$searchText
			.debounce(for: 0.3, scheduler: DispatchQueue.main)
			.sink { [weak self] (searchText) in
				self?.searchMakgeollies(searchText: searchText)
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
	
	func searchMakgeollies(searchText: String) {
		resultMakgeollies = []
		
		for makgeolli in MockData.createMockMakgeolli() {
			if makgeolli.breweryName.lowercased().contains(searchText.lowercased()) ||
				makgeolli.name.lowercased().contains(searchText.lowercased()) ||
				makgeolli.info.lowercased().contains(searchText.lowercased()) ||
				makgeolli.awards.contains(where: { $0.lowercased().contains(searchText.lowercased()) }) ||
				makgeolli.ingredients.contains(where: { $0.lowercased().contains(searchText.lowercased()) }) ||
				makgeolli.breweryInfo.lowercased().contains(searchText.lowercased()) ||
				makgeolli.recommendedFood.contains(where: { $0.lowercased().contains(searchText.lowercased()) })
			{
				self.resultMakgeollies.append(makgeolli)
			}
		}
	}
}
