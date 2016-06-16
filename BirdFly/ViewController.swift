//
//  ViewController.swift
//  BirdFly
//
//  Created by HoangHai on 6/16/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
    }
    func drawJungle(){
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }

    func addBird(){
        bird = UIImageView(frame: CGRectMake(200, 30, 110, 68))
        bird.animationImages = [UIImage(named:"bird0.png")!,
                                UIImage(named:"bird1.png")!,
                                UIImage(named:"bird2.png")!,
                                UIImage(named:"bird3.png")!,
                                UIImage(named:"bird4.png")!,
                                UIImage(named:"bird0.png")!,
                                UIImage(named:"bird1.png")!,
                                UIImage(named:"bird2.png")!,
                                UIImage(named:"bird3.png")!,
                                UIImage(named:"bird4.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 0.8
        bird.startAnimating()
        self.view.addSubview(bird)
    }

    func flyUpAndDown(){
//di cheo tu goc phai tren xuong trai duoi
        UIView.animateWithDuration(3, animations: {
            self.bird.center = CGPointMake(70, 500)
        }) { (finished) in
//di ngang tu trai duoi sang phai duoi
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
            UIView.animateWithDuration(1.5, animations: {self.bird.center = CGPointMake(260, 500)}) { (finished) in
//di cheo tu goc phai duoi len goc trai tren
            self.bird.transform = CGAffineTransformScale(self.bird.transform, -1, 1)
            self.bird.transform = CGAffineTransformMakeRotation((36.0*CGFloat(M_PI))/180.0)
                UIView.animateWithDuration(3, animations: {self.bird.center = CGPointMake(70, 50)})
                { (finished) in
//di ngang tu trai tren sang phai tren
            self.bird.transform = CGAffineTransformIdentity
            self.bird.transform = CGAffineTransformScale(self.bird.transform, -1, 1)
            UIView.animateWithDuration(1.5, animations: {self.bird.center = CGPointMake(240, 50)})
                { (finished) in
            self.bird.transform = CGAffineTransformIdentity
            self.flyUpAndDown()}
                }
                }
        }
}
    
    func playSong(){
            let filePath = NSBundle.mainBundle().pathForResource("A+ – Chào Mào Mái Hót", ofType: ".mp3")
            let url = NSURL(fileURLWithPath: filePath!)
        audioPlayer = try!AVAudioPlayer(contentsOfURL: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
}




