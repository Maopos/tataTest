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
    
    var createNoteUseCase: CreateNoteUseCase
    var fetchNotesUseCase: FetchNotesUseCase
    
    var notes: [NoteModel]
    
    init(createNoteUseCase: CreateNoteUseCase = CreateNoteUseCase(), fetchNotesUseCase: FetchNotesUseCase = FetchNotesUseCase(), notes: [NoteModel] = []) {
        self.createNoteUseCase = createNoteUseCase
        self.fetchNotesUseCase = fetchNotesUseCase
        self.notes = notes
        fetchNotes()
    }
    
    func fetchNotes() {
        do {
            let notes = try fetchNotesUseCase.fetchNotes()
            self.notes = notes
        } catch  {
            print("maopos: ", error.localizedDescription)
        }
    }
    
    func createNote(title: String, text: String?) {
//        if !title.isEmpty {
//            let note: NoteModel = .init(title: title, text: text, createdAt: .now)
//            notes.append(note)
//        }
        do {
            try createNoteUseCase.createNote(title: title, text: text ?? "")
            fetchNotes()
        } catch {
            print("maopos: ", error.localizedDescription)
        }
    }
    
    func updateNote(identifier: UUID, title: String, text: String) {
        if let index = notes.firstIndex(where: { $0.identifier == identifier }) {
            notes[index] = NoteModel(identifier: identifier, title: title, text: text, createdAt: notes[index].createdAt)
        }
    }
    
    func deleteNote(identifier: UUID) {
        if let index = notes.firstIndex(where: { $0.identifier == identifier }) {
            notes.remove(at: index)
        }
    }
}
