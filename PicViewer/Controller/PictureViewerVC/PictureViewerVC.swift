//
//  PictureViewerVC.swift
//  PicViewer
//
//  Created by Isaac Raval on 5/11/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class PictureViewerVC: UICollectionViewController, UIGestureRecognizerDelegate {
    
    var indexToStartAt = 0
    
    // Define a variable to store initial touch position
    var initialTouchPoint = CGPoint(x: 0, y: 0)
    
    //For later use
    let imgNamesToDispInEachCell = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Misc setup
        setup()

        //Show image at given index (set previously). Ignore first dummy element.
        print("Scrolling to index \(indexToStartAt)")
        scrollTo(specifiedCell: indexToStartAt - 1)
        
    }
}

extension PictureViewerVC: UICollectionViewDelegateFlowLayout {
    //Size of Collection View cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Make each one the full size of the screen
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
