//
//  NotesDataBase.swift
//  TataTest
//
//  Created by Mauricio Posada on 7/10/25.
//

import Foundation
import SwiftData

class NotesDataBase: NotesDataBaseprotocol {
    
    static let shared: NotesDataBase = NotesDataBase()
    
    @MainActor
    var container: ModelContainer = setupContainer(inMemory: false)
    
    private init() {}
    
    @MainActor
    static func setupContainer(inMemory: Bool) -> ModelContainer {
        do {
            let container = try ModelContainer(for: NoteModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory))
            container.mainContext.autosaveEnabled = true
            return container
        } catch {
            print("maopos: ", error.localizedDescription)
            fatalError("maopos: Database can't be created...")
        }
    }
    
    @MainActor
    func fetchAll() throws -> [NoteModel] {
        
        let fetchDescriptor = FetchDescriptor<NoteModel>(sortBy: [SortDescriptor<NoteModel>(\.createdAt)])
        
        do {
            return try container.mainContext.fetch(fetchDescriptor)
        } catch {
            throw DataBaseError.FetchNotesError
        }
    }
    
    @MainActor
    func insert(note: NoteModel) throws {
        container.mainContext.insert(note)
        
        do {
            try container.mainContext.save()
        } catch  {
            print("maopos: Error save note...", error.localizedDescription)
            throw DataBaseError.InsertNoteError
        }
    }
    
    
}
