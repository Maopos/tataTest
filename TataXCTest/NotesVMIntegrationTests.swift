//
//  NotesVMIntegrationTests.swift
//  TataXCTest
//
//  Created by Mauricio Posada on 9/10/25.
//

import Testing
@testable import TataTest
import SwiftData
import Foundation

@MainActor
struct NotesVMIntegrationTests {
    
    // MOCK
    var mockDB: NotesDataBaseMock
    
    // System Under test
    var sut: NotesViewModel
    
    init() {
        mockDB = NotesDataBaseMock()
        
        let fetchUseCase = FetchNotesUseCase(notesDataBase: mockDB)
        let createUseCase = CreateNoteUseCase(notesDataBase: mockDB)
        
        sut = NotesViewModel(createNoteUseCase: createUseCase, fetchNotesUseCase: fetchUseCase)
    }
    
    @Test("Creating Note and save in DB")
    func createNote_addsNote() async throws {
        try #require(sut.notes.isEmpty, "❌ maotest Notes isn't empty")
        
        sut.createNote(title: "Nota test", text: "Contenido de prueba")
        
        try #require(sut.notes.count == 1, "❌ maotest Notes count error")
        try #require(sut.notes.first?.title == "Nota test", "❌ maotest Note title error")
        try #require(sut.notes.first?.text == "Contenido de prueba", "❌ maotest Note text error")
        
        print("✅ maotest Creating Note and save in DB passed successfully 🎉")
    }
    
    @Test("Creating Note and save in DB")
    func createTwoNotes_addsNotes() async throws {
        try #require(sut.notes.isEmpty, "❌ maotest Notes isn't empty")
        
        sut.createNote(title: "Nota test 11", text: "Contenido de prueba 11")
        sut.createNote(title: "Nota test 22", text: "Contenido de prueba 22")
        
        try #require(sut.notes.count == 2, "❌ maotest Notes count error")
        try #require(sut.notes.first?.title == "Nota test 11", "❌ maotest Note 11 title error")
        try #require(sut.notes.first?.text == "Contenido de prueba 11", "❌ maotest Note 11 text error")
        try #require(sut.notes[1].title == "Nota test 22", "❌ maotest Note 22 title error")
        try #require(sut.notes[1].text == "Contenido de prueba 22", "❌ maotest Note 22 text error")
        
        print("✅ maotest Creating Two Notes and save in DB passed successfully 🎉")
    }
    
    @Test("Fetch all Notes")
    func fetchNotes_returnsPersistedNotes() async throws {
        sut.createNote(title: "Note 1", text: "Text 1")
        sut.createNote(title: "Note 2", text: "Text 2")
        
        sut.fetchNotes()
        
        try #require(sut.notes.count == 2, "❌ maotest Fetch Notes count error")
        try #require(sut.notes.map(\.title).contains("Note 1"), "❌ maotest Fetch Notes title 1 error")
        try #require(sut.notes.map(\.title).contains("Note 2"), "❌ maotest Fetch Notes title 2 error")
        
        print("✅ maotest Fetch all Notes 🎉")
    }
}

@MainActor
final class NotesDataBaseMock: NotesDataBaseprotocol {
    
    var container: ModelContainer = NotesDataBase.setupContainer(inMemory: true)
    
    func fetchAll() throws -> [NoteModel] {
        let descriptor = FetchDescriptor<NoteModel>(sortBy: [SortDescriptor(\.createdAt)])
        return try container.mainContext.fetch(descriptor)
    }
    
    func insert(note: NoteModel) throws {
        container.mainContext.insert(note)
        try container.mainContext.save()
    }
}
