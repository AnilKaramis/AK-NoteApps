//
//  NoteViewCellModel.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 16.10.2024.
//

import Foundation

final class NoteViewCellViewModel {
    
    private(set) var titleNote: String
    private(set) var textNote: String
    private(set) var dateCreated: String
    private(set) var dateModified: String
    
    init(titleNote: String?, textNote: String?, dateCreated: String?, dateModified: String?) {
        self.titleNote = titleNote ?? ""
        self.textNote = textNote ?? ""
        self.dateCreated = dateCreated ?? ""
        self.dateModified = dateModified ?? ""
    }
}
