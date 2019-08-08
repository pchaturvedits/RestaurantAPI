//
//  CollectionViewController.swift
//  BottleRocket
//
//  Created by Priyanka Chaturvedi on 7/31/19.
//  Copyright © 2019 Priyanka Chaturvedi. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    final let url = URL(string:"https://s3.amazonaws.com/br-codingexams/restaurants.json")
    var resturants = [Resturant]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func downloadJson() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded data \(data)")
            do
            {
                let decoder = JSONDecoder()
                let downloadedcharacters = try? decoder.decode(ResData.self, from: data)
                self.resturants = (downloadedcharacters?.restaurants)!
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
            }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as!CollectionViewCell
        
        
        cell.nameLbl.text =  resturants[indexPath.item].name
        cell.categoryLbl.text = resturants[indexPath.item].category
        
        if let imageURL = URL(string: resturants[indexPath.item].backgroundImageURL) {
            let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async() {    // execute on main thread
                    cell.restImage.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        return cell
    }
    
    
    
    func restaurantaddress(a:Int) -> String {
        let streetAddress =  resturants[a].location.formattedAddress[0]
        let formattedStreetAddress: String = streetAddress.components(separatedBy: "(").first!
        let city =  resturants[a].location.formattedAddress[1]
        let fullAddress: String = "\(formattedStreetAddress)\n" + city
        
        return fullAddress
    }
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController")as! DetailViewController
        
        if let resturantContact = resturants[indexPath.item].contact {
            vc.getContact = resturantContact.formattedPhone
            vc.getTwitter = resturantContact.twitter ?? ""
        }
        
        vc.getCategory = resturants[indexPath.item].category
        vc.getRestaurantName = resturants[indexPath.item].name
        vc.getAddress = resturants[indexPath.item].location.formattedAddress[0]
        vc.getAddress = restaurantaddress(a: indexPath.item)
        vc.getLatitude = resturants[indexPath.item].location.lat
        vc.getLongitute  = resturants[indexPath.item].location.lng
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
