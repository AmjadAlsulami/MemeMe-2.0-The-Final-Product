//
//  MemesDetailViewController.swift
//  OnesmallprojectOfMemeME
//
//  Created by Amjad khalid  on 29/11/2018.
//  Copyright © 2018 Amjad khaled. All rights reserved.
//

import UIKit
// MARK: - MemesDetailViewController: UIViewController
class MemesDetailViewController: UIViewController {
    
    //Outlet
    @IBOutlet weak var memeImage: UIImageView!
    
   // This is a Meme instances
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       //Set the memed image in the imageview
        self.memeImage.image = self.meme.memedImage
        //hide the tab bar
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    
        self.tabBarController?.tabBar.isHidden = false
    }
}
