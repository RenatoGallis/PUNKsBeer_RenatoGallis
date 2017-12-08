//
//  BeerViewController.swift
//  38654RenatoGallis
//@IBOutlet weak var tfName: UILabel!//  Created by user132786 on 11/26/17.
//  Copyright © 2017 user132786. All rights reserved.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var teorAlcolico: UILabel!
    @IBOutlet weak var escalaDeAmargor: UILabel!
    @IBOutlet weak var ivImageBeer: UIImageView!
    
    var beer: Beers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if beer != nil {
            name.text = beer.name
            tagline.text = beer.tagline
            descript.text = beer.description
            teorAlcolico.text = "\(beer.abv)"
            escalaDeAmargor.text = "\(beer.ibu)"
        // Do any additional setup after loading the view.
            }
        
        ivImageBeer.kf.setImage(with: ImageResource(downloadURL: URL(string: beer.imageURL)!, cacheKey: beer.name))
//        REST.downloadImage(url: beer.imageURL) { (image: UIImage?) in
//
//            DispatchQueue.main.async {
//                self.ivImageBeer.image = image
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
