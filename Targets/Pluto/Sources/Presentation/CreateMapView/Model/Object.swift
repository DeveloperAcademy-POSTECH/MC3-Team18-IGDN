//
//  Object.swift
//  Pluto
//
//  Created by 홍승완 on 2023/07/22.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

struct Object: ObstacleProtocol {
    var point: CGPoint
    var size: CGSize
    var color: AstronautColor
    var path: Int
    var imageName: String
    var isClockWise: Bool
    var tutorails: [GameAlertType] = []
    
    // 초기화
    init(creativeObject: CreativeObject) {
        self.point = creativeObject.point
        if creativeObject.shapeIndex == 3 {
            self.size = CreativeObject.CGSizeList_Diamond[creativeObject.sizeIndex]
        }
        else {
            self.size = CreativeObject.CGSizeList[creativeObject.sizeIndex]
        }
        self.path = creativeObject.pathIndex
        self.imageName = Obstacle.image[creativeObject.colorIndex][creativeObject.sizeIndex][creativeObject.shapeIndex]
        self.isClockWise = Obstacle.isClockWise[creativeObject.shapeIndex]
        
        switch creativeObject.color {
        case "creative_color_white":
            self.color = .none
        case "creative_color_red":
            self.color = .two
        case "creative_color_yellow":
            self.color = .combine
        case "creative_color_green":
            self.color = .one
        default:
            self.color = .none
        }
    }
    
    init(_ point: CGPoint, _ size: CGSize, _ color: AstronautColor, _ path: Int, _ imageName: String, _ isColockWise: Bool, _ tutorails: [GameAlertType] = []){
        
        self.point = point
        self.size = size
        self.color = color
        self.path = path
        self.imageName = imageName
        self.isClockWise = isColockWise
        self.tutorails = tutorails
    }
}

extension Array where Element == Object {
    func printAll() {
        print("[")
        for obj in self {
            print("Object(CGPoint(x: \(obj.point.x), y: \(obj.point.y)), CGSize(width: \(obj.size.width), height: \(obj.size.height)), .\(obj.color), \(obj.path), \"\(obj.imageName)\", \(obj.isClockWise)),")
        }
        print("]")
    }
}

// MARK: 사용예시
//var objects: [Object] = []
//for object in viewModel.objectList {
//    let transferingObject= Object(creativeObject: object)
//    objects.append(transferingObject)
//}
