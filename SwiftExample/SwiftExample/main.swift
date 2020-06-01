//
//  main.swift
//  SwiftExample
//
//  Created by Bheki Maenetja on 2020/06/01.
//  Copyright © 2020 CS50. All rights reserved.
//

import Foundation

class Track {
    let name: String
    let instructor: String
    
    init(name: String, instructor: String) {
        self.name = name
        self.instructor = instructor
    }
}

let tracks: [Track] = [
    Track(name: "Mobile", instructor: "Tommy"),
    Track(name: "Web", instructor: "Brian"),
    Track(name: "Games", instructor: "Colton")
]

let students = ["Harry", "Ron", "Hermione"]

var assignments: [String: Track] = [:]
for student in students {
    let track = Int.random(in: 0 ..< tracks.count)
    assignments[student] = tracks[track]
}

for (student, track) in assignments {
    print("\(student) got \(track.name) with \(track.instructor)")
}
