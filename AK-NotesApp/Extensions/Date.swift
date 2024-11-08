//
//  Date.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 7.11.2024.
//

import Foundation

///Burda yazilan Date extension icinde if Calendar.current kismi eger fonksiyon cagirildiginda tarihi bugunse o zaman saati goster demek. Degilse o zamanki tarihi goster demek.

extension Date {
    func format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        
        if Calendar.current.isDateInToday(self) {
            dateFormatter.dateFormat = "h:mm a"
        } else {
            dateFormatter.dateFormat = "MMM d, yyyy"
        }
        
        return dateFormatter.string(from: self)
    }
}

