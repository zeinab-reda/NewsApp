//
//  CountriesTableViewDelegate.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 06/06/2021.
//

import UIKit

class CountriesTableViewDelegate <CELL : UITableViewCell,T> : NSObject, UITableViewDataSource, UITableViewDelegate  {
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    var selectCell : (T) -> () = {_ in }

    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> (),selectCell : @escaping (T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
        self.selectCell = selectCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectCell(self.items[indexPath.row])

    }
    

}

