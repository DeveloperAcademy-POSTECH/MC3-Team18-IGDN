//
//  StageData.swift
//  Pluto
//
//  Created by 고혜지 on 2023/07/27.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

let stages:[Stage] = [
    Stage(level: 1, startStory: story1, endStory: nil, map: [
        Object(CGPoint(x: 0, y: 422), CGSize(width: 105.0, height: 105.0), .none, 1, "", false, page0, false), //empty
        Object(CGPoint(x: -5, y: 323), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 100, y: 422), CGSize(width: 105.0, height: 105.0), .none, 1, "", false, page1, false), //empty
        Object(CGPoint(x: 230, y: 230), CGSize(width: 105.0, height: 105.0), .one, 1, "circle_70_green", false),

        Object(CGPoint(x: 235.5, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page2, false), // tutorial
        Object(CGPoint(x: 330, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page3, false), // tutorial
        Object(CGPoint(x: 510.5, y: 410), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 540, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page4, false), // tutorial
      
        Object(CGPoint(x: 670, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page5, false), // tutorial
        Object(CGPoint(x: 770, y: 350), CGSize(width: 105.0, height: 105.0), .two, 1, "circle_70_red", false),
        Object(CGPoint(x: 790, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page6, false), // tutorial
      
        Object(CGPoint(x: 910, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page7, false), // tutorial
        Object(CGPoint(x: 1020, y: 300), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 1060, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page8, false), // tutorial
      
        Object(CGPoint(x: 1150, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page9, false), // tutorial
      
        Object(CGPoint(x: 1318, y: 300), CGSize(width: 105.0, height: 105.0), .combine, 1, "circle_70_yellow", false),
        Object(CGPoint(x: 1330, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page10, false), // tutorial
      
        Object(CGPoint(x: 1440, y: 422), CGSize(width: 105.0, height: 105.0), .one, 1, "", false, page11, false), // tutorial

        Object(CGPoint(x: 1570, y: 422), CGSize(width: 105.0, height: 105.0), .none, 1, "", false, page12, false), // tutorial
        Object(CGPoint(x: 1595, y: 422), CGSize(width: 105.0, height: 105.0), .none, 1, "", false, page13, false), // tutorial
        Object(CGPoint(x: 1620, y: 400), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        
        Object(CGPoint(x: 1650, y: 422), CGSize(width: 105.0, height: 105.0), .none, 1, "", false, page14, false), // tutorial
    ]),
    Stage(level: 2, startStory: story2, endStory: nil, map: [
        Object(CGPoint(x: -28.833343505859375, y: 308.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -29.833343505859375, y: 200.16665649414062), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -30.166671752929688, y: 421.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 98.83332824707031, y: 384.5), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 95.5, y: 249.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 240.8333282470703, y: 422.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 376.83333333333337, y: 455.5), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 1377.8333282470703, y: 436.5), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 722.4999949137369, y: 139.16665649414062), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 822.4999949137369, y: 154.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 1062.5, y: 296.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1223.1666615804038, y: 239.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 1310.8333333333333, y: 197.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 1392.1666564941406, y: 162.5), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 1457.499994913737, y: 380.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1538.499994913737, y: 329.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 1627.499994913737, y: 186.16665649414062), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 1702.8333231608074, y: 245.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1779.5, y: 305.1666564941406), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 539.8333282470703, y: 409.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 916.8333333333334, y: 172.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 680.8333282470703, y: 450.5), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 684.8333282470703, y: 301.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 997.8333333333335, y: 428.5), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 1098.8333333333335, y: 473.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 1198.1666615804038, y: 497.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 258.5, y: 210.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 489.83333333333326, y: 214.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 852.5, y: 455.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1984.4999898274739, y: 523.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1983.1666615804036, y: 410.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1979.1666615804036, y: 291.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1979.8333333333333, y: 166.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
    ]),
    Stage(level: 3, startStory: story3, endStory: nil, map: [
        Object(CGPoint(x: 1399.499994913737, y: 314.1666564941406), CGSize(width: 105.0, height: 105.0), .none, 4, "rectangle_70_white", true),
        Object(CGPoint(x: 1410.8333282470703, y: 489.5), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: -26.166671752929688, y: 475.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 2007.1666564941406, y: 492.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 2473.8333333333335, y: 475.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 2504.499989827474, y: 161.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 2793.5, y: 141.8333282470703), CGSize(width: 105.0, height: 105.0), .two, 1, "circle_70_red", false),
        Object(CGPoint(x: 1601.8333231608074, y: 145.16665649414062), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 1797.8333231608074, y: 156.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 1184.8333231608071, y: 493.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: -23.833343505859375, y: 314.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -26.5, y: 158.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 851.8333282470703, y: 166.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 1582.5, y: 275.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 1783.5, y: 320.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 335.5, y: 388.5), CGSize(width: 105.0, height: 105.0), .combine, 1, "circle_70_yellow", false),
        Object(CGPoint(x: 506.5, y: 325.1666564941406), CGSize(width: 105.0, height: 105.0), .two, 1, "circle_70_red", false),
        Object(CGPoint(x: 836.1666615804037, y: 299.1666564941406), CGSize(width: 105.0, height: 105.0), .combine, 1, "circle_70_yellow", false),
        Object(CGPoint(x: 1012.4999898274741, y: 493.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 1013.1666666666665, y: 369.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1012.1666666666665, y: 260.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 2123.1666615804033, y: 312.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 2115.4999898274737, y: 201.16665649414062), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 2224.166661580404, y: 225.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 2335.166661580404, y: 250.5), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 2429.8333333333335, y: 302.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 2822.1666666666665, y: 367.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 2596.166661580404, y: 516.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 2716.8333333333335, y: 454.1666564941406), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 3133.166661580404, y: 213.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 3143.499989827474, y: 327.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 3266.499994913737, y: 425.1666564941406), CGSize(width: 105.0, height: 105.0), .one, 4, "rectangle_70_green", true),
        Object(CGPoint(x: 3408.499989827474, y: 503.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 3505.166661580404, y: 471.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 3602.8333333333335, y: 427.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 142.8333282470703, y: 234.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 145.16665649414062, y: 405.5), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 656.499989827474, y: 233.8333282470703), CGSize(width: 105.0, height: 105.0), .none, 4, "rectangle_70_white", true),
        Object(CGPoint(x: 850.8333333333334, y: 437.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1768.8333282470703, y: 453.5), CGSize(width: 105.0, height: 105.0), .none, 4, "rectangle_70_white", true),
        Object(CGPoint(x: 1961.1666666666667, y: 319.5), CGSize(width: 105.0, height: 105.0), .combine, 4, "rectangle_70_yellow", true),
        Object(CGPoint(x: 2218.5, y: 444.1666564941406), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 2594.833323160807, y: 288.1666564941406), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 2679.499994913737, y: 335.1666564941406), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 2962.8333333333335, y: 379.5), CGSize(width: 105.0, height: 105.0), .two, 4, "rectangle_70_red", true),
        Object(CGPoint(x: 3452.1666666666665, y: 351.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3605.833323160807, y: 250.16665649414062), CGSize(width: 105.0, height: 105.0), .one, 4, "rectangle_70_green", true),
        Object(CGPoint(x: 1251.1666564941406, y: 335.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1425.1666564941406, y: 158.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 1603.499994913737, y: 441.1666564941406), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 327.16666666666663, y: 217.8333282470703), CGSize(width: 105.0, height: 105.0), .combine, 4, "rectangle_70_yellow", true),
        Object(CGPoint(x: 652.1666666666667, y: 427.1666564941406), CGSize(width: 105.0, height: 105.0), .combine, 4, "rectangle_70_yellow", true),
        Object(CGPoint(x: 1009.1666564941406, y: 142.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 1168.1666564941406, y: 207.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 1960.1666615804036, y: 183.5), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 3311.1666564941406, y: 210.8333282470703), CGSize(width: 105.0, height: 105.0), .two, 4, "rectangle_70_red", true),
        Object(CGPoint(x: 3787.1666564941406, y: 168.16665649414062), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3791.1666564941406, y: 276.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3793.8333282470703, y: 392.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3792.8333282470703, y: 513.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
    ]),
    Stage(level: 4, startStory: story4, endStory: nil, map: [
        Object(CGPoint(x: -29.833343505859375, y: 530.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 119.5, y: 202.5), CGSize(width: 75.0, height: 75.0), .two, 6, "triangle_50_red", true),
        Object(CGPoint(x: 266.1666564941406, y: 172.5), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 153.5, y: 504.5), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 509.83332316080737, y: 530.5), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 890.5, y: 419.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 1061.8333333333335, y: 459.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 1238.499989827474, y: 524.5), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 1429.499994913737, y: 462.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 1619.8333333333333, y: 411.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 1805.8333333333333, y: 356.5), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 1935.8333231608074, y: 396.1666564941406), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 2042.1666564941406, y: 445.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 2167.4999949137373, y: 485.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 2297.833323160807, y: 526.1666564941406), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 597.8333282470703, y: 141.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 731.4999949137369, y: 195.5), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 1059.5, y: 184.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 1370.8333282470703, y: 136.5), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 1620.1666564941406, y: 202.5), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 2634.1666564941406, y: 155.5), CGSize(width: 75.0, height: 75.0), .none, 6, "triangle_50_white", true),
        Object(CGPoint(x: 2659.499989827474, y: 373.5), CGSize(width: 75.0, height: 75.0), .none, 6, "triangle_50_white", true),
        Object(CGPoint(x: 3188.8333282470703, y: 260.1666564941406), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 3182.8333282470703, y: 397.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 3363.833323160807, y: 462.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 2213.833333333333, y: 249.8333282470703), CGSize(width: 105.0, height: 105.0), .two, 7, "triangle_70_red", true),
        Object(CGPoint(x: -28.5, y: 269.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -32.5, y: 397.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -26.833343505859375, y: 134.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 297.499989827474, y: 312.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 3179.1666666666665, y: 517.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3182.833323160807, y: 145.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 134.16665649414062, y: 340.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 6, "triangle_50_yellow", true),
        Object(CGPoint(x: 493.1666564941406, y: 325.8333282470703), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 431.1666564941406, y: 168.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 6, "triangle_50_red", true),
        Object(CGPoint(x: 350.16666666666663, y: 480.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 6, "triangle_50_white", true),
        Object(CGPoint(x: 1240.499994913737, y: 298.5), CGSize(width: 105.0, height: 105.0), .none, 7, "triangle_70_white", true),
        Object(CGPoint(x: 1812.8333282470703, y: 169.5), CGSize(width: 75.0, height: 75.0), .none, 6, "triangle_50_white", true),
        Object(CGPoint(x: 2484.499994913737, y: 457.8333282470703), CGSize(width: 105.0, height: 105.0), .combine, 4, "rectangle_70_yellow", true),
        Object(CGPoint(x: 2410.1666564941406, y: 221.8333282470703), CGSize(width: 105.0, height: 105.0), .combine, 4, "rectangle_70_yellow", true),
        Object(CGPoint(x: 2806.833323160807, y: 479.1666564941406), CGSize(width: 105.0, height: 105.0), .combine, 7, "triangle_70_yellow", true),
        Object(CGPoint(x: 2865.499989827474, y: 215.5), CGSize(width: 105.0, height: 105.0), .one, 7, "triangle_70_green", true),
        Object(CGPoint(x: 3587.1666564941406, y: 265.5), CGSize(width: 75.0, height: 75.0), .one, 6, "triangle_50_green", true),
        Object(CGPoint(x: 692.5, y: 437.5), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 886.8333282470703, y: 245.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1994.1666615804036, y: 230.16665649414062), CGSize(width: 105.0, height: 105.0), .combine, 7, "triangle_70_yellow", true),
        Object(CGPoint(x: 2995.5, y: 349.1666564941406), CGSize(width: 105.0, height: 105.0), .none, 7, "triangle_70_white", true),
        Object(CGPoint(x: 3370.1666666666665, y: 280.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3591.499994913737, y: 446.5), CGSize(width: 75.0, height: 75.0), .combine, 6, "triangle_50_yellow", true),
        Object(CGPoint(x: 3740.499989827474, y: 145.16665649414062), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3743.8333333333335, y: 262.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3749.166661580404, y: 391.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3749.166661580404, y: 508.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3042.499989827474, y: 210.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1471.8333231608074, y: 263.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
    ]),
    Stage(level: 5, startStory: story5, endStory: nil, map: [
        Object(CGPoint(x: -31.5, y: 369.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -30.5, y: 260.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -32.833343505859375, y: 150.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: -32.16667175292969, y: 477.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 132.8333282470703, y: 424.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 134.8333282470703, y: 199.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 232.83333333333331, y: 458.1666564941406), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 333.83333333333337, y: 490.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 427.1666615804037, y: 516.1666564941406), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 553.499994913737, y: 446.1666564941406), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 672.6049949137371, y: 491.6666564941406), CGSize(width: 62.79, height: 90.0), .two, 9, "diamond_50_red", false),
        Object(CGPoint(x: 796.604989827474, y: 433.0), CGSize(width: 62.79, height: 90.0), .none, 9, "diamond_50_white", false),
        Object(CGPoint(x: 898.9383231608073, y: 393.6666564941406), CGSize(width: 62.79, height: 90.0), .two, 9, "diamond_50_red", false),
        Object(CGPoint(x: 984.604994913737, y: 356.3333282470703), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 220.83333333333331, y: 226.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 6, "triangle_50_white", true),
        Object(CGPoint(x: 306.1666615804036, y: 253.5), CGSize(width: 75.0, height: 75.0), .two, 6, "triangle_50_red", true),
        Object(CGPoint(x: 386.499994913737, y: 283.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 6, "triangle_50_yellow", true),
        Object(CGPoint(x: 470.83333333333337, y: 312.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 6, "triangle_50_green", true),
        Object(CGPoint(x: 608.1666615804036, y: 310.1666564941406), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 729.8333231608074, y: 229.16665649414062), CGSize(width: 105.0, height: 105.0), .two, 1, "circle_70_red", false),
        Object(CGPoint(x: 842.1666666666666, y: 157.5), CGSize(width: 105.0, height: 105.0), .combine, 1, "circle_70_yellow", false),
        Object(CGPoint(x: 544.2716564941406, y: 152.0), CGSize(width: 62.79, height: 90.0), .none, 9, "diamond_50_white", false),
        Object(CGPoint(x: 1251.8333282470703, y: 213.5), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 1345.8333231608074, y: 182.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1547.1666564941406, y: 517.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 1645.9383231608074, y: 537.6666564941406), CGSize(width: 62.79, height: 90.0), .combine, 9, "diamond_50_yellow", false),
        Object(CGPoint(x: 1729.9383282470703, y: 480.6666564941406), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 1810.604994913737, y: 435.6666564941406), CGSize(width: 62.79, height: 90.0), .none, 9, "diamond_50_white", false),
        Object(CGPoint(x: 1880.604994913737, y: 398.3333282470703), CGSize(width: 62.79, height: 90.0), .two, 9, "diamond_50_red", false),
        Object(CGPoint(x: 1432.5, y: 411.1666564941406), CGSize(width: 105.0, height: 105.0), .two, 1, "circle_70_red", false),
        Object(CGPoint(x: 1060.1666615804038, y: 234.16665649414062), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 1968.1666666666667, y: 168.8333282470703), CGSize(width: 105.0, height: 105.0), .none, 7, "triangle_70_white", true),
        Object(CGPoint(x: 2173.8333231608076, y: 205.8333282470703), CGSize(width: 105.0, height: 105.0), .two, 7, "triangle_70_red", true),
        Object(CGPoint(x: 2287.4999949137373, y: 263.5), CGSize(width: 105.0, height: 105.0), .one, 7, "triangle_70_green", true),
        Object(CGPoint(x: 2398.166661580404, y: 314.1666564941406), CGSize(width: 105.0, height: 105.0), .two, 7, "triangle_70_red", true),
        Object(CGPoint(x: 2033.8333282470703, y: 471.8333282470703), CGSize(width: 105.0, height: 105.0), .combine, 4, "rectangle_70_yellow", true),
        Object(CGPoint(x: 2198.1666615804033, y: 492.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 2308.1666564941406, y: 486.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 2393.1666666666665, y: 510.5), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 2482.833323160807, y: 537.5), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 2576.8333333333335, y: 546.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 2636.5, y: 233.5), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 2841.1666666666665, y: 336.5), CGSize(width: 75.0, height: 75.0), .none, 6, "triangle_50_white", true),
        Object(CGPoint(x: 2916.8333333333335, y: 368.5), CGSize(width: 75.0, height: 75.0), .combine, 6, "triangle_50_yellow", true),
        Object(CGPoint(x: 3081.8333282470703, y: 508.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 6, "triangle_50_green", true),
        Object(CGPoint(x: 3162.1666666666665, y: 546.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 6, "triangle_50_white", true),
        Object(CGPoint(x: 3270.604994913737, y: 261.0), CGSize(width: 62.79, height: 90.0), .none, 9, "diamond_50_white", false),
        Object(CGPoint(x: 3338.604989827474, y: 311.6666564941406), CGSize(width: 62.79, height: 90.0), .two, 9, "diamond_50_red", false),
        Object(CGPoint(x: 3469.499994913737, y: 520.5), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 3563.833323160807, y: 442.8333282470703), CGSize(width: 105.0, height: 105.0), .one, 1, "circle_70_green", false),
        Object(CGPoint(x: 3794.1666564941406, y: 171.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3797.1666564941406, y: 264.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3792.5, y: 357.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 3794.5, y: 456.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
    ]),
    Stage(level: 6, startStory: story6, endStory: story7, map: [
        Object(CGPoint(x: 74.5, y: 501.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 64.16665649414062, y: 146.5), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 157.5, y: 423.5), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 270.8333333333333, y: 495.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 6, "triangle_50_green", true),
        Object(CGPoint(x: 272.8333333333333, y: 136.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 6, "triangle_50_green", true),
        Object(CGPoint(x: 264.2716666666667, y: 320.3333282470703), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 383.5, y: 393.8333282470703), CGSize(width: 105.0, height: 105.0), .two, 4, "rectangle_70_red", true),
        Object(CGPoint(x: 161.16665649414062, y: 225.16665649414062), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 391.49998982747394, y: 217.16665649414062), CGSize(width: 105.0, height: 105.0), .combine, 1, "circle_70_yellow", false),
        Object(CGPoint(x: 626.1666615804036, y: 331.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 755.499989827474, y: 451.1666564941406), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 870.1666564941406, y: 517.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 1012.1666564941406, y: 491.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 1162.1666666666665, y: 453.1666564941406), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 1297.8333333333333, y: 409.5), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 1504.6666564941406, y: 270.0), CGSize(width: 150.0, height: 150.0), .combine, 8, "triangle_100_yellow", true),
        Object(CGPoint(x: 1484.604989827474, y: 518.3333282470703), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 1748.1666564941406, y: 450.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1854.1666615804036, y: 396.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 1979.8333282470703, y: 344.1666564941406), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 2089.833333333333, y: 289.1666564941406), CGSize(width: 75.0, height: 75.0), .combine, 0, "circle_50_yellow", false),
        Object(CGPoint(x: 2169.8333282470703, y: 511.1666564941406), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 2466.8333333333335, y: 432.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 2779.5, y: 539.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 6, "triangle_50_red", true),
        Object(CGPoint(x: 3486.1666564941406, y: 435.1666564941406), CGSize(width: 105.0, height: 105.0), .two, 4, "rectangle_70_red", true),
        Object(CGPoint(x: 3659.5, y: 545.8333282470703), CGSize(width: 75.0, height: 75.0), .combine, 6, "triangle_50_yellow", true),
        Object(CGPoint(x: 3829.605, y: 446.3333282470703), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 628.8333231608074, y: 181.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 748.1666666666666, y: 134.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 872.499989827474, y: 184.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 993.1666666666665, y: 132.8333282470703), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1267.499994913737, y: 133.16665649414062), CGSize(width: 75.0, height: 75.0), .none, 0, "circle_50_white", false),
        Object(CGPoint(x: 1383.5, y: 166.5), CGSize(width: 105.0, height: 105.0), .two, 1, "circle_70_red", false),
        Object(CGPoint(x: 1564.1666615804036, y: 143.16665649414062), CGSize(width: 75.0, height: 75.0), .none, 3, "rectangle_50_white", true),
        Object(CGPoint(x: 1652.8333231608074, y: 182.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 3, "rectangle_50_red", true),
        Object(CGPoint(x: 1742.8333333333333, y: 218.16665649414062), CGSize(width: 75.0, height: 75.0), .combine, 3, "rectangle_50_yellow", true),
        Object(CGPoint(x: 1835.1666666666667, y: 253.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 2100.8333282470703, y: 147.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 6, "triangle_50_red", true),
        Object(CGPoint(x: 2487.604989827474, y: 161.3333282470703), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 2560.604989827474, y: 176.66665649414062), CGSize(width: 62.79, height: 90.0), .two, 9, "diamond_50_red", false),
        Object(CGPoint(x: 2635.938323160807, y: 197.0), CGSize(width: 62.79, height: 90.0), .combine, 9, "diamond_50_yellow", false),
        Object(CGPoint(x: 2707.604989827474, y: 207.3333282470703), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 3627.8333282470703, y: 171.16665649414062), CGSize(width: 75.0, height: 75.0), .one, 3, "rectangle_50_green", true),
        Object(CGPoint(x: 1099.2099898274741, y: 202.0), CGSize(width: 125.58, height: 180.0), .combine, 11, "diamond_100_yellow", false),
        Object(CGPoint(x: 1852.1666564941406, y: 132.8333282470703), CGSize(width: 105.0, height: 105.0), .none, 4, "rectangle_70_white", true),
        Object(CGPoint(x: 2399.045, y: 154.0), CGSize(width: 87.91, height: 126.0), .none, 10, "diamond_70_white", false),
        Object(CGPoint(x: 3466.833323160807, y: 159.16665649414062), CGSize(width: 105.0, height: 105.0), .none, 1, "circle_70_white", false),
        Object(CGPoint(x: 3823.8333282470703, y: 152.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: 2650.8333333333335, y: 369.5), CGSize(width: 75.0, height: 75.0), .combine, 6, "triangle_50_yellow", true),
        Object(CGPoint(x: 2572.499989827474, y: 393.1666564941406), CGSize(width: 75.0, height: 75.0), .two, 6, "triangle_50_red", true),
        Object(CGPoint(x: 2730.499989827474, y: 341.1666564941406), CGSize(width: 75.0, height: 75.0), .one, 6, "triangle_50_green", true),
        Object(CGPoint(x: 2812.8333333333335, y: 305.8333282470703), CGSize(width: 75.0, height: 75.0), .two, 6, "triangle_50_red", true),
        Object(CGPoint(x: 3198.2716564941406, y: 255.66665649414062), CGSize(width: 62.79, height: 90.0), .one, 9, "diamond_50_green", false),
        Object(CGPoint(x: 3273.605, y: 335.0), CGSize(width: 62.79, height: 90.0), .two, 9, "diamond_50_red", false),
        Object(CGPoint(x: -25.833343505859375, y: 251.16665649414062), CGSize(width: 75.0, height: 75.0), .two, 0, "circle_50_red", false),
        Object(CGPoint(x: -24.833343505859375, y: 387.8333282470703), CGSize(width: 75.0, height: 75.0), .one, 0, "circle_50_green", false),
        Object(CGPoint(x: 2987.6666564941406, y: 192.66665649414062), CGSize(width: 150.0, height: 150.0), .none, 2, "circle_100_white", false),
    ])
]

