//
//  NotesData.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 31.10.2024.
//

import Foundation

final class NotesData {
    
    static let shared = NotesData()
    
    private init() {}
    
    let defaults = UserDefaults.standard
    
    private enum NotesDataKeys: String {
        case notes
    }
}
