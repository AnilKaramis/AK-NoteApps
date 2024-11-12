import UIKit

var greeting = "Hello, playground"


func shouldSaveNote(with title: String?, and text: String?) {
    guard let title = title, let text = text else { return }
    
    if (text.isEmpty || text == placeholderForContent) && title.isEmpty {
        deleteNote()
    } else {
        createNote(title: title, text: text)
    }
}

