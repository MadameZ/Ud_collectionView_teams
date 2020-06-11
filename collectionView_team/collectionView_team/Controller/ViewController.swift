//
//  ViewController.swift
//  collectionView_team
//
//  Created by Caroline Zaini on 04/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nfl_logo: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var allTeams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// retrouve les méthodes dans le fichier UIViewExtension
        view.setupGradient([UIColor.white.cgColor, nflBlue.cgColor])
        nfl_logo.circleView(nfl_logo.frame.width / 2)
        nfl_logo.shadow()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let width = collectionView.frame.width / 2 - 30
        let height = width + 30
        layout.itemSize = CGSize(width: width, height: height)
        collectionView.collectionViewLayout = layout
        
        // dans le main.storyboard on met clearColor en background pour voir la séparation des cellules
        
        JsonParser().parse { (teams) in
            self.allTeams = teams
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail", let next = segue.destination as? DetailViewController {
            next.team = sender as? Team
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCell
        
        cell.setupCell(allTeams[indexPath.item])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team = allTeams[indexPath.item]
        
        performSegue(withIdentifier: "detail", sender: team)
    }
   
    
    
}

