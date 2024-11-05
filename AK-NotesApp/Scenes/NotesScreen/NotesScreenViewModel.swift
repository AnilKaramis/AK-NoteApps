//
//  NotesScreenViewModel.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 16.10.2024.
//

import Foundation
import UIKit

class NotesScreenViewModel {
        
        var didGoToNextScreen: ((UIViewController) -> Void)?
        
        private(set) var textForHeaderLabel = "Notes"
        
        let cellViewModels: [NoteViewCellViewModel]
        let notes = [Note(title: "Title 1", text: """
    First example not for app. So I want to improve about Notes.app but I must investigate about app. 
    """, dateCreated: "Dec 12, 2022", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: ""),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                     Note(title: "Title 2", text: "some text 1", dateCreated: "Feb 18, 2004", dateModified: "Dec 12, 2022"),
                    ]
        
        init() {
            cellViewModels = notes.map { NoteViewCellViewModel(titleNote: $0.title, textNote: $0.text, dateCreated: $0.dateCreated, dateModified: $0.dateModified) }
        }
        
        func goToCreateNote() {
            let viewModel = CreateNoteViewModel(note: nil)
            let viewController = CreateNoteViewController(with: viewModel)
            didGoToNextScreen?(viewController)
        }
        
        func goToEditNote(at index: Int) {
            let viewModel = CreateNoteViewModel(note: notes[index])
            let viewController = CreateNoteViewController(with: viewModel)
            didGoToNextScreen?(viewController)
        }
    }
