//
//  SKNode+.swift
//  Pluto
//
//  Created by changgyo seo on 2023/07/16.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SpriteKit

extension SKNode {
    
    func runAndRemove(_ action: SKAction, withKey: String = "") {
        
        let finishAction = SKAction.run {
            self.removeFromParent()
        }
        let sequence = SKAction.sequence([action, finishAction])
        run(sequence, withKey: withKey)
        
    }
}
