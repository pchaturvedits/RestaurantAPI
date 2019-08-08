//
//  CollectionViewController.swift
//  BottleRocket
//
//  Created by Manish Chaturvedi on 7/31/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import UIKit

//private let "CollectionViewCell" = "Cell"

class CollectionViewController: UICollectionViewController {
    
var dummyArray = ["a", "b", "c", "d", "e", "f"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
      // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")

        // Do any additional setup after loading the view.
    }

   


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dummyArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as!CollectionViewCell
    
        // Configure the cell
    cell.nameLbl.text = dummyArray[indexPath.item]
        return cell
    }

}