struct Stage {
    let level: Int
    let startStory: Story
    let endStory: Story?
    let map: [ObstacleProtocol]
    // 속도 등...
    //    let speed: CGFloat
    //    let ...
}

enum ImageEffect {
    case cut
    case fadeIn
    case fadeOut
    case blink
}

struct Story {
    let image: [String]
    let imageEffect: [ImageEffect]
    let character: [String]
    let text: [String]
    let music: Music
}

let story1 = Story(
    image: ["1_1", "1_2", "1_2", "1_2", "1_2",
            "1_3",
            "1_5", "1_6",
            "1_7", "1_8",
            "1_9", "1_9", "1_10", "1_10", "1_10",
            "1_11", "1_11", "1_11", "1_11"],
    imageEffect: [.cut, .fadeIn, .cut, .cut, .cut,
                  .blink,
                  .fadeIn, .fadeIn,
                  .fadeOut, .cut,
                  .fadeIn, .cut, .fadeIn, .cut, .cut,
                  .cut, .cut, .cut, .cut],
    character: ["System", "A", "B", "A", "B",
                "System",
                "B", "A",
                "B", "System",
                "A", "B", "A,B", "B", "A",
                "B", "A", "B", "A"],
    text: [
        // 19줄
        "명왕성 궤도로 진입합니다.",
        "(구웨엑..) 이런 고물 비행선을 주고 탐색 임무라니..",
        "그거 아세요? 기록에 따르면 예전에는 여기부터가 태양계였다고 하네요.",
        "예전보다 더 ‘예전’에 말이야? 그런 기록이 의미 있을 리가 없잖아.",
        "그래도 이게 우리가 가진 전부니까요.",
        
        "(삐비빅 삐비빅) 생명신호 감지 생명신호감지",
        
        "어? 명왕성에서 약하지만 생체신호가 잡히기 시작했어요!",
        "그럴리가.. 농담하는 거지? 하하하",
        
        "매뉴얼대로 명왕성 착륙을 진행할게요. 첫 착륙엔 행운이 따랐으면 좋겠는데.",
        "플루토 착륙을 시도합니다.",
        
        "어? 저거 아니야?",
        "점점 신호가 강해지고 있는 걸 보니 확실하네요.",
        "...",
        "생각보다 탐험이 길어질 수도 있겠네요.",
        "그러게.. 추가수당은 주려나 모르겠네",
        
        "우선은 가장 가까운 혜왕성으로 접근해볼까요?",
        "우선은..?",
        "네 우선은요..",
        "그래.."
    ],
    music: Music.Story1
)

