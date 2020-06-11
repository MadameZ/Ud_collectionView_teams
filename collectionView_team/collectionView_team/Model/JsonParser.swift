//
//  JsonParser.swift
//  collectionView_team
//
//  Created by Caroline Zaini on 11/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

class JsonParser {
    
    func parse(completion: (([Team])-> Void)?) {
        /// on va chercher le fichier Json :
        if let file = Bundle.main.url(forResource: "nfl", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: file)
                let results = try JSONDecoder().decode([Team].self, from: data)
//                for team in results {
//                    print(team.team.name)
//                }
                completion?(results)
            } catch {
                print(error.localizedDescription)
                completion?([])
            }
            
        } else {
            print("No such file")
            completion?([])
        }
        
    }
    
}
