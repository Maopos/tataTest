//
//  EditNoteView.swift
//  TataTest
//
//  Created by Mauricio Posada on 2/10/25.
//

import SwiftUI

struct EditNoteView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var viewModel: NotesViewModel
    let id: UUID
    @State var title: String = ""
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Titulo", text: $title, prompt: Text("Escribe un título..."), axis: .vertical)
                        .autocorrectionDisabled()
                    TextField("Contenido", text: $text, prompt: Text("Añade su contenido..."), axis: .vertical)
                        .autocorrectionDisabled()
                } footer: {
                    Text("El titulo es obligatorio")
                }
            }
            
            Button {
                viewModel.deleteNote(id: id)
                dismiss()
            } label: {
                Label {
                    Text("Eliminar esta nota")
                        .foregroundStyle(.red)
                } icon: {
                    Image(systemName: "trash")
                        .foregroundStyle(.red)
                }
                .padding()
                .padding(.bottom, 20)
            }
            .navigationTitle("Edita esta nota")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.updateNote(id: id, title: self.title, text: self.text)
                        dismiss()
                    } label: {
                        Image(systemName: "pencil.and.list.clipboard")
                            .foregroundStyle(.yellow)
                    }
                }
            }
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    EditNoteView(viewModel: NotesViewModel(), id: UUID())
}
