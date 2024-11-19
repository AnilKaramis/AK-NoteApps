//
//  NoteListLayout.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 18.11.2024.
//

import UIKit

class NoteListLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        scrollDirection = .vertical
    
        minimumLineSpacing = 20
        
        let cvWidth = collectionView.bounds.width * 0.9;
        let cvHeight = collectionView.bounds.height;
        
        let cellWidth = cvWidth;
        let cellHeight = cvHeight / 6;
        
        itemSize = CGSize(width: cellWidth, height: cellHeight)
    }
}
