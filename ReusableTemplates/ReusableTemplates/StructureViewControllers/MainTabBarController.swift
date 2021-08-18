//
//  MainTabBarController.swift
//
//  Created by Daniel No on 8/3/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    enum TabBarItemTitles : String{
        case firstVC = "Table View"
        case secondVC = "Second"
        case thirdVC = "Third"
        case fourthVC = "Fourth"
        case fifthVC = "Fifth"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    
    func setupTabBarController(){
        self.setViewControllers([firstVC(),secondVC(),thirdVC(),fourthVC(),fifthVC()], animated: false)
    }
        
    func firstVC() -> UIViewController{
        let vc = DiffableTableViewController()
        vc.title = TabBarItemTitles.firstVC.rawValue
        vc.tabBarItem = UITabBarItem(title: TabBarItemTitles.firstVC.rawValue, image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        let navCon = UINavigationController(rootViewController: vc)
        return navCon
    }
    
    func secondVC() -> UIViewController{
        let vc = UIViewController()
        vc.title = TabBarItemTitles.secondVC.rawValue
        vc.tabBarItem = UITabBarItem(title: TabBarItemTitles.secondVC.rawValue, image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        let navCon = UINavigationController(rootViewController: vc)
        return navCon

    }
    func thirdVC() -> UIViewController{
        let vc = UIViewController()
        vc.title = TabBarItemTitles.thirdVC.rawValue
        vc.tabBarItem = UITabBarItem(title: TabBarItemTitles.thirdVC.rawValue, image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        let navCon = UINavigationController(rootViewController: vc)
        return navCon

    }
    func fourthVC() -> UIViewController{
        let vc = UIViewController()
        vc.title = TabBarItemTitles.fourthVC.rawValue
        vc.tabBarItem = UITabBarItem(title: TabBarItemTitles.fourthVC.rawValue, image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        let navCon = UINavigationController(rootViewController: vc)
        return navCon

    }
    func fifthVC() -> UIViewController{
        let vc = UIViewController()
        vc.title = TabBarItemTitles.fifthVC.rawValue
        vc.tabBarItem = UITabBarItem(title: TabBarItemTitles.fifthVC.rawValue, image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        let navCon = UINavigationController(rootViewController: vc)
        return navCon
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
