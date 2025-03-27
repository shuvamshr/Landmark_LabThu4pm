//
//  NewAttractionView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct NewAttractionView: View {
    
    @Binding var attractions: [Attraction]
    
    @State private var name = ""
    @State private var address = ""
    @State private var image = "default"
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter name", text: $name)
                    TextField("Enter address", text: $address)
                } header: {
                    Text("Attraction Detail")
                }
                Section {
                    Picker("Select Image", selection: $image) {
                        Text("Default").tag("default")
                        Text("Opera House").tag("operahouse")
                        Text("Darling Harbour").tag("darlingharbour")
                        Text("Harbour Bridge").tag("harbourbridge")
                    }
                    .pickerStyle(.navigationLink)
                } footer: {
                    Text("Select an appropriate image")
                }
            }
            .navigationTitle("New Attraction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addNewAttraction()
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .interactiveDismissDisabled()
        }
    }
    
    private func addNewAttraction() {
        let newAttraction = Attraction(name: name, address: address, image: image)
        
        attractions.append(newAttraction)
    }
}

