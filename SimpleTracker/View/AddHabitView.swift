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

    var disableForm: Bool {
        name.isEmpty || name.count < 3
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                }

                Section("Description") {
                    TextEditor(text: $description)
                        .containerRelativeFrame(.vertical) { size, axis in
                            size * 0.8
                        }
                        .padding(.bottom)
                }
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
                    .disabled(disableForm)
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
