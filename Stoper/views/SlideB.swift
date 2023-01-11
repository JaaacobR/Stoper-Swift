//
//  SlideB.swift
//  Stoper
//
//  Created by Jakub on 04/01/2023.
//

import UIKit

class SlideB: UIView {

    
    @IBOutlet weak var imgView: UIImageView!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print(rect.height)
        
    }
    
    func drawClock(time: Double){
      

        UIGraphicsBeginImageContext(imgView.bounds.size)
        imgView.draw(imgView.bounds)
        let ctx=UIGraphicsGetCurrentContext()
        ctx?.move(to: CGPoint(x: 200, y: 0))
        
        //ctx?.addLine(to: )
        
       imgView.image=UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

            
    }
    
   
    

}
