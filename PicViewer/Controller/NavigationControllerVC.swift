//
//  NavigationControllerVC.swift
//  PicViewer
//
//  Created by Isaac Raval on 5/12/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Show main view controller
        showPreviewVC()
    }
    
    func showPreviewVC() {
        let VCLayout = UICollectionViewFlowLayout()

        let navViewController = PreviewVC(collectionViewLayout: VCLayout)
        viewControllers = [navViewController]
    }
}
