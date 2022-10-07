import UIKit
import Foundation

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .blue
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
        
        loadTabBar()
    }
    
    func loadTabBar() {
        
        let homeVC = UINavigationController (rootViewController: ViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "book.closed.fill")
        homeVC.tabBarItem.title = "Plans"

        let profileVC = UINavigationController (rootViewController: TwoViewController())
        profileVC.tabBarItem.image = UIImage(systemName: "circle.inset.filled")
        profileVC.tabBarItem.title = "Fasting"
        
        let threeVS = UINavigationController (rootViewController: ThreeViewController())
        threeVS.tabBarItem.image = UIImage(systemName: "person.circle.fill")
        threeVS.tabBarItem.title = "Profile"
        
        viewControllers = [homeVC, profileVC, threeVS]
        
    }
}
