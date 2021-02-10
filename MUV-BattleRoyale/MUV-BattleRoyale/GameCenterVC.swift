//
//  GameCenterHelper.swift
//  MUV-BattleRoyale
//
//  Created by Luis Pereira on 09/02/21.
//

import Foundation
import GameKit
import SwiftUI

class GameCenterHelperVC: UIViewController,GKLocalPlayerListener{
    
    private let inviteMessage = "Let's play"
    
    var isAuthenticated:Bool{
        return GKLocalPlayer.local.isAuthenticated
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if GKLocalPlayer.local.isAuthenticated == false{
            authenticatePlayer()
        }else{
            presentMatchmaker()
        }
        
    }
    
    func authenticatePlayer(){
        GKLocalPlayer.local.authenticateHandler = { (gameCenterAuthViewController,error) in
            
            if gameCenterAuthViewController != nil{
                self.present(gameCenterAuthViewController!, animated: true, completion: nil)
            }
            
            
        }
    }
    
    func presentMatchmaker(withInvite invite: GKInvite? = nil) {
        guard GKLocalPlayer.local.isAuthenticated,
              let vc = createMatchmaker(withInvite: invite) else {
            return
        }
        
        vc.matchmakerDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    private func createMatchmaker(withInvite invite: GKInvite? = nil) -> GKMatchmakerViewController? {
        
        //If there is an invite, create the matchmaker vc with it
        if let invite = invite {
            return GKMatchmakerViewController(invite: invite)
        }
        
        return GKMatchmakerViewController(matchRequest: createRequest())
    }
    
    private func createRequest() -> GKMatchRequest {
        let request = GKMatchRequest()
        request.minPlayers = 3
        request.maxPlayers = 10
        request.inviteMessage = inviteMessage
        
        return request
    }

}

extension GameCenterHelperVC:GKMatchmakerViewControllerDelegate{
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
    }
    
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true, completion: nil)
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        self.present(vc, animated: true, completion: nil)
    }
    
    func player(_ player: GKPlayer, didAccept invite: GKInvite) {
    }
    
}
