//
//  HabitDetailView.swift
//  SimpleTracker
//
//  Created by Edwin Cardenas on 4/27/26.
//

import SwiftUI

struct HabitDetailView: View {
    var item: HabitItem
    @State private var itemCopy = HabitItem(name: "", description: "")
    @Bindable var habitStore: HabitStore
    @Environment(\.dismiss) var dismiss

    init(item: HabitItem, habitStore: HabitStore) {
        self.item = item
        self.itemCopy = item
        self.habitStore = habitStore
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("Activity count: \(itemCopy.count)")
                    .font(.largeTitle.bold())

                Spacer()

                Text(itemCopy.name)
                    .font(.title)

                Text(itemCopy.description)

                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if let itemIndex = habitStore.items.firstIndex(
                            of: item
                        ) {
                            itemCopy.count += 1

                            habitStore.items[itemIndex] = itemCopy
                        }
                    } label: {
                        Label("Increment", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
