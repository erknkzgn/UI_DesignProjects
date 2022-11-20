//
//  CustomTabBarController.swift
//  CustomTabbarProgramatical
//
//  Created by Erkan Kızgın on 17.11.2022.
//

import UIKit

protocol TabObserverDelegate{
    func tabIndex(index: Int)
}

class CustomTabBarController: UITabBarController {
    var width: CGFloat = 0
    var bottomAnchor: NSLayoutYAxisAnchor?
    var topAnchor: NSLayoutYAxisAnchor?
    var leftAnchor: NSLayoutXAxisAnchor?
    var rightAnchor: NSLayoutXAxisAnchor?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let window = UIApplication.shared.windows[0]
        topAnchor = window.topAnchor
        bottomAnchor = self.view.bottomAnchor
        width = window.safeAreaLayoutGuide.layoutFrame.width
        leftAnchor = self.view.leftAnchor
        rightAnchor = self.view.rightAnchor
        configureLayout()
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

extension CustomTabBarController:TabObserverDelegate {
    func tabIndex(index: Int) {
        
       
        selectedIndex = index
    }
    
    
    func configureLayout(){
        addCustomBarView()
        let account = templateNavigationController(rootViewController: AccountVC(), selectedImage: UIImage.add, unselectedImage: .actions)
        let favourites = templateNavigationController(rootViewController: FavouritesVC(), selectedImage: UIImage.add, unselectedImage: .actions)
        viewControllers = [account,favourites]
        self.tabBar.isHidden = true
        
    }
    
    func templateNavigationController(rootViewController : UIViewController , selectedImage: UIImage, unselectedImage: UIImage) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.image = selectedImage
        navController.navigationBar.tintColor = .black
        return navController
        
    }
    
    func addCustomBarView() {
        let customTabBar = CustomTabbar(width: self.width , height: 128)
        customTabBar.delegate = self
        view.addSubview(customTabBar)
        //customTabBar.width = self.view.safeAreaLayoutGuide.layoutFrame.width
        customTabBar.anchor(bottom: self.bottomAnchor,left: self.leftAnchor,right: self.rightAnchor)
        customTabBar.addSubview()
        view.backgroundColor = .white
    }
    
    
    
}
