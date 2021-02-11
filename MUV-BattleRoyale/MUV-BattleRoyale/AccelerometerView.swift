//
//  AcelerometerView.swift
//  MUV-BattleRoyale
//
//  Created by Lucas Silva on 10/02/21.
//

import Foundation
import SwiftUI

struct AccelerometerView: View {

    @ObservedObject
    var motion: MotionManager

    var body: some View {
        VStack {
            Text("\(motion.orientation)")
            Text("Score: \(motion.score)")
            Text("moves: \(motion.movesCount)")
            Text("Accelerometer Data")
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
        }
    }
}

struct AccelerometerView_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerView(motion: MotionManager())
    }
}
