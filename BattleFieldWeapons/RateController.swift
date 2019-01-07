//
//  RateController.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/5.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit

class RateController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var rateButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        stackView.transform = .init(translationX: 800, y: 0)
        
        let startPos = CGAffineTransform(translationX: 500, y: 0)
        
        for button in rateButtons {
            button.alpha = 0
            button.transform = startPos
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeIn) {
//            self.stackView.transform = .identity
//        }
//        animator.startAnimation()
        var delay = 0.0
        for button in rateButtons {
            UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
                button.alpha = 1
                button.transform = .identity
                delay += 0.1
            }.startAnimation(afterDelay: delay)
        }
        
    }
    
    @IBAction func tapBackground(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func dragStackView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: view)
            let position = CGAffineTransform(translationX: translation.x, y: translation.y)
            let angle = sin(translation.x / stackView.frame.width)
            stackView.transform = position.rotated(by: angle)
            
        case .ended:
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.5) {
                self.stackView.transform = .identity
            }.startAnimation()
            
        default:
            break
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
