//
//  Model.swift
//  TaskManager
//
//  Created by Igor Gaidamaka on 10.02.2021.
//

import Foundation
import UIKit

struct Task {
    var id: Int
    var text: String
}

class TaskManager {
    static let shared = TaskManager()
    var arrayOfTasks = [Task(id: 0, text: "table cell")]
    
    func addCell(text: String) {
        //with no uniq value guarantee
        let randomID = Int.random(in: 1...2)
        let result = arrayOfTasks.filter { (task) -> Bool in
            return task.id == randomID
        }
        if !result.isEmpty {
            print(randomID)
            let newRandomID = Int.random(in: 1...200)
            arrayOfTasks.append(Task(id: newRandomID, text: text))
        } else {
            arrayOfTasks.append(Task(id: randomID, text: text))
            
        }
    }
    
    func removeCell(id: Int) {
        arrayOfTasks.remove(at: id)
    }
    
    func updateCell(text: String, newText: String) {
        //let text = 1
        arrayOfTasks = arrayOfTasks.map {
            var mutableTask = $0
            print(mutableTask)
            if $0.text == text {
                mutableTask.text = newText
            }
            return mutableTask
        }
        print(newText)
    }
    
    private init () {}
}

