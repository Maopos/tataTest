//
//  NotesDataBaseprotocol.swift
//  TataTest
//
//  Created by Mauricio Posada on 7/10/25.
//

protocol NotesDataBaseprotocol {
    
    func fetchAll() throws -> [NoteModel]
    func insert(note: NoteModel) throws
}
