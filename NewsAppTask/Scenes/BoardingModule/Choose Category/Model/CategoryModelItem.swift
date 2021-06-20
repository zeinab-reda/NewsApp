//
//  CategoryModelItem.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import Foundation

class CategoryModelItem {
   private var item: NewsCategory
   var selected :Bool
   var title: String {
      return item.rawValue
   }
    init(item: NewsCategory,selected:Bool) {
      self.item = item
      self.selected = selected
   }
}
