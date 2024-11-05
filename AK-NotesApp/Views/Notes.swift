//
//  Note.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 29.10.2024.
//

import UIKit

final class NotesViewCellViewModell {
    
    ///private icinde set kavrami su anlama gelmektedir. Sadece set private demektir. Yani get kavrami private ozelliginde degildir. private(set) kavrami olmaz boyle bir durum gerceklestirilemez. Hata meydana gelir
    private(set) var titleNote: String
    private(set) var textNote: String
    private(set) var dateCreated: String
    private(set) var dateModified: String
    
    init(titleNote: String, textNote: String, dateCreated: String, dateModified: String) {
        self.titleNote = titleNote
        self.textNote = textNote
        self.dateCreated = dateCreated
        self.dateModified = dateModified
    }
    
}

class NotesViewCelll: UICollectionViewCell {
    private let titleNoteLabel = UILabel()
    private let textNoteLabel = UILabel()
    
    private let separatorView = UIView()
    private let dateCreatedNoteLabel = UILabel()
    private let dateModifiedNoteLabel = UILabel()
    
    func configure(with viewModel: NotesViewCellViewModell) {
        titleNoteLabel.text = viewModel.titleNote
        textNoteLabel.text = viewModel.textNote
        dateCreatedNoteLabel.text = viewModel.dateCreated
        dateModifiedNoteLabel.text = viewModel.dateModified
    }
}
