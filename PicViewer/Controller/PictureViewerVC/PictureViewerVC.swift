//
//  SwipingController.swift
//  ImageScroll
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
    let imageNamesToDisplayInEachCell = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Misc setup
        setup()
        
        //Add observer to listen for drag gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerHandler))
        panGesture.delegate = self
        view.addGestureRecognizer(panGesture)

        //Default to showing first image (default val of indexToStartAt is 0), but if changed, go to that index
        scrollTo(specifiedCell: indexToStartAt)


    }
}

extension PictureViewerVC: UICollectionViewDelegateFlowLayout {
    //Size of Collection View cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Make each one the full size of the screen
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
