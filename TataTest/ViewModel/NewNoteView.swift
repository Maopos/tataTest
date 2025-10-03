//
//  NewNoteView.swift
//  TataTest
//
//  Created by Mauricio Posada on 1/10/25.
//

import SwiftUI

struct NewNoteView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var viewModel: NotesViewModel
    @State var title: String = ""
    @State var text: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Titulo", text: $title, prompt: Text("Escribe un título..."), axis: .vertical)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.asciiCapable)
                    TextField("Contenido", text: $text, prompt: Text("Añade su contenido..."), axis: .vertical)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.asciiCapable) 
                } footer: {
                    Text("El titulo es obligatorio")
                }
                
            }
            .navigationTitle("Crea una nota")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.crateNote(title: self.title, text: self.text)
                        dismiss()
                    } label: {
                        Image(systemName: "square.and.arrow.down.badge.checkmark")
                            .foregroundStyle(.green)
                    }
                }
            }
        }
        .presentationDetents([.medium])
    }
}

//#Preview {
//    NewNoteView(viewModel: NotesViewModel())
//}
