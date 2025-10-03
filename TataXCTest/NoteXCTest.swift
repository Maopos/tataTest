//
//  NoteXCTest.swift
//  NoteXCTest
//
//  Created by Mauricio Posada on 2/10/25.
//

import Testing
import Foundation
@testable import TataTest

struct NoteXCTest {
    
    @Test func noteInitialization() {
        
        let title = "Title test"
        let text: String = "Text test"
        let date: Date = Date()
        
        let note = NoteModel(title: title, text: text, createdAt: date)
        
        #expect(note.title == title, "❌ Error: el título no coincide. Valor actual: \(note.title)")
        #expect(note.text == text)
        #expect(note.title == title)
    }
    
    @Test func noEmptyText() {
        
        let title = "Title test"
        let date: Date = Date()
        
        let note = NoteModel(title: title, text: nil, createdAt: date)
        
        #expect(note.getText == "", "❌ Error: Cuando text es nil debería devolver string vacío")
    }
}
