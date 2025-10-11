//
//  NotesViewModelXCTest.swift
//  TataXCTest
//
//  Created by Mauricio Posada on 3/10/25.
//

import Testing
@testable import TataTest

@Suite struct NotesViewModelXCTest {
    
    var viewModel: NotesViewModel
    
    init() {
        viewModel = NotesViewModel()
    }
    
    @Test("Create Note")
    func createNewNote() throws {
        
        let title = "Title"
        let text = "Text"
        
        viewModel.createNote(title: title, text: text)
        try #require(viewModel.notes.count == 1, "❌ maotest Error: No se crea la nota")
        try #require(viewModel.notes[0].title == title, "❌ maotest Error: No conincide el titulo")
        try #require(viewModel.notes[0].getText == text, "❌ maotest Error: No conincide el texto")
        
        print("✅ maotest Create Note UnitaryTest 🎉")
    }
    
    @Test func createNewNoteEmptyText() throws {
        
        let title = "Title"
        let text = ""
        
        viewModel.createNote(title: title, text: text)
        try #require(viewModel.notes.count == 1, "❌ maotest Error: No se crea la nota")
        try #require(viewModel.notes[0].title == title, "❌ maotest Error: No conincide el titulo")
        try #require(viewModel.notes[0].getText == "", "❌ maotest Error: No conincide el texto")
        
        print("✅ maotest Create Note empty text success 🎉")
    }
    
    @Test func createNewNoteNilText() throws {
        
        let title = "Title"
        let text: String? = nil
        
        viewModel.createNote(title: title, text: text)
        try #require(viewModel.notes.count == 1, "❌ maotest Error: No se crea la nota")
        try #require(viewModel.notes[0].title == title, "❌ maotest Error: No conincide el titulo")
        try #require(viewModel.notes[0].getText == "", "❌ maotest Error: Nil debe devolver string vacio")
        
        print("✅ maotest Create Nil text success 🎉")
    }
    
    @Test func createNoteEmptyTitle() throws {
        
        let title = ""
        let text = "Texto de nota"
        
        viewModel.createNote(title: title, text: text)
        
        try #require(viewModel.notes.isEmpty, "❌ maotest Error: Titulo de nota vacio, no debería crearse una nota")
        
        print("✅ maotest Create note empty title success 🎉")
    }
    
    @Test func createThreeNotes() throws {
        
        let title1 = "Title1"
        let text1 = "Text1"
        let title2 = "Title2"
        let text2 = "Text2"
        let title3 = "Title3"
        let text3 = "Text3"
        
        viewModel.createNote(title: title1, text: text1)
        viewModel.createNote(title: title2, text: text2)
        viewModel.createNote(title: title3, text: text3)
        
        try #require(viewModel.notes.first?.title == title1, "❌ maotest Create note title 1 fails")
        try #require(viewModel.notes.first?.text == text1, "❌ maotest Create note text 1 fails")
        
        try #require(viewModel.notes[1].title == title2, "❌ maotest Create note title 2 fails")
        try #require(viewModel.notes[1].text == text2, "❌ maotest Create note text 2 fails")
        
        try #require(viewModel.notes[2].title == title3, "❌ maotest Create note title 3 fails")
        try #require(viewModel.notes[2].text == text3, "❌ maotest Create note text 3 fails")
        
        print("✅ maotest Create three notes success 🎉")
    }
    
//    @Test func updateNoteTest() {
//        let title = "Title"
//        let text = "Text"
//        
//        // Crear nota inicial
//        viewModel.createNote(title: title, text: text)
//        
//        let newTitle = "newTitle"
//        let newText = "newText"
//        
//        // Verificar creación
//        #expect(viewModel.notes.count == 1, "❌ No se creó la nota correctamente")
//        
//        // Intentar actualizar
//        guard let identifier = viewModel.notes.first?.identifier else {
//            #expect(Bool(false), "❌ No hay nota para actualizar")
//            return
//        }
//        
//        viewModel.updateNote(identifier: identifier, title: newTitle, text: newText)
//        
//        // Buscar la nota actualizada
//        if let updatedNote = viewModel.notes.first(where: { $0.identifier == identifier }) {
//            #expect(updatedNote.title == newTitle, "❌ El título no se actualizó correctamente")
//            #expect(updatedNote.text == newText, "❌ El texto no se actualizó correctamente")
//        } else {
//            #expect(Bool(false), "❌ No se encontró la nota actualizada")
//        }
//    }
    
//    @Test func deleteNoteTest() {
//        let title = "Title"
//        let text = "Text"
//        
//        // Crear nota inicial
//        viewModel.createNote(title: title, text: text)
//        
//        // Verificar creación
//        #expect(viewModel.notes.count == 1, "❌ No se creó la nota correctamente")
//        
//        // Intentar borrar
//        guard let identifier = viewModel.notes.first?.identifier else {
//            #expect(Bool(false), "❌ No hay nota para borrar")
//            return
//        }
//        
//        viewModel.deleteNote(identifier: identifier)
//        
//        // Verificar que se haya eliminado correctamente
//        #expect(viewModel.notes.isEmpty, "❌ La nota no fue eliminada correctamente")
//        
//        // (opcional) verificar que no exista una nota con ese id
//        let stillExists = viewModel.notes.contains { $0.identifier == identifier }
//        #expect(!stillExists, "❌ La nota con id \(identifier) aún existe después de eliminar")
//    }
}
