//
//  GameScene.swift
//  MUV-BattleRoyale
//
//  Created by Luis Pereira on 10/02/21.
//

import Foundation
import SpriteKit

class actionRow{
    public let frontWalk = 9
    public let backWalk = 11
    public let wideArmsDanceMove = 18
}

class actionRowLen{
    public let fronWalk = 9
    public let  backWalk = 9
    public let wideArmsDanceMove = 7
}

class SpriteSheet {
    let texture: SKTexture
    let rows: Int
    let columns: Int
    var margin: CGFloat=0
    var spacing: CGFloat=0
    var frameSize: CGSize {
        return CGSize(width: (self.texture.size().width-(self.margin*2+self.spacing*CGFloat(self.columns-1)))/CGFloat(self.columns),
                      height: (self.texture.size().height-(self.margin*2+self.spacing*CGFloat(self.rows-1)))/CGFloat(self.rows))
    }
    
    init(texture: SKTexture, rows: Int, columns: Int, spacing: CGFloat, margin: CGFloat) {
        self.texture=texture
        self.rows=rows
        self.columns=columns
        self.spacing=spacing
        self.margin=margin
        
    }
    
    convenience init(texture: SKTexture, rows: Int, columns: Int) {
        self.init(texture: texture, rows: rows, columns: columns, spacing: 0, margin: 0)
    }
    
    func textureForColumn(column: Int, row: Int)->SKTexture? {
        if !(0...self.rows ~= row && 0...self.columns ~= column) {
            //location is out of bounds
            return nil
        }
        
        var textureRect=CGRect(x: self.margin+CGFloat(column)*(self.frameSize.width+self.spacing)-self.spacing,
                               y: self.margin+CGFloat(row)*(self.frameSize.height+self.spacing)-self.spacing,
                               width: self.frameSize.width,
                               height: self.frameSize.height)
        
        textureRect=CGRect(x: textureRect.origin.x/self.texture.size().width, y: textureRect.origin.y/self.texture.size().height,
                           width: textureRect.size.width/self.texture.size().width, height: textureRect.size.height/self.texture.size().height)
        return SKTexture(rect: textureRect, in: self.texture)
    }
    
}

class GameScene: SKScene {
    var player = SKNode()
    let cameraNode = SKCameraNode()
    let sheet = SpriteSheet(texture: SKTexture(imageNamed: "NatchiSS"), rows: 21, columns: 13, spacing: 0, margin: 0)
    let rowGuide = actionRow()
    let columnGuide = actionRowLen()
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "player")!
        let texture = sheet.textureForColumn(column: 0, row: rowGuide.frontWalk)!
        player.run(SKAction.setTexture(texture))
        cameraNode.position.x = (self.scene?.frame.midX)!
        cameraNode.position.y = (self.scene?.frame.midY)!
        addChild(cameraNode)
        self.camera = cameraNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        let act = SKAction.move(to: CGPoint(x: location!.x, y: self.player.position.y), duration: 0.5)
        player.removeAllActions()
        player.run(act)
        
        if(location!.x > self.player.position.x){
            player.run(frontWalk())
        }
        
        if(location!.x < self.player.position.x){
            player.run(backWalk())
        }
        let cameraAct = SKAction.move(to: CGPoint(x: location!.x, y: (self.camera?.position.y)!), duration: 0.8)
        self.camera?.run(cameraAct)
    }
    
    func frontWalk() -> SKAction{
        var textureArray:[SKTexture] = []
        
        for index in 0...(columnGuide.fronWalk-1){
            let texture = sheet.textureForColumn(column: index, row: rowGuide.frontWalk)!
            textureArray.append(texture)
        }
        let texture = sheet.textureForColumn(column: 0, row: rowGuide.frontWalk)!
        textureArray.append(texture)
        return SKAction.animate(with: textureArray, timePerFrame: 0.05)
    }
    
    func backWalk() -> SKAction{
        var textureArray:[SKTexture] = []
        
        for index in 0...(columnGuide.backWalk-1){
            let texture = sheet.textureForColumn(column: index, row: rowGuide.backWalk)!
            textureArray.append(texture)
        }
        let texture = sheet.textureForColumn(column: 0, row: rowGuide.backWalk)!
        textureArray.append(texture)
        return SKAction.animate(with: textureArray, timePerFrame: 0.05)
    }
    
    func wideArmsDance()->SKAction{
        var textureArray:[SKTexture] = []
        
        for index in 0...(columnGuide.wideArmsDanceMove-1){
            let texture = sheet.textureForColumn(column: index, row: rowGuide.wideArmsDanceMove)!
            textureArray.append(texture)
        }
        let texture = sheet.textureForColumn(column: 0, row: rowGuide.wideArmsDanceMove)!
        textureArray.append(texture)
        return SKAction.repeat(SKAction.animate(with: textureArray, timePerFrame: 0.05), count: 5)
    }
}
