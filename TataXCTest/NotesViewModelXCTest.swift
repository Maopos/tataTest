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
    
    @Test func createNewNote() {
        
        let title = "Title"
        let text = "Text"
        
        viewModel.createNote(title: title, text: text)
        #expect(viewModel.notes.count == 1, "❌ Error: No se crea la nota")
        #expect(viewModel.notes[0].title == title, "❌ Error: No conincide el titulo")
        #expect(viewModel.notes[0].getText == text, "❌ Error: No conincide el texto")
    }
    
    @Test func createNewNoteEmptyText() {
        
        let title = "Title"
        let text = ""
        
        viewModel.createNote(title: title, text: text)
        #expect(viewModel.notes.count == 1, "❌ Error: No se crea la nota")
        #expect(viewModel.notes[0].title == title, "❌ Error: No conincide el titulo")
        #expect(viewModel.notes[0].getText == "", "❌ Error: No conincide el texto")
    }
    
    @Test func createNewNoteNilText() {
        
        let title = "Title"
        let text: String? = nil
        
        viewModel.createNote(title: title, text: text)
        #expect(viewModel.notes.count == 1, "❌ Error: No se crea la nota")
        #expect(viewModel.notes[0].title == title, "❌ Error: No conincide el titulo")
        #expect(viewModel.notes[0].getText == "", "❌ Error: Nil debe devolver string vacio")
    }
    
    @Test func createNoteEmptyTitle() {
        
        let title = ""
        let text = "Texto de nota"
        
        viewModel.createNote(title: title, text: text)
        
        #expect(viewModel.notes.isEmpty, "❌ Error: Titulo de nota vacio, no debería crearse una nota")
    }
    
    @Test func createThreeNotes() {
        
        let title1 = "Title1"
        let text1 = "Text1"
        let title2 = "Title2"
        let text2 = "Text2"
        let title3 = "Title3"
        let text3 = "Text3"
        
        viewModel.createNote(title: title1, text: text1)
        viewModel.createNote(title: title2, text: text2)
        viewModel.createNote(title: title3, text: text3)
        
        #expect(viewModel.notes.first?.title == title1)
        #expect(viewModel.notes.first?.text == text1)
        
        #expect(viewModel.notes[1].title == title2)
        #expect(viewModel.notes[1].text == text2)
        
        #expect(viewModel.notes[2].title == title3)
        #expect(viewModel.notes[2].text == text3)
        
    }
    
    @Test func updateNoteTest() {
        let title = "Title"
        let text = "Text"
        
        // Crear nota inicial
        viewModel.createNote(title: title, text: text)
        
        let newTitle = "newTitle"
        let newText = "newText"
        
        // Verificar creación
        #expect(viewModel.notes.count == 1, "❌ No se creó la nota correctamente")
        
        // Intentar actualizar
        guard let id = viewModel.notes.first?.id else {
            #expect(Bool(false), "❌ No hay nota para actualizar")
            return
        }
        
        viewModel.updateNote(id: id, title: newTitle, text: newText)
        
        // Buscar la nota actualizada
        if let updatedNote = viewModel.notes.first(where: { $0.id == id }) {
            #expect(updatedNote.title == newTitle, "❌ El título no se actualizó correctamente")
            #expect(updatedNote.text == newText, "❌ El texto no se actualizó correctamente")
        } else {
            #expect(Bool(false), "❌ No se encontró la nota actualizada")
        }
    }
    
    @Test func deleteNoteTest() {
        let title = "Title"
        let text = "Text"
        
        // Crear nota inicial
        viewModel.createNote(title: title, text: text)
        
        // Verificar creación
        #expect(viewModel.notes.count == 1, "❌ No se creó la nota correctamente")
        
        // Intentar borrar
        guard let id = viewModel.notes.first?.id else {
            #expect(Bool(false), "❌ No hay nota para borrar")
            return
        }
        
        viewModel.deleteNote(id: id)
        
        // Verificar que se haya eliminado correctamente
        #expect(viewModel.notes.isEmpty, "❌ La nota no fue eliminada correctamente")
        
        // (opcional) verificar que no exista una nota con ese id
        let stillExists = viewModel.notes.contains { $0.id == id }
        #expect(!stillExists, "❌ La nota con id \(id) aún existe después de eliminar")
    }
}
