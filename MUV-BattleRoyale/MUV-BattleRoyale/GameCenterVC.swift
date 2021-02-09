//
//  GameCenterHelper.swift
//  MUV-BattleRoyale
//
//  Created by Luis Pereira on 09/02/21.
//

import Foundation
import GameKit
import SwiftUI

class GameCenterHelperVC: UIViewController{
    
    private let inviteMessage = "Let's play"
    
    var isAuthenticated:Bool{
        return GKLocalPlayer.local.isAuthenticated
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticatePlayer()
    }
    
    func authenticatePlayer(){
        GKLocalPlayer.local.authenticateHandler = { (gameCenterAuthViewController,error) in
            
            if gameCenterAuthViewController != nil{
                self.present(gameCenterAuthViewController!, animated: true, completion: nil)
            }
            
            
        }
    }
}

struct GameCenterAuthView:UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = GameCenterHelperVC()
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
