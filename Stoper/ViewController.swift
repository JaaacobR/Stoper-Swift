//
//  ViewController.swift
//  Stoper
//
//  Created by Jakub on 26/10/2022.
//

import UIKit


class TableData: UITableViewCell{


    @IBOutlet weak var mid: UILabel!
    @IBOutlet weak var left: UILabel!
    @IBOutlet weak var right: UILabel!
    
}

var intervals:Array<[String: Double]> = []
var time = 0.0
var intermediateTime = 0.0




extension ViewController: UITableViewDelegate { }
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intervals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableData
        
        cell.left.text = "Runda " + String(indexPath.row + 1)
        let dateToFormat = Date(timeIntervalSince1970: intervals[indexPath.row]["time"] ?? 0.0)
        let dF = DateFormatter();
        
        dF.setLocalizedDateFormatFromTemplate("mm:ss:SS")
        let format = dF.string(from: dateToFormat)
        
        
        
        
        let dateToFormatIntermediate = Date(timeIntervalSince1970: intervals[indexPath.row]["intermediateTime"] ?? 0.0)
      
        let formatIntermediate = dF.string(from: dateToFormatIntermediate)
        
        cell.right.text = format
       
        cell.mid.text = formatIntermediate
        
        var minTime = intervals[0]["intermediateTime"] ?? 0.0
        var maxTIme = intervals[0]["intermediateTime"] ?? 0.0
        
        for i in 0...intervals.count - 1{
            let current = intervals[i]["intermediateTime"] ?? 0.0
            if(current > maxTIme){
                maxTIme = current
            }
            if(current < minTime){
                minTime = current
            }
            print(maxTIme, minTime, current)
        }
        
        let blackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        cell.right.textColor = blackColor
        cell.left.textColor = blackColor
        cell.mid.textColor = blackColor
        
        let redColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        let greenColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
        
        if(intervals.count > 1 && maxTIme == intervals[indexPath.row]["intermediateTime"]){
            cell.right.textColor = redColor
            cell.left.textColor = redColor
            cell.mid.textColor = redColor
            
        }else if(intervals.count > 1 && minTime == intervals[indexPath.row]["intermediateTime"]){
            cell.right.textColor = greenColor
            cell.left.textColor = greenColor
            cell.mid.textColor = greenColor
        }
        
        return cell
    }
}

class ViewController: UIViewController {
    
        
    
    
    var isActive = false
    @IBOutlet weak var stopBtn: UIButton!
    
    var timerInterval:Timer = Timer()
    
   

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timer: UILabel!
    @IBAction func stopButtonClick(_ sender: Any) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view
        
        
    }
    @IBAction func clickButton(_ sender: Any) {
        if(isActive){
            let dict: [String: Double] = ["round": Double(intervals.count + 1),
                                         "time": time, "intermediateTime": intermediateTime]
            intervals.append(dict)
            tableView.reloadData()
            intermediateTime = 0.0
        }else{
            intervals = []
            time = 0.0
            intermediateTime = 0.0
            let dateToFormat = Date(timeIntervalSince1970: time)
            let dF = DateFormatter();
            
            dF.setLocalizedDateFormatFromTemplate("mm:ss:SS")
            let format = dF.string(from: dateToFormat)
            
            timer.text = format
            tableView.reloadData()
        }
        
    }
    @IBAction func startButtonClick(_ sender: Any) {

        if(isActive){
            timerInterval.invalidate()
            isActive = false
           
            
        }else{
            timerInterval = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            isActive = true
        }
        
    }
    @objc func update()
    {
        
            time = time + 0.01
            intermediateTime = intermediateTime + 0.01
            let dateToFormat = Date(timeIntervalSince1970: time)
            let dF = DateFormatter();
            
            dF.setLocalizedDateFormatFromTemplate("mm:ss:SS")
            let format = dF.string(from: dateToFormat)
            
            timer.text = format
  
    }
}

