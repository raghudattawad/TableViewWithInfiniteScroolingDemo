//
//  ViewController.swift
//  TableviewWithInfiniteScrolling
//
//  Created by Raghavendra on 06/07/19.
//  Copyright © 2019 To Be Success echnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var recordArray = [Int]()
    var limit = 10
    let totalEnteries = 100
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
        var index = 0
        while index < limit {
            
            recordArray.append(index)
            
            index = index + 1
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  recordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Row \(recordArray[indexPath.row])"
        return cell
    }

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == recordArray.count - 1 {
            /// we are in last  cell row of count
            
            
            if recordArray.count < totalEnteries {
                
            ///add more recordds ///
                var indx = recordArray.count
                
                limit = indx + 20
                while  indx < limit {
                    
                    recordArray.append(indx)
                    
                    indx = indx + 1
                }
                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
                
            }
        }
        
    }
    
    
    @objc func  loadTable(){
        
        
        tableview.reloadData()
        
    }
    
    
    
    
}


