//
//  AddPetViewController.swift
//  Dookie
//
//  Created by Mathias Lindholm on 05.02.2017.
//  Copyright © 2017 Mathias Lindholm. All rights reserved.
//

import UIKit
import Firebase
import SwiftyUserDefaults

class AddPetViewController: UIViewController, UITextFieldDelegate {
    var ref: FIRDatabaseReference!

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        ref = FIRDatabase.database().reference()
        self.hideKeyboardWhenTappedAround()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ref.removeAllObservers()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addButtonPressed(self)
        return true
    }

    // MARK: - Actions
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let name = textField.text?.trimmingCharacters(in: .whitespaces) else { return }

        switch !name.isEmpty {
        case true:
            ref.childByAutoId().child("pet").setValue(["name": name], withCompletionBlock: { (error, reference) in
                guard let id = reference.parent?.key else { return }
                let pet = Pet.init(id, name, "")
                PetManager.shared.add(pet)
                self.performSegue(withIdentifier: "addJoinPet", sender: self)
            })
        case false: return
        }
    }
}
