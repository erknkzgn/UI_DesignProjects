//
//  TBController.swift
//  CustomTabbarButton-1
//
//  Created by Erkan Kızgın on 14.11.2022.
//

import UIKit

class TBController: UITabBarController {
    @IBOutlet var tbvOzel: UIView!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var ivFavourite: UIImageView!
    @IBOutlet weak var ivHesap: UIImageView!
    let seciliRenk = UIColor(named: "SelectedColor")
    let seciliDegilRenk = UIColor(named: "UnselectedColor")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tbvOzel)
        
        tbvOzel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tbvOzel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
            tbvOzel.heightAnchor.constraint(equalToConstant:84),
            tbvOzel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            tbvOzel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0)
            
        ])
        
        tabBar.isOpaque = true
    }
    

    @IBAction func tabDegistir(_ sender: UIButton) {
        
        degistir(tabIndex: sender.tag)
    }
    
    func degistir(tabIndex : Int) {
        
        v1.backgroundColor = seciliDegilRenk
        v2.backgroundColor = seciliDegilRenk
        
        switch tabIndex {
        case 0:
            v1.backgroundColor = seciliRenk
            v2.backgroundColor = seciliDegilRenk
            ivFavourite.image = UIImage(named: "selected-favourites")
            ivHesap.image = UIImage(named: "unselected-account")
        case 1:
            v2.backgroundColor = seciliRenk
            v1.backgroundColor = seciliDegilRenk
            ivHesap.image = UIImage(named: "selected-account")
            ivFavourite.image = UIImage(named: "unselected-favourites")
        default: 
            v1.backgroundColor = seciliRenk
        }
        
        selectedIndex = tabIndex
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
