//
//  GameAlertType.swift
//  Pluto
//
//  Created by changgyo seo on 2023/07/23.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

enum GameAlertType {
    case success
    case fail
    case pause
    case tutorial(activate: [TutorialView.Activate], bottomString: String, topString: String, imageName: String, isLast: Bool)
    
    var backgroundColor: UIColor {
        switch self {
        case .success:
            return UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        case .pause:
            return UIColor(red: 0, green: 0.18, blue: 0.996, alpha: 0.75)
        case .fail:
            return UIColor(red: 0, green: 0.044, blue: 0.242, alpha: 0.85)
        default:
            return .clear
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .success:
            return UIColor(red: 0, green: 0.18, blue: 0.996, alpha: 1)
        case .fail, .pause:
            return .white
        default:
            return .clear
        }
    }
    
    var title: String {
        switch self {
        case .success:
            return "Nice Flight!"
        case .fail:
            return "oh..no"
        case .pause:
            return "paused"
        default:
            return ""
        }
    }
    
    var upButtonTitle: String {
        switch self {
        case .success:
            return "next stage"
        case .fail:
            return "try again"
        case .pause:
            return "resume"
        default:
            return ""
        }
    }
    
    var downButtonTitle: String {
        switch self {
        case .success, .fail:
            return "return to main"
        case .pause:
            return "end game"
        default:
            return ""
        }
    }
    
    var upButtonIcon: UIImage {
        switch self {
        case .success:
            return UIImage(systemName: "arrow.right")!
        case .fail:
            return UIImage(systemName: "arrow.counterclockwise")!
        case .pause, .tutorial:
            return UIImage()
            
        }
    }
    
    var titleImage: UIImage {
        switch self {
        case .success:
            return UIImage(named: SettingData.shared.selectedTheme.successAlertImage)!
        case .fail:
            return UIImage(named: "FailImage")!
        case .pause:
            return UIImage(named: "PauseImage")!
        default:
            return UIImage()
        }
    }
    
    var hasStroke: Bool {
        switch self {
        case .success:
            return true
        case .fail, .pause:
            return false
        default:
            return false
        }
    }
}

let tutorialPages = [page0, page1, page2, page3, page4, page5, page6, page7, page8, page9, page10, page11, page12]

let page0 = [
    GameAlertType.tutorial(activate: [], bottomString: "지금부터 우주여행의 규칙을 설명해줄게.", topString: "지금부터 우주여행의 규칙을 설명해줄게.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "우선 주인공이 벽에 부딪치면 게임이 종료되니 주의해줘.", topString: "우선 주인공이 벽에 부딪치면 게임이 종료되니 주의해줘.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "벽에 부딪치지 않고 목적지에 도달하려면 여러 소행성의 궤도를 타면서 앞으로 나아가야 해.", topString: "벽에 부딪치지 않고 목적지에 도달하려면 여러 소행성의 궤도를 타면서 앞으로 나아가야 해.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "소행성의 궤도에 올라타려면 주인공의 색이 소행성의 색과 같아야 해.", topString: "소행성의 궤도에 올라타려면 주인공의 색이 소행성의 색과 같아야 해.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [.changeGreen, .changeRed], bottomString: "이 버튼을 누르면 주인공의 색을 초록색으로 바꿀 수 있어!", topString: "이 버튼을 누르면 주인공의 색을 빨간색으로 바꿀 수 있어!", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "그런데 노란색 소행성이 나오면 어떻게 해야 할까?", topString: "그런데 노란색 소행성이 나오면 어떻게 해야 할까?", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "두 사람이 협동해서 같이 버튼을 누르면 주인공은 노란색이 될거야", topString: "두 사람이 같이 버튼을 누르게 되면 주인공은 노란색이 될거야", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [TutorialView.Activate.turnClockWise, TutorialView.Activate.turnCounterClockWise], bottomString: "왼쪽에 있는 이 버튼은 thrust 버튼이야.", topString: "왼쪽에 있는 이 버튼은 thrust 버튼이야.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "이 버튼을 누르면 주인공의 방향을 전환할 수 있어.", topString: "이 버튼을 누르면 주인공의 방향을 전환할 수 있어.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "이 thrust 버튼은 연료가 닳기 때문에 아껴 써야해~", topString: "이 thrust 버튼은 연료가 닳기 때문에 아껴 써야해~", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "버튼에 있는 게이지를 보면 연료가 얼마나 남았는지 확인할 수 있어.", topString: "버튼에 있는 게이지를 보면 연료가 얼마나 남았는지 확인할 수 있어.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "대신 소행성에 탑승한 동안에는 연료가 충전되니까 참고해!", topString: "대신 소행성에 탑승한 동안에는 연료가 충전되니까 참고해!", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "게임을 잠깐 중단하고 싶은 경우에는", topString: "게임을 잠깐 중단하고 싶은 경우에는", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [.pauseButton], bottomString: "이 버튼을 누르면 일시정지 할 수 있어.", topString: "이 버튼을 누르면 일시정지 할 수 있어.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "흰색인 상태로 소행성 궤도에 닿으면 어떻게 되는지 볼까?", topString: "흰색인 상태로 소행성 궤도에 닿으면 어떻게 되는지 볼까?", imageName: "circle_70_white", isLast: true)
]


