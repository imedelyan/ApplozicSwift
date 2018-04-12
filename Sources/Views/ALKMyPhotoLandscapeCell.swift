//
//  ALKMyPhotoLandscapeCell.swift
//  ApplozicSwift
//
//  Created by Mukesh Thawani on 04/05/17.
//  Copyright © 2017 Applozic. All rights reserved.
//

import Foundation
// MARK: - ALKMyPhotoLandscapeCell
final class ALKMyPhotoLandscapeCell: ALKPhotoCell {
    
    fileprivate var stateView: UIImageView = {
        let sv = UIImageView()
        sv.isUserInteractionEnabled = false
        sv.contentMode = .center
        return sv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        let width = UIScreen.main.bounds.width
        
        contentView.addViewsForAutolayout(views: [stateView])
        
        photoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        
        photoView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 48).isActive = true
        photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        
        photoView.widthAnchor.constraint(equalToConstant: width*0.64).isActive = true
        photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
        
        let image = UIImage.init(named: "chat_bubble_red", in: Bundle.applozic, compatibleWith: nil)
        bubbleView.image = image?.imageFlippedForRightToLeftLayoutDirection()
        bubbleView.tintColor =   UIColor(red: 92.0 / 255.0, green: 90.0 / 255.0, blue:167.0 / 255.0, alpha: 1.0)

        fileSizeLabel.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: 0).isActive = true
        
        stateView.widthAnchor.constraint(equalToConstant: 17.0).isActive = true
        stateView.heightAnchor.constraint(equalToConstant: 9.0).isActive = true
        stateView.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -1.0).isActive = true
        stateView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: 13.0).isActive = true
        
        timeLabel.rightAnchor.constraint(equalTo: stateView.leftAnchor, constant: -5.0).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: 2).isActive = true
    }
    
    override func update(viewModel: ALKMessageViewModel) {
        super.update(viewModel: viewModel)
        
        
        if viewModel.isAllRead {
            stateView.image = UIImage(named: "kmreadIcon", in: Bundle.applozic, compatibleWith: nil)
        } else if viewModel.isAllReceived {
            stateView.image = UIImage(named: "kmdeliveredIcon", in: Bundle.applozic, compatibleWith: nil)
            stateView.tintColor = nil
        } else if viewModel.isSent {
            stateView.image = UIImage(named: "kmsenticon", in: Bundle.applozic, compatibleWith: nil)
            stateView.tintColor = nil
        } else {
            stateView.image = UIImage(named: "seen_state_0", in: Bundle.applozic, compatibleWith: nil)
        }
    }
    
    override class func bottomPadding() -> CGFloat {
        return 6
    }
}
