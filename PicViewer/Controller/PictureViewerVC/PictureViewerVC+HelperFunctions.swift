//
//  SwipingController+HelperFunctions.swift
//  ImageScroll
//
//  Created by Isaac Raval on 5/12/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

//Setup and Collection View config
extension PictureViewerVC {
    func setup() {
        
        collectionView.isPagingEnabled = true //Remove free-form scrolling (snap into place)
        
        //Register cells
        collectionView.register(PictureViewerCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.backgroundColor = .clear
    }
    
    //Number of cells to return
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    //Cell creation
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PictureViewerCell
        let nameOfImageToUseInCell = imageNamesToDisplayInEachCell[indexPath.row]
        cell.imageView.image = UIImage(named: nameOfImageToUseInCell) //Changes as user swipes to next cell
        return cell
    }
    
    //Amount of spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//Pan Gesture / swipe-view-down-to-dismiss handling
extension PictureViewerVC {
    
    //Handle drag gesture
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: view.window)
        
        if sender.state == UIGestureRecognizer.State.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizer.State.changed {
            //If changed, get vertical difference (y) and move the VC vertically appropriately. Check if vertical difference > 0 to only allow VC to only be moveable downwards
            if touchPoint.y - initialTouchPoint.y > 0 {
                view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: view.frame.size.width, height: view.frame.size.height)
            }
            //When user lets go from dragging, if they have moved the image from where it started (more than 150 units) hide VC
        } else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled {
            if touchPoint.y - initialTouchPoint.y > 150 {
                
                slideEntireViewDown()
                
                //Else animate back to top
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    func slideEntireViewDown() {
        
        //animate to bottom of screen
        let originalTransform = view.transform
        let scaledTransform = originalTransform.scaledBy(x: 1, y: 1)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0.0, y: 900)
        
        UIView.animate(withDuration: 1, animations: {
            self.navigationController?.popViewController(animated: true)
            self.view.transform = scaledAndTranslatedTransform
            
        }, completion: {(finished:Bool) in
            //Optionally execute code here after animation completes
        })
    }
}

extension PictureViewerVC {
    func scrollTo(specifiedCell: Int) {
        let indexPath = IndexPath(item: specifiedCell, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
}
