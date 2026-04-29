//
//  ContentView.swift
//  SimpleTracker
//
//  Created by Edwin Cardenas on 4/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var habitStore = HabitStore()
    @State private var showingSheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(habitStore.items) { item in
                    NavigationLink {
                        HabitDetailView(item: item, habitStore: habitStore)
                    } label: {
                        Label(item.name, systemImage: "\(item.count).circle")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("SimpleTracker")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }

                ToolbarItem {
                    Button {
                        showingSheet = true
                    } label: {
                        Label("Add Habit", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddHabitView(habitStore: habitStore)
            }
        }
    }

    func removeItems(at offset: IndexSet) {
        habitStore.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
