//
//  NoteViewCellModel.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 16.10.2024.
//

import Foundation

final class NoteViewCellViewModel {
    
    // MARK: - Private properties
    
    private(set) var titleNote: String
    private(set) var textNote: String
    private(set) var dateCreated: String
    private(set) var dateModified: String
    
    // MARK: - Inits
    
    init(titleNote: String?, textNote: String?, dateCreated: String?, dateModified: String?) {
        self.titleNote = titleNote ?? ""
        self.textNote = textNote ?? ""
        self.dateCreated = dateCreated ?? ""
        
        if let dateModified = dateModified {
            self.dateModified = dateModified == dateCreated ? "" : dateModified
        } else {
            self.dateModified = ""
        }
    }
    
    // MARK: - Public methods
    
    func updateData(titleNote: String?, textNote: String?, dateModified: String?) {
        self.titleNote = titleNote ?? ""
        self.textNote = textNote ?? ""
        self.dateModified = dateModified ?? ""
    }
}
