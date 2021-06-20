//
//  MyAppNavigation.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import UIKit

enum MyNavigation: Navigation {
    case country
    case category
    case dashboard
    case search
}
struct MyAppNavigation: AppNavigation {

    func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController {
        if let navigation = navigation as? MyNavigation {
            switch navigation {
            case .country:
                return ChooseCountryViewController()
                
            case .category:
                return ChooseCategoryViewController()
                
            case .dashboard:
                return DashboardViewController()
                
            case .search:
                return SearchViewController()
//            case .profile(let p):
//                return ProfileViewController(person: p)
            }
        }
        return UIViewController()
    }

    func navigate(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
      from.navigationController?.pushViewController(to, animated: true)
    }
}
