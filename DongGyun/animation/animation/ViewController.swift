//
//  ViewController.swift
//  animation
//
//  Created by 동균 on 20/11/2018.
//  Copyright © 2018 동균. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var soju: UIView!
    
    var colorIndex : Int = 0
    
    var frameIndex: Int = 0
    
    let viewColor: [UIColor] = [.red, .blue]
    
    let frame: [CGRect] = [CGRect(x: 0, y: 0, width: 100, height: 100),
                           CGRect(x: 100, y: 100, width: 100, height: 100)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soju.frame = frame[0]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func moveClicked(_ sender: Any) {
        UIView.animate(withDuration: 1.0){
            self.soju.frame = self.frame[self.frameIndex]
            self.view.layoutIfNeeded()
            //레이아웃이 변할때 뷰의 레이아웃을 정리해주는 함수
        }
        self.frameIndex += 1
        if frameIndex == 2{
            frameIndex = 0
        }
    }
    
    
    @IBAction func changColorClicked(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.soju.backgroundColor = self.viewColor[self.colorIndex]
        }
        self.colorIndex += 1
        if colorIndex == 2{
            colorIndex = 0
        }
    }
    
    @IBAction func hideClicked(_ sender: Any) {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            if self.soju.isHidden == true {
                self.soju.isHidden = false
            }else{
                self.soju.isHidden = true
            }
        }, completion: nil)
    }
    
    
    @IBAction func animateOption(_ sender: Any) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseIn, animations: {
            self.soju.frame = self.frame[self.frameIndex]
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.frameIndex += 1
        if frameIndex == 2 {
            frameIndex = 0
        }
    }
    
    @IBAction func aniOption2(_ sender: Any) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.soju.frame = self.frame[self.frameIndex]
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.frameIndex += 1
        if frameIndex == 2 {
            frameIndex = 0
        }
    }
    
    @IBAction func aniOption3(_ sender: Any) {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.soju.frame = self.frame[self.frameIndex]
            self.view.layoutIfNeeded()
        }, completion: nil)
        self.frameIndex += 1
        if self.frameIndex == 2 {
            self.frameIndex = 0
        }
        
    }
}

