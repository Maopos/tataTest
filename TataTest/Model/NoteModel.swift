//
//  NoteModel.swift
//  TataTest
//
//  Created by Mauricio Posada on 1/10/25.
//

import SwiftUI

struct NoteModel: Identifiable, Hashable {
    let id: UUID
    let title: String
    let text: String?
    let createdAt: Date
    
    var getText: String {
        text ?? ""
    }
    
    init(id: UUID = UUID(), title: String, text: String?, createdAt: Date) {
        self.id = id
        self.title = title
        self.text = text
        self.createdAt = createdAt
    }
}
