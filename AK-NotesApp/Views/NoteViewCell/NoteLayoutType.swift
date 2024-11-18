//
//  NoteLayoutType.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 18.11.2024.
//

import UIKit

enum NoteLayoutType {
    case list, gallery
    
    var layout: UICollectionViewFlowLayout {
        switch self {
        case .list:
            return NoteListLayout()
        case .gallery:
            return NoteGalleryLayout()
        }
    }
}

