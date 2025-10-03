//
//  NotesViewModel.swift
//  TataTest
//
//  Created by Mauricio Posada on 1/10/25.
//

import Foundation
import Observation

@Observable
class NotesViewModel {
    
    var notes: [NoteModel]
    
    init(notes: [NoteModel] = []) {
        self.notes = notes
    }
    
    func crateNote(title: String, text: String) {
        let note: NoteModel = .init(title: title, text: text, createdAt: .now)
        notes.append(note)
    }
    
    func updateNote(id: UUID, title: String, text: String) {
        if let index = notes.firstIndex(where: { $0.id == id }) {
            notes[index] = NoteModel(id: id, title: title, text: text, createdAt: notes[index].createdAt)
        }
    }
    
    func deleteNote(id: UUID) {
        if let index = notes.firstIndex(where: { $0.id == id }) {
            notes.remove(at: index)
        }
    }
    
}
