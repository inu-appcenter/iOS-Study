//
//  ViewController.swift
//  alamofireEx
//
//  Created by 동균 on 26/11/2018.
//  Copyright © 2018 동균. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var reportLabel: UILabel!
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        // id 가 9자리일때, 비밀번호를 적었을때
        if idTextField.text?.count == 9 && passTextField.text?.count != 0{
        loginPost(id: idTextField.text!, passwd: passTextField.text!)
        }else {
            reportLabel.text = "아이디 재확인부탁"
            reportLabel.isHidden = false

        }
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextField.delegate = self
        passTextField.delegate = self
        
        bannerTestPost()
    }
    
    func bannerTestPost(){
        Alamofire.request("http://117.16.231.66:7000/readBanner", method: .post, parameters: nil, headers: nil).responseJSON{ res in
            switch res.result{
            case .success(let item):
                print(item)
                break
            case .failure(let errors):
                print(errors)
                break
            }
            
        }
    }
    
    
    func loginPost(id : String, passwd: String){
        let header = ["Content-Type" : "application/x-www-form-urlencoded"]
        let params = [ "id" : id,
                       "passwd" : passwd]

        Alamofire.request("http://117.16.231.66:7000/tlogin", method: .post, parameters: params, headers: header).responseJSON { res in
            switch res.result{
            case .success(let resultdata):
                print(resultdata)
                
                var temp: [UserInfo] = []
                
                if let item = resultdata as? NSDictionary {
                    let token = item["token"] as? String ?? ""
                    let id = item["id"] as? String ?? ""
                    let name = item["name"] as? String ?? ""
                    let tel = item["tel"] as? String ?? ""
                    let message = item["message"] as? String ?? ""
                    let letter = item["letter"] as? Int ?? 0
                    let product = item["product"] as? Int ?? 0
                    let obj = UserInfo.init(token: token, id: id, name: name, tel: tel, message: message, letter: letter, product: product)
                    temp.append(obj)
                }
                
                
                if temp[0].message == "logged in success"{
                    self.reportLabel.isHidden = false
                    self.reportLabel.text = "로그인 성공"
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    if let vc = storyBoard.instantiateViewController(withIdentifier: "MainPage") as? MainPageViewController {
                        vc.id = "아이디는 : \(temp[0].id!)"
                        vc.pass = "비밀번호는 : \(self.passTextField.text!)"
                        self.navigationController?.show(vc, sender: nil)
                    }

                } else if temp[0].message == "certification"{
                    self.reportLabel.isHidden = false
                    self.reportLabel.text = "인증이 필요합니다."
                } else if temp[0].message == "false"{
                    self.reportLabel.isHidden = false
                    self.reportLabel.text = "아이디 또는 비번 오류"
                }
                
                
//                ====================================================
                
//                var anstemp: [ans] = []
//
//                if let item = resultdata as? NSDictionary{
//                    let message = item["message"] as? String ?? ""
//                    let obj = ans.init(message: message)
//                    anstemp.append(obj)
//                    self.ansresult = obj
//                }
//
//                self.loginResult(ansre: self.ansresult!)
//                break
//
                
            case .failure(let error):
                print("서버통신 실패")
                print(error)
                break
            }
        }
    }
    
//    var ansresult: ans?
//
//    func loginResult(ansre : ans){
//        if ansre.message == "logged in success"{
//            self.reportLabel.isHidden = false
//            self.reportLabel.text = "로그인 성공"
//        } else if ansre.message == "certification"{
//            self.reportLabel.isHidden = false
//            self.reportLabel.text = "인증이 필요합니다."
//        } else if ansre.message == "false"{
//            self.reportLabel.isHidden = false
//            self.reportLabel.text = "아이디 또는 비번 오류"
//        }
//    }
}