let story2 = Story(
    image: ["2_1", "2_1"],
    imageEffect: [.fadeIn, .cut],
    character: ["A의 일지", "A의 일지"],
    text: ["해왕성을 샅샅이 뒤져봤지만 살아있는 캡슐은 코빼기도 비치지 않음.",
           "‘진짜’ 태양계 행성치고는 별 볼 일 없음."],
    music: Music.Story1
)

let story3 = Story(
    image: ["3_1", "3_1"],
    imageEffect: [.cut, .cut],
    character: ["B의 일지", "B의 일지"],
    text: ["거대한 가스 행성인 천왕성에서는 그 하루도 쉽게 살아남기 힘들 것으로 보이네요.",
           "뭐 다른 곳이라고 크게 다른것도 아니지만요"],
    music: Music.Story1
)

let story4 = Story(
    image: ["4_1", "4_1", "4_1", "4_1"],
    imageEffect: [.cut, .cut, .cut, .cut],
    character: ["A의 일지", "A의 일지", "A의 일지", "A의 일지"],
    text: ["거의 모든 캡슐이 중력을 못 견디고 찌그러진 것으로 관측됨.",
           "아, 딱 하나 빼고. 캡슐이 있던 자리가 하나 비어있던데,",
           "우리로서는 하늘로 날아갔는지 땅으로 꺼졌는지 알 수 없음.",
           "살아있으려나?"],
    music: Music.Story1
)

