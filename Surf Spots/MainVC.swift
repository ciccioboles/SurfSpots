//
//  ViewController.swift
//  Surf Spots
//
//  Created by David Boles on 2/8/17.
//  Copyright © 2017 David Boles. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var theTableView: UITableView!
    
    var theSpots : [Spot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theTableView.delegate = self
        theTableView.dataSource = self
        
        
    }//
    
    override func viewWillAppear(_ animated: Bool) {
        let theContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            theSpots = try theContext.fetch(Spot.fetchRequest())
            theTableView.reloadData()
        } catch {
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theSpots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = UITableViewCell()
        let theSpot = theSpots[indexPath.row]
        theCell.textLabel?.text = theSpot.spot
        theCell.imageView?.image = UIImage(data: theSpot.image as! Data)
        return theCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let theSpot = theSpots[indexPath.row]
        performSegue(withIdentifier: "spotSegue", sender: theSpot)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SpotVC
        nextVC.spot = sender as? Spot
    }
    
    
}//

