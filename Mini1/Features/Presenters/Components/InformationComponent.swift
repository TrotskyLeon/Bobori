//
//  InformationView.swift
//  Mini1
//
//  Created by Leo Harnadi on 23/04/23.
//

import SwiftUI

struct InformationComponent: View {
<<<<<<< Updated upstream
    var body: some View {
        Text("InsertInfo")
            .navigationTitle("Information")
=======
    @ObservedObject var entryViewModel = EntryViewModel()
    @State private var showing: Bool = false
    @Binding var name: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(entryViewModel.entries, id: \.id) { entry in
                    NavigationLink(destination: DetailView(entryViewModel: self.entryViewModel, entry: entry)) {
                    RowView(entry: entry)
                    }
                }
            }
        }
        .navigationBarTitle("Sleep Routine Record")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button() {
                    showing = true
                } label: {
                    Image(systemName: "plus.circle").font(.largeTitle).foregroundColor(.green)
                }
            }
        }
        .sheet(isPresented: $showing) {
            ProgressFormView(entryViewModel: self.entryViewModel, name: $name)
        }
>>>>>>> Stashed changes
    }
}

