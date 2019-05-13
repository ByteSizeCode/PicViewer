//
//  PreviewVC+HelperFunctions.swift
//  PicViewer
//
//  Created by Isaac Raval on 5/12/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

//Setup and collection view config
extension PreviewVC {
    func setup() {
        collectionView.backgroundColor = .white //Set background color
        
        //Register cells
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: "cellId")
        
        //Setup layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: -80, bottom: 0, right: 0) //Padding on left and right
        layout.minimumInteritemSpacing = -50 //Make cells overlap
        layout.minimumLineSpacing = 5 //Vertival spacing between cells
        collectionView!.collectionViewLayout = layout
    }
    
    //Number of cells to return
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgNamesToDispInEachCell.count
    }
    
    //Cell creation
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PreviewCell
        let nameOfImageToUseInCell = imgNamesToDispInEachCell[indexPath.row]
        cell.imageView.image = UIImage(named: nameOfImageToUseInCell) //Changes for each next cell
        return cell
    }
}

extension PreviewVC: UICollectionViewDelegateFlowLayout {
    //Size of Collection View cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Size of cells
        return CGSize(width: view.frame.width / 3.73, height: view.frame.width / 3.73)
    }
}

extension PreviewVC {
    //When an image is tapped, switch to PictureViewer VC
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tappedItem = indexPath.item
        let lastItem = imgNamesToDispInEachCell.count - 1
        //Ignore taps on whitesquare image
        if(tappedItem != lastItem) {
            //Switch to PictureViewer VC
            let VCLayout = UICollectionViewFlowLayout()
            VCLayout.scrollDirection = .vertical //Set cell scrolling direction
            let VC = PictureViewerVC(collectionViewLayout: VCLayout)
            VC.indexToStartAt = indexPath.item //Set index of image to show

            //Display Image selected
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}
