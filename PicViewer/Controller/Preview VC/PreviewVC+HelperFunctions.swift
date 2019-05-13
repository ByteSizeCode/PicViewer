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
    }
    
    //Number of cells to return
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    //Cell creation
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PreviewCell
        let nameOfImageToUseInCell = imageNamesToDisplayInEachCell[indexPath.row]
        cell.imageView.image = UIImage(named: nameOfImageToUseInCell) //Changes for each next cell
        return cell
    }
    
    //Amount of spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension PreviewVC: UICollectionViewDelegateFlowLayout {
    //Size of Collection View cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Make each one the full size of the screen
        return CGSize(width: 150, height: 150)
    }
}

extension PreviewVC {
    //When an image is tapped, switch to PictureViewer VC
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Switch to PictureViewer VC
        let VCLayout = UICollectionViewFlowLayout()
        VCLayout.scrollDirection = .horizontal //Set cell scrolling direction
        let VC = PictureViewerVC(collectionViewLayout: VCLayout)
        VC.indexToStartAt = indexPath.item //Set index of image to show
        
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
}
