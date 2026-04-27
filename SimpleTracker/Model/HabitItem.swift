//
//  HabitItem.swift
//  SimpleTracker
//
//  Created by Edwin Cardenas on 4/27/26.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
}

@Observable
class HabitStore {
    var items = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let itemsData = UserDefaults.standard.data(forKey: "Items"),
            let loadedItems = try? JSONDecoder().decode(
                [HabitItem].self,
                from: itemsData
            )
        {
            items = loadedItems
        }
    }
}
