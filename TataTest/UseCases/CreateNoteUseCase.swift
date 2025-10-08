//
//  CreateNoteUseCase.swift
//  TataTest
//
//  Created by Mauricio Posada on 7/10/25.
//

import Foundation

struct CreateNoteUseCase {
    
    var notesDataBase: NotesDataBaseprotocol
    
    init(notesDataBase: NotesDataBaseprotocol = NotesDataBase.shared) {
        self.notesDataBase = notesDataBase
    }
    
    func createNote(title: String, text: String) throws {
        
        let note: NoteModel = .init(title: title, text: text, createdAt: .now)
        try notesDataBase.insert(note: note)
    }
}
