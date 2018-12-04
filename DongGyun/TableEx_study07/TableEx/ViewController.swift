//
//  ViewController.swift
//  TableEx
//
//  Created by 동균 on 04/12/2018.
//  Copyright © 2018 동균. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    //섹션별 셀 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: //섹션은 0부터 시작 가장 첫 섹션
            return 1
            
        case 1:
            return 2
            
        default:
            return 0
        }
    }
    //셀별 세부사항
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        cell.textLabel?.text = "title"
        cell.detailTextLabel?.text = "1"
        
        return cell
    }
    //섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "앞부분"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "뒷부분"
    }
    
    
//    기존에 존재하던 스와이프함수
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let delete = UITableViewRowAction(style: .default, title: "삭제") { (UITableViewRowAction, IndexPath) in
//            print("1")
//        }
//        let edit = UITableViewRowAction(style: .destructive, title: "수정") { (UITableViewRowAction, IndexPath) in
//            print("1")
//        }
//
//        return [delete, edit]
//
//    }
    
    // 왼 -> 오 스와이프 iOS11 이 나오고 새로 생김
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:  "삭제", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            // Call edit action
            
            // Reset state
            
            success(true)
            
        })
        let shareAction = UIContextualAction(style: .normal, title:  "공유", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            // Call edit action
            
            // Reset state
            
            success(true)
            
        })
        
        return UISwipeActionsConfiguration(actions:[deleteAction,shareAction])
        
        
    }

    // 오->왼 스와이프 iOS11 이 나오고 새로 생김
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:  "삭제", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            // Call edit action
            
            // Reset state
            
            success(true)
            
        })
        let shareAction = UIContextualAction(style: .normal, title:  "공유", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            // Call edit action
            
            // Reset state
            
            success(true)
            
        })
        
        return UISwipeActionsConfiguration(actions:[deleteAction,shareAction])
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}


