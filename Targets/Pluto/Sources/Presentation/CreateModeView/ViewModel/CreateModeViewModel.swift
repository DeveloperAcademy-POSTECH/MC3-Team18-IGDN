//
//  CreateModeViewModel.swift
//  Pluto
//
//  Created by 홍승완 on 2023/07/10.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit
import Combine


final class CreateModeViewModel {
    enum Input {
        case createMapButtonDidTap
        case playButtonDidTap(indexPath: IndexPath)
        case editButtonDidTap(indexPath: IndexPath)
        case deleteButtonDidTap(indexPath: IndexPath)
        case cellDidTap
    }
    
    enum Output {
        case presentCreateMapView
        case reload
        case playButtonDidTapOutput(objects: [Object])
        case editButtonDidTapOutput(indexPath: IndexPath)
        case deleteButtonDidTapOutput(indexPath: IndexPath)
    }
    
    private let output = PassthroughSubject<Output, Never>()
    private var subscriptions = Set<AnyCancellable>()

    var mapList: [CreativeMapModel]
    var objectList: [CreativeObject] = []
    var transferingObjects: [Object] = []
    init(mapList: [CreativeMapModel]? = nil) {
        self.mapList = mapList ?? []
    }
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input.sink { [weak self] event in
            switch event {
            case .createMapButtonDidTap:
                self?.output.send(.presentCreateMapView)
            case .playButtonDidTap(let indexPath):
                if let objects = self?.mapList[indexPath.row].objectList {
                    if let transferObjects = self?.convertToObject(with: objects) {
                        self?.output.send(.playButtonDidTapOutput(objects: transferObjects))
                    }
                }
            case .editButtonDidTap(let indexPath):
                self?.output.send(.editButtonDidTapOutput(indexPath: indexPath))
            case .deleteButtonDidTap(indexPath: let indexPath):
                self?.mapList.remove(at: indexPath.row)
                if let mapList = self?.mapList {
                    UserDefaultsManager.saveCreativeMapsToUserDefaults(mapList)
                }
                self?.output.send(.deleteButtonDidTapOutput(indexPath: indexPath))
            case .cellDidTap:
                self?.output.send(.reload)
            }
        }.store(in: &subscriptions)

        return output.eraseToAnyPublisher()
    }
    
    func bind(with viewModel: CreateMapViewModel) {
        viewModel.creativeMapSubject
            .sink { [weak self] creativeObjectList in
                let (map, isEditng, indexPath) = creativeObjectList
                self?.objectList = map.objectList
                
                // MARK: isEditing이 true
                if isEditng {
                    self?.updateMap(with: map, indexPath: indexPath)
                }
                // MARK: isEditing이 false
                // creativeObjectList를 처리하는 로직을 작성합니다
                else {
                    self?.appendMap(with: map)
                }
                if let mapList = self?.mapList {
                    UserDefaultsManager.saveCreativeMapsToUserDefaults(mapList)
                }
                self?.output.send(.reload)
            }.store(in: &subscriptions)
        
    }
    
    private func appendMap(with map: CreativeMapModel) {
        var newMap = map
        if newMap.titleLabel.count == 0 {
            newMap.titleLabel = "Slot \(mapList.count + 1)"
        }
        mapList.append(newMap)
        objectList.removeAll()
    }
    
    private func updateMap(with map: CreativeMapModel, indexPath: IndexPath) {
        self.mapList[indexPath.row] = CreativeMapModel(titleLabel: self.mapList[indexPath.row].titleLabel, lastEdited: map.lastEdited, objectList: map.objectList, previewId: map.previewId)
        objectList.removeAll()
    }

    private func convertToObject(with creativeObjectList: [CreativeObject]) -> [Object]{
        var objects: [Object] = []
        for object in creativeObjectList {
            let transferingObject = Object(creativeObject: object)
            objects.append(transferingObject)
        }
//        objects.printAll()
        return objects
    }
}
