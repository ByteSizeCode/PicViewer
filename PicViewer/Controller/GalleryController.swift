//
//  GalleryController.swift
//  ImageScroll
//
//  Created by Isaac Raval on 5/12/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

//Image gallery

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

extension PreviewVC {
    func setup() {
        collectionView.backgroundColor = .green //Set background color
        
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
    //When an image is tapped, switch to swiping vc
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Switch to swiping view controller
        let VCLayout = UICollectionViewFlowLayout()
        VCLayout.scrollDirection = .horizontal //Set cell scrolling direction
        let swipingViewController = PictureViewerVC(collectionViewLayout: VCLayout)
        self.navigationController?.pushViewController(swipingViewController, animated: true)
    }
}
