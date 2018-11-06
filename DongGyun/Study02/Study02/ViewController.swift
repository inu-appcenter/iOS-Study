//
//  ViewController.swift
//  Study02
//
//  Created by 동균 on 30/10/2018.
//  Copyright © 2018 동균. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    // 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    // 각 셀별 세부사항
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
