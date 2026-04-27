//
//  HabitDetailView.swift
//  SimpleTracker
//
//  Created by Edwin Cardenas on 4/27/26.
//

import SwiftUI

struct HabitDetailView: View {
    var item: HabitItem
    @Binding var habitStore: HabitStore
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Text("Activity count: \(item.count)")
                    .font(.largeTitle.bold())

                Spacer()

                Text(item.name)
                    .font(.title)

                Text(item.description)

                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        let itemCopy = item

                        if let itemIndex = habitStore.items.firstIndex(
                            of: itemCopy
                        ) {
                            let newItem = HabitItem(
                                name: itemCopy.name,
                                description: itemCopy.description,
                                count: itemCopy.count + 1
                            )

                            habitStore.items[itemIndex] = newItem

                            dismiss()
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
