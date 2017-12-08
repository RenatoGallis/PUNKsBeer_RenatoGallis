//
//  BeerTableViewController.swift
//  38654RenatoGallis
//
//  Created by user132786 on 11/26/17.
//  Copyright © 2017 user132786. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewController: UITableViewController {

    var beers: [Beers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "detailsBeer" {
            let vc = segue.destination as! BeerViewController
            vc.beer = beers[tableView.indexPathForSelectedRow!.row]
        }
    }
    func load() {
        REST.loadCars { (beers: [Beers]?) in
            if let beers = beers {
                self.beers = beers
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        load()
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        
        let beer = beers[indexPath.row]
        
        cell.lbName.text = beer.name
        cell.lbAbv?.text = "Teor alcolico \(beer.abv)"
        
        let image = ImageResource(downloadURL: URL(string: beer.imageURL)!, cacheKey: beer.name)
        cell.ivImage.kf.setImage(with: image)
        
//        REST.downloadImage(url: beer.imageURL) { (image: UIImage?) in
//            DispatchQueue.main.async {
//                cell.ivImage.image = image
//            }
//        }
        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}
