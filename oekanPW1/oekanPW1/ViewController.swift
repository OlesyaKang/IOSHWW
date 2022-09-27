//
//  ViewController.swift
//  oekanPW1
//
//  Created by Ольга on 26.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Views: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ChangeColorButtonPressed(_ sender: Any) {
        var set = Set<UIColor>()
        while set.count < Views.count {
            set.insert(UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1)
            )
        }
        for view in Views {
            view.layer.cornerRadius = 20;
            UIView.animate(withDuration: 1, animations: {
                view.backgroundColor = set.popFirst();
            })

        }
        
    }
    
}

