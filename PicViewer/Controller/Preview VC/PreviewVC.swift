//
//  GalleryController.swift
//  ImageScroll
//
//  Created by Isaac Raval on 5/12/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class PreviewVC: UICollectionViewController {
    
    //For later use
    let imageNamesToDisplayInEachCell = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Misc setup
        setup()
        
    }
}
