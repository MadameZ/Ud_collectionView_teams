//
//  DetailViewController.swift
//  collectionView_team
//
//  Created by Caroline Zaini on 11/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var stadiumIV: UIImageView!
    @IBOutlet weak var confIV: UIImageView!
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var stadiumLbl: UILabel!
    @IBOutlet weak var champsLbl: UILabel!
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = team {
            setup(t)
        }
        
        view.setupGradient([UIColor.white.cgColor, nflBlue.cgColor])
       
    }
    
    func setup(_ team: Team) {
        stadiumIV.loadFrom(team.stadium.image)
        /// lowercased car le nom des images dans les assets sont en minuscules :
        confIV.image = UIImage(named: team.conference.lowercased())
        logoIV.loadFrom(team.team.logo)
        nameLbl.text = team.team.location + " " + team.team.name
        stadiumLbl.text = team.stadium.name + " Capacité : \(team.stadium.capacity) places"
        
        var champsStr = String(team.titles.count) + " fois champion "
        for title in team.titles {
            champsStr += String(title) + ", "
        }
        champsLbl.text = champsStr
        
    }

   

}
