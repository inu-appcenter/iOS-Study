//
//  DBManager.swift
//  alamofireEx
//
//  Created by 동균 on 26/11/2018.
//  Copyright © 2018 동균. All rights reserved.
//

import Foundation





// 로그인 사용자 정보
class UserInfo{
    var token: String?
    var id: String?
    var name: String?
    var tel: String?
    var message: String?
    var letter: Int?
    var product: Int?
    
    init(token: String, id: String, name: String, tel: String, message: String, letter: Int, product: Int) {
        self.token = token
        self.id = id
        self.name = name
        self.tel = tel
        self.message = message
        self.letter = letter
        self.product = product
    }
}


class ans{
    var message: String?

    init(message: String) {
        self.message = message
    }
}
