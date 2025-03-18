//
//  ViewController.swift
//  Lesson 2.2
//
//  Created by Artem on 3/16/25.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var coloredViews: [UIView]!
    
    @IBOutlet weak var nextButton: UIButton!
    
    private var currentIndexOfColorView = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        
        coloredViews.forEach {
            setLightState(for: $0, isActive: false)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        coloredViews.forEach {
            $0.layer.cornerRadius = $0.frame.width / 2

        }
    }
    
    private func setLightState(for view: UIView, isActive: Bool) {
        view.alpha = isActive ? 1.0 : 0.3
    }

    @IBAction func nextButtonDidTapped() {
        
        assert(coloredViews.count == 3, "Забыл заполнить коллекцию!")
        
        if currentIndexOfColorView == -1 {
            nextButton.setTitle("NEXT", for: .normal)
        }
        
        if currentIndexOfColorView >= 0 {
            setLightState(for: coloredViews[currentIndexOfColorView], isActive: false)
        }
        
        currentIndexOfColorView = (currentIndexOfColorView + 1) % coloredViews.count
        
        setLightState(for: coloredViews[currentIndexOfColorView], isActive: true)
        
    }
    
}

