//
//  NoteViewCell.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 16.10.2024.
//

import UIKit
import SnapKit

final class NoteViewCell: UICollectionViewCell {
    
    static let identifier = "NoteViewCell"
    
    private let titleNoteLabel = UILabel()
    private let textNoteLabel = UILabel()
    
    private let separatorView = UIView()
    private let dateCreatedNoteLabel = UILabel()
    private let dateModifiedNoteLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: NoteViewCellViewModel) {
        titleNoteLabel.text = viewModel.titleNote
        textNoteLabel.text = viewModel.textNote
        dateCreatedNoteLabel.text = viewModel.dateCreated
        dateModifiedNoteLabel.text = viewModel.dateModified
    }
    
    private func setup() {
        setupSuperView()
        setupTitleNoteLabel()
        setupTextNoteLabel()
        setupDateModifiedNoteLabel()
        setupDateCreatedNoteLabel()
        setupSeparatorView()
    }
    
    private func setupSuperView() {
        backgroundColor = .backgroungNote
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    private func setupTitleNoteLabel() {
        addSubview(titleNoteLabel)
        
        titleNoteLabel.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        titleNoteLabel.textColor = .previewTitle
        titleNoteLabel.textAlignment = .left
        
        titleNoteLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func setupTextNoteLabel() {
        addSubview(textNoteLabel)

        textNoteLabel.textColor = .previewText
        textNoteLabel.textAlignment = .left
        textNoteLabel.font = UIFont.systemFont(ofSize: 18)
        textNoteLabel.sizeToFit()
        textNoteLabel.numberOfLines = 0

        textNoteLabel.snp.makeConstraints { make in
            make.top.equalTo(titleNoteLabel.snp.bottom).offset(3)
            make.trailing.leading.equalTo(titleNoteLabel)
            make.height.equalToSuperview().multipliedBy(0.63)
        }
    }
    
    private func setupDateModifiedNoteLabel() {
        addSubview(dateModifiedNoteLabel)
        
        dateModifiedNoteLabel.textColor = .lightGray
        dateModifiedNoteLabel.textAlignment = .left
        dateModifiedNoteLabel.font = UIFont.systemFont(ofSize: 10)
        
        dateModifiedNoteLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleNoteLabel)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func setupDateCreatedNoteLabel() {
        addSubview(dateCreatedNoteLabel)
        
        dateCreatedNoteLabel.textColor = .lightGray
        dateCreatedNoteLabel.textAlignment = .right
        dateCreatedNoteLabel.font = UIFont.systemFont(ofSize: 10)
        
        dateCreatedNoteLabel.snp.makeConstraints { make in
            make.trailing.equalTo(titleNoteLabel)
            make.bottom.equalTo(dateModifiedNoteLabel)
        }
    }
    
    private func setupSeparatorView() {
        addSubview(separatorView)
        separatorView.backgroundColor = .appColor
        
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(titleNoteLabel)
            make.bottom.equalTo(dateCreatedNoteLabel.snp.top).offset(-5)
            make.height.equalTo(2)
        }
    }
}
