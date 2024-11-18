//
//  String.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 18.11.2024.
//

import Foundation

extension String {
    var isBlank: Bool {
        let replaced = self.trimmingCharacters(in: .whitespaces)
        return replaced.isEmpty
    }
}
