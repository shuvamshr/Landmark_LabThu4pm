//
//  NewAttractionView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct NewAttractionView: View {
    
    @EnvironmentObject private var viewModel: AttractionViewModel
    
    @State private var name = ""
    @State private var address = ""
    @State private var image = "default"
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var isConfirmationDialogShowing: Bool = false
    
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
                    .disabled(isFieldEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        if isFieldEmpty {
                            dismiss()
                        } else {
                            isConfirmationDialogShowing.toggle()
                        }
                    }
                }
            }
            .interactiveDismissDisabled(!isFieldEmpty)
            .confirmationDialog("You have unsaved changes", isPresented: $isConfirmationDialogShowing, titleVisibility: .visible) {
                Button("Discard", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
    
    var isFieldEmpty: Bool {
        if name.isEmpty || address.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    private func addNewAttraction() {
        viewModel.addNewAttraction(attraction: Attraction(name: name, address: address, image: image))
    }
}

