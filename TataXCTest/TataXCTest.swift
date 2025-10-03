//
//  TataXCTest.swift
//  TataXCTest
//
//  Created by Mauricio Posada on 2/10/25.
//

import Testing

struct TataXCTest {

    @Test func example() async throws {
        
    }
    
    @Test func failTest() async throws {
        if false {
            Issue.record("mensaje de error")
        }
    }

}