let story5 = Story(
    image: ["5_1", "5_1", "5_1", "5_1"],
    imageEffect: [.cut, .cut, .cut, .cut],
    character: ["B의 일지", "B의 일지", "B의 일지", "B의 일지"],
    text: ["목성에 설치된 캡슐은 고온과 방사능에 노출되어 예상대로 생명신호가 설치 직후 모두 끊겼더군요.",
           "태양계 행성의 캡슐들이 번번이 파괴된 걸 보면,\n명왕성에서 C-001을 발견한 것은 기적이라고 할 수 있겠네요.",
           "지금까지는 C-001이라고 불러왔지만, 실무자들의 판단 아래 플루토라는 식별명을 부여하기로 했습니다.",
           "지금은 작은 캡슐 속에 잠들어 있지만 어쨌든 하나의 생명이니까요."],
    music: Music.Story1
)

let story6 = Story(
    image: ["6_1", "6_1", "6_1", "6_2"],
    imageEffect: [.fadeIn, .cut, .cut, .fadeIn],
    character: ["A의 일지", "A의 일지", "A의 일지", "A의 일지"],
    text: [
        "지구와 가장 비슷한 행성이라더니 순 거짓말인 게 분명함.",
        "대부분의 캡슐은 모래 폭풍에 휩쓸려 갔고, 그나마 남아있는 것들도 죄다 부서져있는데 이런 환경에서 인간이 살 수 있을리 없음.",
        "예전의 인간들은 얼마나 멍청했던 건지 가늠할 수가…(중략)",
        "플루토는 예정대로 지구로 이동 예정."
    ],
    music: Music.Story1
)

let story7 = Story(
    image: ["7_1", "7_1", "7_1", "7_1", "7_1", "7_1", "7_1", "7_2"],
    imageEffect: [.cut, .cut, .cut, .cut, .cut, .cut, .cut, .fadeOut],
    character: ["A", "B", "A", "B", "A", "B", "A", ""],
    text: ["토성에서 자국으로만 보았던 캡슐이 여기에 있었군...",
           "그러게요. 우리가 첫 탐험대는 아니였나보네요.",
           "그나저나 이 행성 아름답네",
           "정말.. 정말로요..",
           "우리 임무는 여기까진가..?",
           "네 이제부턴 이 아이들의 몫이에요. 믿고 기다려보죠",
           "시원한 맥주가 그립군..",
           ""],
    music: Music.Story1
)



