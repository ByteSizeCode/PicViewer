//
//  PreviewVC.swift
//  PicViewer
//
//  Created by Isaac Raval on 5/12/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class PreviewVC: UICollectionViewController {
    
    //For later use. First element will be ignored in order to fix a bug. Last element ensures our last image looks the same size as the others by using a partial overlap.
    let imgNamesToDispInEachCell = ["", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "whitesquare.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Misc setup
        setup()
        
    }
}
