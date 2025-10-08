//
//  ContentView.swift
//  TataTest
//
//  Created by Mauricio Posada on 1/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var viewModel: NotesViewModel = .init()
    @State var showNewNoteView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.title3)
                                .foregroundStyle(.primary)
                            Text(note.text ?? "")
                                .font(.body)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Mis notas")
            .navigationDestination(for: NoteModel.self, destination: { note in
                EditNoteView(viewModel: viewModel, identifier: note.identifier, title: note.title, text: note.getText)
            })
            .toolbar {
                ToolbarItem {
                    Button {
                        showNewNoteView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewNoteView) {
                NewNoteView(viewModel: viewModel)
            }
        }
    }
}

//#Preview {
//    ContentView(viewModel: .init(notes: [
//        NoteModel(title: "Dirección", text: "Colinas del bosque", createdAt: .now),
//        NoteModel(title: "Teléfono", text: "3113009748", createdAt: .now),
//        NoteModel(title: "Documento de identidad", text: "9726604", createdAt: .now)
//    ]))
//}
