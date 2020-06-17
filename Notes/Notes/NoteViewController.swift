//
//  NoteViewController.swift
//  Notes
//
//  Created by Bheki Maenetja on 2020/06/17.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import Foundation
import UIKit

class NoteViewController: UIViewController {
    var note: Note!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        note.content = textView.text
        NoteManager.main.save(note: note)
    }
}
