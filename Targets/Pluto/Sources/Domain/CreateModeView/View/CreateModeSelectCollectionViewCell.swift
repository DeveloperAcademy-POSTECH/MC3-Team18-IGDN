//
//  CreateModeSelectCollectionViewCell.swift
//  Pluto
//
//  Created by 홍승완 on 2023/07/12.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit
import Combine

class CreateModeSelectCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CreateModeSelectCollectionViewCell.self)
    
    
    let input = PassthroughSubject<CreateModeViewModel.Input, Never>()
    var indexPath: IndexPath!
    
    private let CELL_MAX_COUNT: Int = Constants.CELL_MAX_COUNT
    private var textFieldIsActive = false
    public var isDeleteButtonSelected = false
    
    lazy var title = UITextField()
    lazy var dateDescriptionLabel = UILabel()
    lazy var lastEdited = UILabel()
    lazy var editTitleButton = UIButton()
    lazy var solidLine = UIImageView()
    lazy var preview = UIImageView()
    lazy var playButton = UIButton()
    lazy var editButton = UIButton()
    lazy var deleteButton = UIButton()
    
    lazy var imageView = UIImageView()
    lazy var descriptions = UILabel()
    
    // MARK: - Life Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.removeFromSuperview()
        descriptions.removeFromSuperview()
    }
    
    // cell 재사용 문제 해결
    override func prepareForReuse() {
        super.prepareForReuse()
        isDeleteButtonSelected = false
        
        [title,dateDescriptionLabel, lastEdited, editTitleButton, preview, playButton, editButton, imageView, descriptions, solidLine, deleteButton]
            .forEach {
                $0.isHidden = false
            }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        setUpConstraints()
        setUpViews()
    }
    
    private func addSubviews() {
        
        [title,dateDescriptionLabel, lastEdited, editTitleButton, preview, playButton, editButton, imageView, descriptions, solidLine, deleteButton]
            .forEach {
                contentView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
    }
    
    private func setUpConstraints() {
        // MARK: Section 0
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 28),
            imageView.heightAnchor.constraint(equalToConstant: 28),
            
            descriptions.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 11),
            descriptions.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        // MARK: Section 1
        
        title.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22.25),
            
            editTitleButton.centerYAnchor.constraint(equalTo: title.centerYAnchor, constant: -1),
            editTitleButton.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 7),
            editTitleButton.widthAnchor.constraint(equalToConstant: 17),
            editTitleButton.heightAnchor.constraint(equalToConstant: 17),
            
            lastEdited.bottomAnchor.constraint(equalTo: title.bottomAnchor, constant: -2),
            lastEdited.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -21),
            
            dateDescriptionLabel.bottomAnchor.constraint(equalTo: title.bottomAnchor, constant: -2),
            dateDescriptionLabel.trailingAnchor.constraint(equalTo: lastEdited.leadingAnchor, constant: -3),
            dateDescriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: editTitleButton.trailingAnchor, constant: 5),
            
            solidLine.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            solidLine.widthAnchor.constraint(equalToConstant: 266.41),
            solidLine.heightAnchor.constraint(equalToConstant: 2),
            solidLine.topAnchor.constraint(equalTo: title.bottomAnchor),
            
            preview.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            preview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            preview.widthAnchor.constraint(equalToConstant: 140),
            preview.heightAnchor.constraint(equalToConstant: 70),
            
            playButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -19.06),
            playButton.topAnchor.constraint(equalTo: preview.topAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 120),
            playButton.heightAnchor.constraint(equalToConstant: 35),
            
            editButton.leadingAnchor.constraint(equalTo: playButton.leadingAnchor),
            editButton.bottomAnchor.constraint(equalTo: preview.bottomAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 85),
            editButton.heightAnchor.constraint(equalToConstant: 30),
            
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.trailingAnchor.constraint(equalTo: playButton.trailingAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: preview.bottomAnchor),
        ])
    }
    
    private func setUpViews() {
        contentView.layer.cornerRadius = 30
        contentView.backgroundColor = SettingData().selectedTheme.white.uiColor
        
        descriptions.font = UIFont(name: "TASAExplorer-Bold", size: 20)
        
        title.font = UIFont(name: "TASAExplorer-Bold", size: 22)
        
        editTitleButton.setImage(UIImage(named: "pencil")?.withRenderingMode(.alwaysTemplate), for: .normal)
        editTitleButton.tintColor = SettingData().selectedTheme.creative.uiColor
        
        dateDescriptionLabel.text = "last Edited:"
        dateDescriptionLabel.font = UIFont(name: "TASAExplorer-Regular", size: 12)
        dateDescriptionLabel.textColor = SettingData().selectedTheme.mainLight.uiColor
        
        lastEdited.font = UIFont(name: "TASAExplorer-Bold", size: 12)
        lastEdited.textColor = SettingData().selectedTheme.mainLight.uiColor
        
        solidLine.image = UIImage(named: "solid_line")?.withRenderingMode(.alwaysTemplate)
        solidLine.tintColor = SettingData().selectedTheme.mainLight.uiColor
                
        preview.layer.cornerRadius = 5
        preview.clipsToBounds = true
        
        deleteButton.setImage(UIImage(named: "trash"), for: .normal)
        deleteButton.backgroundColor = SettingData().selectedTheme.mainLight.uiColor
        deleteButton.layer.cornerRadius = 5
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "TASAExplorer-Bold", size: 18.0) ?? UIFont.systemFont(ofSize: 18.0)
        ]
        
        let playButtonString = NSAttributedString(string: "play", attributes: attributes)
        playButton.setAttributedTitle(playButtonString, for: .normal)
        playButton.layer.cornerRadius = 5
        playButton.setTitleColor(SettingData().selectedTheme.white.uiColor, for: .normal)
        playButton.layer.borderWidth = 2
        playButton.layer.borderColor = SettingData().selectedTheme.creative.uiColor.cgColor
        playButton.backgroundColor = SettingData().selectedTheme.creative.uiColor
        playButton.setImage(UIImage(named: "chevron_right"), for: .normal)
        playButton.contentHorizontalAlignment = .center
        playButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        playButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        
        let editButtonString = NSAttributedString(string: "edit", attributes: attributes)
        editButton.setAttributedTitle(editButtonString, for: .normal)
        editButton.layer.cornerRadius = 5
        editButton.setTitleColor(SettingData().selectedTheme.creative.uiColor, for: .normal)
        editButton.layer.borderWidth = 2
        editButton.layer.borderColor = SettingData().selectedTheme.creative.uiColor.cgColor
    }
    
    func configure(item: [CreativeMapModel], section: Int, indexPath: IndexPath) {
        self.indexPath = indexPath
        if section == 0 {
            [title,dateDescriptionLabel, lastEdited, editTitleButton, preview, playButton, editButton, solidLine, deleteButton]
                .forEach {
                    $0.isHidden = true
                }
            if item.count < CELL_MAX_COUNT {
                imageView.image = UIImage(named: "creative_plus")?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = SettingData().selectedTheme.mainLight.uiColor
                
                descriptions.textColor = SettingData().selectedTheme.mainLight.uiColor
                descriptions.text = "create your own journey!"
            } else {
                imageView.image = UIImage(named: "creative_xmark")?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = UIColor(hex: 0xAFAFAF)
                
                descriptions.text = "you've reached max slot"
                descriptions.textColor = UIColor(hex: 0xAFAFAF)
            }
            
            
        } else {
            imageView.isHidden = true
            descriptions.isHidden = true
            
            playButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            editButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            deleteButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            title.text = item[indexPath.row].titleLabel
            lastEdited.text = item[indexPath.row].lastEditedString()
            
            if let previewData = UserDefaults.standard.data(forKey: item[indexPath.row].previewId),
               let previewImage = UIImage(data: previewData) {
                preview.image = previewImage
                preview.contentMode = .scaleAspectFit
                preview.backgroundColor = SettingData().selectedTheme.mainLight.uiColor
            }
        }
    }
    
    func configure(isTextFieldEnabled: Bool) {
           if isTextFieldEnabled {
               title.isUserInteractionEnabled = true
               title.becomeFirstResponder()
               textFieldIsActive = true
           } else {
               title.isUserInteractionEnabled = false
               textFieldIsActive = false
           }
       }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        switch sender {
        case playButton:
            animationForButton(sender: sender) {
                self.input.send(.playButtonDidTap(indexPath: self.indexPath))
            }
        case editButton:
            animationForButton(sender: sender) {
                self.input.send(.editButtonDidTap(indexPath: self.indexPath))
            }
        case deleteButton:
            isDeleteButtonSelected.toggle()
            sender.backgroundColor = isDeleteButtonSelected ? SettingData().selectedTheme.warnRed.uiColor : SettingData().selectedTheme.mainLight.uiColor
            if !isDeleteButtonSelected {
                input.send(.deleteButtonDidTap(indexPath: indexPath))
            } else {
                animationForButton(sender: sender)
            }
        default:
            fatalError()
        }
    }
}

extension CreateModeSelectCollectionViewCell {
    private func animationForButton(sender: UIButton, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
                completion?()
            }
        }
        
    }
    
    private func animationForButton(sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
    }
}