// 주인공이 흰색 소행성에 올라탐

let page1 = [
    GameAlertType.tutorial(activate: [], bottomString: "성공! 안전하게 궤도에 올라탔어!", topString: "성공! 안전하게 궤도에 올라탔어!", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "방금 같은 색의 소행성에 닿으면 궤도에 탈 수 있다고 했지?", topString: "방금 같은 색의 소행성에 닿으면 궤도에 탈 수 있다고 했지?", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "색을 바꾸면 소행성의 궤도에서 벗어날 수 있어.", topString: "색을 바꾸면 소행성의 궤도에서 벗어날 수 있어.", imageName: "", isLast: true)
]

// 초록색 소행성이 다가옴

let page2 = [
    GameAlertType.tutorial(activate: [TutorialView.Activate.changeGreen], bottomString: "그럼 지금 초록 버튼을 눌러볼까?", topString: "", imageName: "circle_70_green", isLast: true)
]

// 초록색 소행성에 올라탐

let page3 = [
    GameAlertType.tutorial(activate: [], bottomString: "잘했어!", topString: "", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "다시 흰색 소행성 궤도에 타기 위해서, 초록 버튼을 눌러서 색을 원상태로 돌려보자.", topString: "", imageName: "", isLast: true),
]

// 흰색 소행성이 다가옴

let page4 = [
    GameAlertType.tutorial(activate: [TutorialView.Activate.changeGreen], bottomString: "지금 초록 버튼을 눌러봐!", topString: "", imageName: "circle_70_white", isLast: true)
]

// 흰색 소행성에 올라탐

