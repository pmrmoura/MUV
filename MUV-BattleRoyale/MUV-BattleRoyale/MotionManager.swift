//
//  MotionManager.swift
//  MUV-BattleRoyale
//
//  Created by Lucas Silva on 10/02/21.
//

import Foundation
import Combine
import CoreMotion
import AudioToolbox

class MotionManager: ObservableObject {

    private var motionManager: CMMotionManager

    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    @Published
    var multiplierHorizontal: Double = 1.5
    @Published
    var multiplierVertical: Double = 1.5
    @Published
    var score: Double = 0.0
    @Published
    var movesCount: Int = 0
    @Published
    var orientation: String = ""
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.accelerometerUpdateInterval = 0.1
        self.motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let accelerometerData = data {
                self.x = accelerometerData.acceleration.x
                self.y = accelerometerData.acceleration.y
                self.z = accelerometerData.acceleration.z
                
                if(abs(self.x)>1.6){ //horizontal
                    self.score = self.score + (abs(self.x) * self.multiplierHorizontal);
                    self.movesCount+=1;
                    print("horizontal")
                }
                if(abs(self.y)>1.6){//vertical
                    self.score = self.score + (abs(self.y) * self.multiplierVertical);
                    self.movesCount+=1;
                    print("vertical")
                }
                
                if(abs(self.z)>1.6){
                    self.score = self.score + (abs(self.z) * 2.0);
                    self.movesCount+=1;
                }
            }

        }
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            self.doubleEffect();
        }
    }
    func doubleEffect() -> Void {
        let randomInt = Int.random(in: 0..<2);
        
        switch randomInt {
        case 0:
            self.orientation = "Horizontal";
            self.multiplierHorizontal = 6;
            self.multiplierVertical = 1.5;
        case 1:
            self.orientation = "Vertical";
            self.multiplierVertical = 6;
            self.multiplierHorizontal = 1.5;
        default:
            self.orientation = "";
        }
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}
