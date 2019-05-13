//
//  GalleryVCPageCell.swift
//  ImageScroll
//
//  Created by Isaac Raval on 5/12/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    //Declare imageview
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "1"))
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView) //Add VC to view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

