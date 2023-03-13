//
//  UserInfo.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/1/23.
//

import Foundation
import FirebaseAuth

class UserInfo: ObservableObject{
    @Published var id : String = UUID().uuidString
    @Published var username : String
    @Published var password : String
    @Published var loggedIn : Bool = false
    @Published var image: UIImage = UIImage(named: "default")!
    
    init(username: String = "", password: String = ""){
        self.username = username
        self.password = password
        
        Auth.auth().addStateDidChangeListener{_, user in
            guard let user = user else {return}
            
            self.username = user.email ?? ""
            
            self.loggedIn = true
        }
    }
}