let page5 = [
    GameAlertType.tutorial(activate: [], bottomString: "좋았어!", topString: "", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "", topString: "이번엔 네 차례야.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "", topString: "같은 색의 소행성에 닿으면 궤도에 탈 수 있어.", imageName: "", isLast: true),
]

// 빨간 소행성이 날라옴

let page6 = [
    GameAlertType.tutorial(activate: [TutorialView.Activate.changeRed], bottomString: "", topString: "지금 빨간 버튼을 눌러볼까?", imageName: "circle_70_red", isLast: true)
]

// 빨간 소행성에 올라탐

let page7 = [
    GameAlertType.tutorial(activate: [], bottomString: "", topString: "정말 잘하는데?", imageName: "", isLast: true)
]

// 흰색 소행성이 다가옴

let page8 = [
    GameAlertType.tutorial(activate: [TutorialView.Activate.changeRed], bottomString: "", topString: "다시 흰색 소행성 궤도에 타기 위해서, 빨간 버튼을 눌러서 색을 원상태로 돌려봐.", imageName: "circle_70_white", isLast: true)
]

// 흰색 소행성에 올라탐

let page9 = [
    GameAlertType.tutorial(activate: [], bottomString: "", topString: "최고야!", imageName: "", isLast: true)
]

// 노란색 소행성이 다가옴

let page10 = [
    GameAlertType.tutorial(activate: [], bottomString: "이번엔 노란색 소행성이 나타났어!", topString: "이번엔 노란색 소행성이 나타났어!", imageName: "circle_70_yellow", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "이번엔 둘이 힘을 합쳐야만 해.", topString: "이번엔 둘이 힘을 합쳐야만 해.", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [TutorialView.Activate.changeGreen, TutorialView.Activate.changeRed], bottomString: "둘이 동시에 버튼을 눌러서 주인공을 노란색으로 만들어봐.", topString: "둘이 동시에 버튼을 눌러서 주인공을 노란색으로 만들어봐.", imageName: "circle_70_yellow", isLast: true)
]

// 노란색 소행성에 올라탐

let page11 = [
    GameAlertType.tutorial(activate: [], bottomString: "정말 잘했어! 환상의 호흡이군!", topString: "정말 잘했어! 환상의 호흡이군!", imageName: "", isLast: true)
]

// 흰색 소행성이 다가옴

let page12 = [
    GameAlertType.tutorial(activate: [], bottomString: "이제 마지막 목적지를 향해 나아가볼까?", topString: "이제 마지막 목적지를 향해 나아가볼까?", imageName: "circle_70_white", isLast: false),
    GameAlertType.tutorial(activate: [TutorialView.Activate.changeGreen, TutorialView.Activate.changeRed], bottomString: "둘 다 색을 빼서 주인공을 흰색으로 만들어보자!", topString: "둘 다 색을 빼서 주인공을 흰색으로 만들어보자!", imageName: "circle_70_white", isLast: true),
]

let page13 = [
        GameAlertType.tutorial(activate: [], bottomString: "이 방향으로 가면 소행성에 닿을 수 없을 것 같은데?", topString: "이 방향으로 가면 소행성에 닿을 수 없을 것 같은데?", imageName: "circle_70_white", isLast: false),
        GameAlertType.tutorial(activate: [], bottomString: "이럴 때는 어떻게 해야할까?", topString: "이럴 때는 어떻게 해야할까?", imageName: "circle_70_white", isLast: false),
        GameAlertType.tutorial(activate: [TutorialView.Activate.turnClockWise, TutorialView.Activate.turnCounterClockWise], bottomString: "여기 thrust 라는 기능이 있어.", topString: "여기 thrust 라는 기능이 있어.", imageName: "circle_70_white", isLast: false),
        GameAlertType.tutorial(activate: [], bottomString: "이걸 누르면 진행 방향을 바꿀 수 있어.", topString: "이걸 누르면 진행 방향을 바꿀 수 있어.", imageName: "circle_70_white", isLast: false),
        GameAlertType.tutorial(activate: [], bottomString: "지금 thrust 버튼을 눌러서 소행성 쪽으로 이동해볼까?", topString: "", imageName: "circle_70_white", isLast: true)
]

// 일부러 약간 각도가 틀어지는 타이밍에 지시한다.

let page14 = [
    GameAlertType.tutorial(activate: [], bottomString: "우리가 목표하는 행성에 곧 도착하려고해!", topString: "우리가 목표하는 행성에 곧 도착하려고해!", imageName: "", isLast: false),
    GameAlertType.tutorial(activate: [], bottomString: "행성이 보이면 궤도를 이탈해서 목표 행성에 도달해보자!", topString: "행성이 보이면 궤도를 이탈해서 목표 행성에 도달해보자", imageName: "", isLast: true),
]
