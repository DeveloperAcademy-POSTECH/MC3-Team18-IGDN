//
//  CreateMapView.swift
//  Pluto
//
//  Created by 홍승완 on 2023/07/11.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

final class CreateMapView: UIView {
    
    lazy var topToolView = CreateMapTopToolView()
    lazy var bottomToolView = CreateMapBottomToolView()
    
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    let gridSize: CGFloat = 20.0
    let gridContainerView = UIView()
    var isGridDrawn = false // 그리드가 이미 그려졌는지 확인하기 위한 플래그
    
    init() {
        super.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        width = (self.bounds.width - 16 * 2) / 3
        height = width / 116 * 120
        
        addSubviews()
        setUpConstraints()
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            // 그리드가 이미 그려진 경우 다시 그리지 않음
            guard !isGridDrawn else {
                return
            }
            
            drawGrid()
            isGridDrawn = true
        }

       
    
    private func addSubviews() {
        [scrollView, topToolView, bottomToolView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    private func setUpConstraints() {
        
        // MARK: safeAreaHight = 54
        // MARK: ToolViewHeight = 116 -> (bound.width - 16*2)/120*116
        // MARK: 나머지는 mapView 영역
        
        NSLayoutConstraint.activate([
            topToolView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            topToolView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topToolView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topToolView.heightAnchor.constraint(equalToConstant: height),
            
            bottomToolView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            bottomToolView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomToolView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomToolView.heightAnchor.constraint(equalToConstant: height),
            
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 10)
        ])
        
    }
    
    private func drawGrid() {
            gridContainerView.backgroundColor = UIColor.clear // 그리드 컨테이너 뷰의 배경색을 투명하게 설정
            
            // 그리드 컨테이너 뷰의 frame 설정
            gridContainerView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height)
            
            // 가로 선 그리기
            for y in stride(from: 0, to: contentView.bounds.height, by: gridSize) {
                let lineView = UIView()
                lineView.backgroundColor = UIColor(hex: 0x4061F8)
                lineView.frame = CGRect(x: 0, y: y, width: contentView.bounds.width, height: 1)
                gridContainerView.addSubview(lineView)
            }
            
            // 세로 선 그리기
            for x in stride(from: 0, to: contentView.bounds.width, by: gridSize) {
                let lineView = UIView()
                lineView.backgroundColor = UIColor(hex: 0x4061F8)
                lineView.frame = CGRect(x: x, y: 0, width: 1, height: contentView.bounds.height)
                gridContainerView.addSubview(lineView)
            }
            
            // 그리드 컨테이너 뷰를 contentView에 추가
            contentView.addSubview(gridContainerView)
            gridContainerView.translatesAutoresizingMaskIntoConstraints = false
            gridContainerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            gridContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            gridContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            gridContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }

    private func setUpViews() {
        self.backgroundColor = UIColor(hex: 0x002EFE)
        
        topToolView.backgroundColor = .clear
        bottomToolView.backgroundColor = .clear
        
        scrollView.backgroundColor = UIColor(hex: 0x002EFE)
        scrollView.isPagingEnabled = false
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = false // 세로 스크롤 비활성화
        scrollView.alwaysBounceHorizontal = true // 가로 스크롤 활성화
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.contentSize = CGSize(width: bounds.width * 10, height: bounds.height)
        
    }
}
