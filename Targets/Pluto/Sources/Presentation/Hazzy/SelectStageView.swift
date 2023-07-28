//
//  SelectStageView.swift
//  MC3_Hazzy
//
//  Created by 고혜지 on 2023/07/07.
//

import SwiftUI

struct SelectStageView: View {
    @EnvironmentObject var router: Router<Path>
    @State var currentStage = GameData.shared.currentStage
    @State var selectedStage = GameData.shared.currentStage

    var body: some View {
        VStack(spacing: -10) {
            NavigationBar()
                .padding(.bottom, 30)
            
            CardView(selectedStage: $selectedStage)
                .frame(width: 450, height: 600)
                .padding(.bottom)

            PlayButton(currentStage: $currentStage, selectedStage: $selectedStage)
                .padding(.bottom, 50)
        }
        .padding(.top, 30)
        .foregroundColor(SettingData.shared.selectedTheme.main)
    }

    var stageImage: some View {
        Image("Stage")
            .resizable()
            .frame(width: 300)
            .padding(.horizontal)
    }
}

struct NavigationBar: View {
    @EnvironmentObject var router: Router<Path>
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text("journey")
                    .font(.custom(tasaExplorerBlack, size: 32))
                Spacer()
            }
            
            HStack {
                Button {
                    router.pop()
                } label: {
                    Image("arrow")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 20)
                }
                .padding(.leading, 40)
                Spacer()
            }
        }
    }
}

struct PlayButton: View {
    @EnvironmentObject var router: Router<Path>
    @Binding var currentStage: Int
    @Binding var selectedStage: Int
    @State var isAnimating: Bool = false
    
    var body: some View {
        Button {
            if (currentStage >= selectedStage) {
                if stages[selectedStage].startStory != nil {
                    router.push(.Story)
                    GameData.shared.selectedStage = selectedStage
                } else {
                    // MARK: 여기서 게임 진입! (스토리X)
                    SoundManager.shared.playBackgroundMusic(allMusicCases[selectedStage])
                    SoundManager.shared.playAmbience(allAmbienceCases[selectedStage])
                    GameData.shared.selectedStage = selectedStage
                    AppDelegate.vc?.pushViewController(GameViewController(gameConstants: GameConstants(), map: stages[selectedStage].path), animated: false)
                    
                }
            } else {
                isAnimating.toggle()
                hapticFeedback(style: .soft, duration: 0.5, interval: 0.1)
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    
                if selectedStage <= currentStage {
                    Text("play")
                        .font(.custom(tasaExplorerBold, size: 20))
                        .foregroundColor(.white)
                    HStack {
                        Spacer()
                        Image("chevron")
                            .resizable()
                            .frame(width: 5.66, height: 13)
                            .padding()
                    }
                } else {
                    HStack {
                        Text("Locked")
                            .font(.custom(tasaExplorerBold, size: 20))
                        Image(systemName: "lock.fill")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .offset(x: isAnimating ? 5 : 0)
                            .animation(Animation.easeInOut(duration: 0.1).repeatCount(5), value: isAnimating)
                    }
                    .foregroundColor(SettingData.shared.selectedTheme.mainLight)
                }
            }
            .frame(width: 200, height: 45)
        }
        .foregroundColor(selectedStage > currentStage ? SettingData.shared.selectedTheme.lockedMain : SettingData.shared.selectedTheme.main)
    }
}
        
struct CardView: View {
    @Binding var selectedStage: Int
    @State private var offset = CGFloat.zero
    let spacing: CGFloat = 15
    let images = [Image("Stage"), Image("Stage"), Image("Stage"), Image("Stage"), Image("Stage"), Image("Stage")]
    var viewCount: Int { images.count }

    var body: some View {
        VStack(spacing: spacing) {
            GeometryReader { geo in
                let width = geo.size.width * 0.7
                
                LazyHStack(spacing: spacing) {
                    Color.clear
                        .frame(width: geo.size.width * 0.15 - spacing)
                    ForEach(0..<viewCount, id: \.self) { index in
                        images[index]
                            .frame(width: width)
                            .opacity(index == selectedStage ? 1.0 : 0.3)
                   }
                }
                .offset(x: CGFloat(-selectedStage) * (width + spacing) + offset)
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged { value in
                            offset = value.translation.width
                        }
                        .onEnded { value in
                            withAnimation(.easeOut) {
                                offset = value.predictedEndTranslation.width
                                if offset < 0 && selectedStage < viewCount - 1 {
                                    selectedStage += 1
                                } else if offset > 0  && selectedStage > 0 {
                                    selectedStage -= 1
                                }
                                offset = 0
                            }
                        }
                )
            }
        }
    }
}

struct SelectStageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectStageView()
    }
}
