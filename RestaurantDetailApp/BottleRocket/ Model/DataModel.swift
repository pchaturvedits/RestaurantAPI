//
//  DataModel.swift
//  BottleRocket
//
//  Created by Priyanka Chaturvedi on 8/1/19.
//  Copyright © 2019 Priyanka Chaturvedi. All rights reserved.
//

import Foundation

 struct ResData: Decodable {
    let restaurants: [Resturant]
    
}

struct Resturant: Decodable{
  let name:String
  let backgroundImageURL:String
  let category: String
  let contact: Contact?
  let location:Location
    enum CodingKeys : String, CodingKey {
        case name = "name"
        case backgroundImageURL = "backgroundImageURL"
        case category = "category"
        case location = "location"
        case contact
        

    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        backgroundImageURL = try values.decode(String.self, forKey: .backgroundImageURL)
        category = try values.decode(String.self, forKey: .category)
        location = try values.decode(Location.self, forKey: .location)
        contact = try values.decodeIfPresent(Contact.self, forKey: .contact)

    }
   

}

struct Contact: Codable {
    let phone:String
    let formattedPhone:String
    let twitter:String?
}



struct Location:Codable{
    let lat: Double
    let lng: Double
    let formattedAddress:[String]
}

