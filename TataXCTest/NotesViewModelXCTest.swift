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
}
