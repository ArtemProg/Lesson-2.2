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
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        coloredViews.forEach {
            $0.layer.cornerRadius = $0.frame.width / 2
            $0.alpha = 0.3
        }
    }

    @IBAction func nextButtonDidTapped() {
        
        guard !coloredViews.isEmpty else {
            fatalError("Забыл заполнить коллекцию!")
        }
        
        if currentIndexOfColorView >= 0 {
            coloredViews[currentIndexOfColorView].alpha = 0.3
        } else {
            nextButton.setTitle("NEXT", for: .normal)
            view.layoutIfNeeded()
        }
        
        currentIndexOfColorView = (currentIndexOfColorView + 1) %  coloredViews.count
        
        coloredViews[currentIndexOfColorView].alpha = 1
    }
    
}

