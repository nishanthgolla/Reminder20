//
//  ViewController.swift
//  Reminder20
//
//  Created by nishanth golla on 6/4/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var cell:MyCollectionViewCell!
    
    var mydfe:IndexPath?
    
    var myString: [String] = ["20 Minutes","40 Minutes","60 Minutes","80 Minutes","100 Minutes","120 Minutes"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! MyCollectionViewCell
        
        
        cell.timeLabel.text = myString[indexPath.item]
        cell.timeLabel.textColor = UIColor.gray
        
            return cell
    }
    
    var rember:Bool = false
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (rember == false){
            cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
            cell.timeLabel.textColor = UIColor.red
            rember = true
            mydfe = indexPath
        }
        else{
            
            if (collectionView.cellForItem(at: mydfe!) as? MyCollectionViewCell) != nil{
            cell = collectionView.cellForItem(at: mydfe!) as! MyCollectionViewCell
            cell.timeLabel.textColor = UIColor.gray
            }
            cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
            cell.timeLabel.textColor = UIColor.red
            mydfe = indexPath
        }
       
        
        print("\(indexPath.item)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

