//
//  SentMemesCollectionViewController.swift
//  OnesmallprojectOfMemeME
//
//  Created by Amjad khalid  on 28/11/2018.
//  Copyright © 2018 Amjad khaled. All rights reserved.
//

import UIKit

// MARK: - SentMemesCollectionViewController:  UICollectionViewController
class SentMemesCollectionViewController:  UICollectionViewController{
    
    // This is an array of Meme instances
    var memes: [Meme]!{
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    //Outlets
    @IBOutlet var memesCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: viewWillAppear(_ animated: Bool)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Update the view
        memesCollectionView.reloadData()
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UICollectionViewFlowLayout sittings
        let space:CGFloat = 3.0
        let xdimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: xdimension, height: xdimension)
    }
    
    // collectionView sittings
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCell", for: indexPath) as! SentMemesCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the memed image
        
        cell.memeImage.image = meme.memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        //Preparing and setting the segua
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemesDetailViewController") as! MemesDetailViewController
        
        //Send the current Meme instanse to the detailedView
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    @IBAction func AddMeme(_ sender: Any) {
        //Preparing and present the segua
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeMainViewController") as! MemeMainViewController
        self.present(detailController, animated: true, completion: nil)
    }
}
