//
//  PictureViewerVC+HelperFunctions
//  PicViewer
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
        return imgNamesToDispInEachCell.count
    }
    
    //Cell creation
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PictureViewerCell
        let nameOfImageToUseInCell = imgNamesToDispInEachCell[indexPath.row]
        cell.imageView.image = UIImage(named: nameOfImageToUseInCell) //Changes as user swipes to next cell
        return cell
    }
    
    //Amount of spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension PictureViewerVC {
    func scrollTo(specifiedCell: Int) {
        let indexPath = IndexPath(item: specifiedCell, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
}
