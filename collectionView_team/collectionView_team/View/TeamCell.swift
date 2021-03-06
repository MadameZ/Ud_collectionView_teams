//
//  TeamCell.swift
//  collectionView_team
//
//  Created by Caroline Zaini on 05/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

// On créé la cellule, après avoir créé la collectionView dans le storyboard

// 1. donner le nom de la classe à la cell dans le storyboard
// 2. nommer l'identifier
// 3. faire les outlets

class TeamCell: UICollectionViewCell {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoIV: UIImageView!
    
    var team: Team!
    
    func setupCell(_ team: Team) {
        self.team = team
        nameLabel.text = self.team.team.location + "" + self.team.team.name
        
        /// sans les données Json :
//        logoIV.image = UIImage(named: self.team.code)
        
        /// avec les données Json. on récupère la méthode dans le fichier UIViewExtension :
        logoIV.loadFrom(self.team.team.logo)
        
        logoIV.shadow()
        /// Le 0.75 vient de la contrainte proportional height du logo
        logoIV.circleView((self.frame.height * 0.75) / 2)
        holderView.shadow()
        holderView.circleView(10)
    }
}

// N.B : Comme logo est un http, il faut aller dans info.plist -> rajouter "App Transport Security Settings" dans laquelle on rajoute avec + "Allow Arbitrary Loads" -> YES
