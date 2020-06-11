//
//  Team.swift
//  collectionView_team
//
//  Created by Caroline Zaini on 04/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

//struct Team {
//
//    var code: String
//    var name: String
//    var city: String
//
//}

/// on retranscrit les données du fichier Json en struct :

struct Team: Decodable {
    var team: Identity
    var stadium: Stadium
    var conference: String
    var titles: [Int]
    
}

struct Identity: Decodable {
    var name: String
    var location: String
    var logo: String
    
}

struct Stadium: Decodable {
    var name: String
    var capacity: Int
    var image: String
}
