//
//  SentMemesTabelViewController.swift
//  OnesmallprojectOfMemeME
//
//  Created by Amjad khalid  on 28/11/2018.
//  Copyright © 2018 Amjad khaled. All rights reserved.
//

import UIKit
// MARK: - SentMemesTabelViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
class SentMemesTabelViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    // This is an array of Meme instances
    var memes: [Meme]!{
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    //Outlets & properties
    @IBOutlet weak var tabelView: UITableView!
    let cellIdentifier = "memeCell"
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Update the view
        tabelView.reloadData()
        
    }
    
    // tabelView sittings
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        //Get cell information
        let meme = self.memes![(indexPath as NSIndexPath).row]
        
        //Set Cell information
        cell?.textLabel!.text = meme.topTextField+" "+meme.botoomTextField
        cell?.imageView?.image = meme.memedImage
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Preparing and setting the segua
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemesDetailViewController") as! MemesDetailViewController
        
        //Send the current Meme instanse to the detailedView
        detailController.meme =
            self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)        
    }
    
    
    @IBAction func AddMeme(_ sender: Any) {
        //Preparing and present the segua 
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeMainViewController") as! MemeMainViewController
        self.present(detailController, animated: true, completion: nil)
    }
    
    
    
    
    
    
}
