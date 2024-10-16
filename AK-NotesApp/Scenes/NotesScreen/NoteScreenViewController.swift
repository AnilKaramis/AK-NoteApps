//
//  NoteScreenViewController.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 16.10.2024.
//

import Foundation
import UIKit

class NoteScreenViewController:UIViewController {
    
    private let headerLabel = UILabel()
    private let addNoteButton = UIButton(type: .system)
    private let viewModel: NotesScreenViewModel
    
    init(viewModel: NotesScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
