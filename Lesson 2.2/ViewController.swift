//
//  ViewController.swift
//  Lesson 2.2
//
//  Created by Artem on 3/16/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var coloredViews: [UIView]!
    
    @IBOutlet weak var nextButton: UIButton!
    
    private var currentIndexOfColorView = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        
        coloredViews.forEach {
            $0.alpha = 0.3
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        coloredViews.forEach {
            $0.layer.cornerRadius = $0.frame.width / 2

        }
    }

    @IBAction func nextButtonDidTapped() {
        
        guard !coloredViews.isEmpty else {
            fatalError("Забыл заполнить коллекцию!")
        }
        
        if currentIndexOfColorView == -1 {
            nextButton.setTitle("NEXT", for: .normal)
        }
        
        if self.currentIndexOfColorView >= 0 {
            self.coloredViews[self.currentIndexOfColorView].alpha = 0.3
        }
        
        self.currentIndexOfColorView = (self.currentIndexOfColorView + 1) % self.coloredViews.count
        
        self.coloredViews[self.currentIndexOfColorView].alpha = 1
        
    }
    
}

