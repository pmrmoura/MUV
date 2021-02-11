//
//  MUV_BattleRoyaleApp.swift
//  MUV-BattleRoyale
//
//  Created by Luis Pereira on 09/02/21.
//

import SwiftUI

@main
struct MUV_BattleRoyaleApp: App {
    var body: some Scene {
        WindowGroup {
            AccelerometerView(motion: MotionManager())
        }
    }
}
