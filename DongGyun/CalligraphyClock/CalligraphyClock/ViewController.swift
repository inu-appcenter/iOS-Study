//
//  ViewController.swift
//  CalligraphyClock
//
//  Created by 동균 on 25/11/2018.
//  Copyright © 2018 동균. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var h1: UILabel!
    @IBOutlet weak var h2: UILabel!
    @IBOutlet weak var hourChar: UILabel!
    @IBOutlet weak var m1: UILabel!
    @IBOutlet weak var m2: UILabel!
    @IBOutlet weak var m3: UILabel!
    @IBOutlet weak var minChar: UILabel!
    @IBOutlet weak var s1: UILabel!
    @IBOutlet weak var s2: UILabel!
    @IBOutlet weak var s3: UILabel!
    @IBOutlet weak var secChar: UILabel!
    
    @IBOutlet weak var fullDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTime()
        
        let language = Locale.preferredLanguages[0]
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func updateTime(_ timer: Timer? = nil){
        let date = Date() //날짜 가져오기 그냥 값을 가져오는 것이기 때문에 포매터사용ㄴㄴ
        let calendar = Calendar.current // 현재 값 가져오기
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
        let hour = components.hour! <= 12 ? components.hour : components.hour! - 12
        //12시간이 넘을경우 처리
        let minutes = components.minute
        let seconds = components.second
        let hours: Array = ["영", "한", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열", "열 한", "열 두"]
        let number: Array = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"]
        
        // 각 지역별 나타내주기
        let timestamp = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .medium)
        fullDisplay.text = timestamp
        //
        if hours[hour!].count > 1{
            h1.text = "\(hours[hour!].first!)"
            h2.text = "\(hours[hour!].last!)"
        }else {
            h1.text = ""
            h2.text = hours[hour!]
        }
        
        hourChar.text = "시"
        
        if minutes! <= 10{
            m1.text = ""
            m2.text = ""
            m3.text = "\(number[minutes!])"
        }else if minutes! < 20 {
            m1.text = ""
            m2.text = "\(number[10])"
            m3.text = "\(number[minutes!%10])"
        }else {
            if minutes! % 10 == 0{
                m1.text = ""
                m2.text = "\(number[minutes!/10])"
                m3.text = "\(number[10])"
            }else {
                m1.text = "\(number[minutes!/10])"
                m2.text = "\(number[10])"
                m3.text = "\(number[minutes!%10])"
            }
        
        }
        minChar.text = "분"
        
        if seconds! <= 10{
            s1.text = ""
            s2.text = ""
            s3.text = "\(number[seconds!])"
        }else if seconds! < 20{
            s1.text = ""
            s2.text = "\(number[10])"   // 십
            s3.text = "\(number[seconds!%10])"
        }else {
            if seconds! % 10 == 0{
                s1.text = ""
                s2.text = "\(number[seconds!/10])"
                s3.text = "\(number[10])"
            }else {
                s1.text = "\(number[seconds!/10])"
                s2.text = "\(number[10])"
                s3.text = "\(number[seconds!%10])"
            }
        }
        
        secChar.text = "초"
        
        if timer != nil && String(describing: timer?.userInfo).range(of: "ko") == nil{
            fullDisplay.text = timestamp
        }else {
            fullDisplay.text = ""
        }
        
    }
}

