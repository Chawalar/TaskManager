//
//  AddItemViewController.swift
//  TaskManager
//
//  Created by Igor Gaidamaka on 11.02.2021.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var receivedData = ""
    var receiveSegue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTextField.delegate = self
        taskTextField.text = receivedData
        changeState()
        updateSaveButton()

    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButton()
    }

    func changeState () {
        if receiveSegue == "2" {
            saveButton.title = "Change"
        }
    }
    
    func updateSaveButton() {

        if receiveSegue == "2" {
            print("update segue")
            let text = taskTextField.text ?? ""
            saveButton.isEnabled = text.count > 3 && !text.hasPrefix(" ")
            
        } else {
            print("save segue")
            let text = taskTextField.text ?? ""
            saveButton.isEnabled = text.count > 3 && !text.hasPrefix(" ")
        }
    }
    
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
//        guard let button = sender as? UIBarButtonItem, button === saveButton else {
//            print("The save button was not pressed")
//            return
//        }
        
        if receiveSegue == "" {
            TaskManager.shared.addCell(text: taskTextField.text!)
            print(TaskManager.shared.arrayOfTasks)
            print("Cell saved")
        } else if receiveSegue == "2" {
            TaskManager.shared.updateCell(text: receivedData, newText: taskTextField.text!)
            print(TaskManager.shared.arrayOfTasks)
            print("Cell updated")
        }
    }

}
