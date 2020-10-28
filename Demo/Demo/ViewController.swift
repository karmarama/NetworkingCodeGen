//
//  ViewController.swift
//  Demo
//
//  Created by Sam Woolf on 27/10/2020.
//

import UIKit
import Combine

class ViewController: UIViewController {
var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print(Double.fake())
        print(Int.fake())
        print(Bool.fake())
        print(String.fake())
        print([String].fake())

        let repository = Repository()
        let pet = repository.addPet(body: Pet.defaultFakeValue)

        pet.sink(receiveCompletion: { error in print(error)}, receiveValue: {empty in print(empty)}).store(in: &cancellables)

    }
}

