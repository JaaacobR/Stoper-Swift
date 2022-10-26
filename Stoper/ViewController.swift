//
//  ViewController.swift
//  Stoper
//
//  Created by Jakub on 26/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stopBtn: UIButton!
    var timeStampStart = Date().timeIntervalSince1970
    
    var timerInterval:Timer = Timer()

    @IBOutlet weak var timer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        
    }
    @IBAction func clickButton(_ sender: Any) {
        timerInterval.invalidate()
    }
    @IBAction func startButtonClick(_ sender: Any) {
        timerInterval = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update()
    {
        let timestamp = Date().timeIntervalSince1970
        let time = timestamp - self.timeStampStart
        let dateToFormat = Date(timeIntervalSince1970: time)
        let dF = DateFormatter();
        
        dF.setLocalizedDateFormatFromTemplate(" mm:ss:SS")
        let format = dF.string(from: dateToFormat)
        
        timer.text = format
    }
    


}

