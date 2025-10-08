//
//  FetchNotesUseCase.swift
//  TataTest
//
//  Created by Mauricio Posada on 7/10/25.
//

struct FetchNotesUseCase {
    
    var notesDataBase: NotesDataBaseprotocol
    
    init(notesDataBase: NotesDataBaseprotocol = NotesDataBase.shared) {
        self.notesDataBase = notesDataBase
    }
    
    func fetchNotes() throws -> [NoteModel] {
        
        try notesDataBase.fetchAll()
    }
}
