//
//  Note.swift
//  NotesApp
//
//  Created by Telman Yusifov on 16.05.25.
//

import Foundation

struct Note: Codable {
    let id: String
    let text: String
    let createdDate: Date
}
