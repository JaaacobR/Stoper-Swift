//
//  ViewController.swift
//  Stoper
//
//  Created by Jakub on 26/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var _timerInterval = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        
    }
    @objc func update()
    {
        let timestamp = Date().timeIntervalSince1970
        let dateToFormat = Date(timeIntervalSince1970: timestamp)
        let dF = DateFormatter();
        dF.locale = Locale(identifier: "pl_PL")
        dF.setLocalizedDateFormatFromTemplate("HH:mm:ss:SS")
        let format = dF.string(from: dateToFormat)
        
        timer.text = format
    }
    


}

