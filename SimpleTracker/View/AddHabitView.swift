//
//  AddHabitView.swift
//  SimpleTracker
//
//  Created by Edwin Cardenas on 4/27/26.
//

import SwiftUI

struct AddHabitView: View {
    var habitStore: HabitStore
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var description = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                TextField("Description", text: $description)
            }
            .navigationTitle("New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", role: .confirm) {
                        let habitItem = HabitItem(
                            name: name,
                            description: description
                        )

                        habitStore.items.append(habitItem)
                        
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigation) {
                    Button(role: .close) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddHabitView(habitStore: HabitStore())
}
