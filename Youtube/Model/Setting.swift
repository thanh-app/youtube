//
//  Setting.swift
//  Youtube
//
//  Created by apple on 10/26/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

struct Setting {
    let name : settingname
    let iconimage : String
}


enum settingname : String {
    
    case setting = "Setting"
    case cancel = "Cancel"
    case terms = "Terms & privacy policy"
    case send = "Send Feedback"
    case helps = "Helps"
    case switchAccount = "Switch Account"
    
}

