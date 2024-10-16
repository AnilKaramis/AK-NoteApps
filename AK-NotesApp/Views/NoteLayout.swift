//
//  NoteLayout.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 16.10.2024.
//

import UIKit

final class NoteLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else {return}
        
        scrollDirection = .vertical
        
        minimumLineSpacing = 20
        minimumInteritemSpacing = 20
        
        sectionInset.left = 30
        sectionInset.right = 30
        
        let itemsInRow = 2
        let sideInsets = sectionInset.left * 2
        let lineInsets = minimumInteritemSpacing * CGFloat(itemsInRow - 1) + sideInsets
        let otherSpace = collectionView.frame.width - lineInsets
        let cellWidth = otherSpace / CGFloat(itemsInRow)
        itemSize = CGSize(width: cellWidth, height: cellWidth * 1.3)
    }
}
