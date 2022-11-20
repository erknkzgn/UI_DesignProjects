//
//  CustomTabbar.swift
//  CustomTabbarProgramatical
//
//  Created by Erkan Kızgın on 17.11.2022.
//

import UIKit



class CustomTabbar: UIView {
    var width: CGFloat?
    var height: CGFloat?
    var delegate: TabObserverDelegate?
    let v1 =  UIView()
    let v2 = UIView()
    let iv1 = UIImageView()
    let iv2 = UIImageView()
    let selectedColor = UIColor(named: "SelectedColor")
    let unselectedColor = UIColor(named: "UnselectedColor")
    let selectedAccount = UIImage(named: "selected-account")
    let unSelectedAccount = UIImage(named: "unselected-account")
    let selectedFavourites = UIImage(named: "selected-favourites")
    let unSelectedFavourites = UIImage(named: "unselected-favourites")
    
    
    init(width w: CGFloat, height h: CGFloat) {
         self.width = w / 2
         self.height = h
        super.init(frame: CGRect())
        setup()
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension CustomTabbar {

    func setup(){
        setDimensions(height: 95, width: self.width!)
        backgroundColor = .clear
        self.isOpaque = false
    }
    
    func addSubview() {
        
        addSubview(v1)
        v1.backgroundColor = UIColor(named: "UnselectedColor")
        //translatesAutoresizingMaskIntoConstraints = false
        //v1.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        guard let width = self.width, let _ = self.height else { return }
        v1.anchor(bottom: self.bottomAnchor , left: safeAreaLayoutGuide.leftAnchor, width: width, height: 60)
    
        
        iv1.setDimensions(height: 60, width: 60)
        iv1.image = UIImage(named: "unselected-account")
        iv1.backgroundColor = .clear
        addSubview(iv1)
        iv1.centerX(inView: v1, topAnchor: v1.topAnchor)
        
        
        addSubview(v2)
        v2.backgroundColor = UIColor(named: "UnselectedColor")
        //translatesAutoresizingMaskIntoConstraints = false
        //v1.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        v2.anchor(bottom: v1.bottomAnchor, left: v1.rightAnchor, right: safeAreaLayoutGuide.rightAnchor, width: width, height: 60)
        
        
        iv2.setDimensions(height: 60, width: 60)
        iv2.image = UIImage(named: "unselected-account")
        iv2.backgroundColor = .clear
        addSubview(iv2)
        iv2.centerX(inView: v2, topAnchor: v2.topAnchor)
        
        let button1 = UIButton()
        addSubview(button1)
        button1.addTarget(self, action: #selector(switchAction), for: .touchUpInside)
        button1.anchor(top: self.topAnchor, bottom: self.bottomAnchor,left: self.leftAnchor,right: v1.rightAnchor)
        
        let button2 = UIButton()
        button2.tag = 1
        button2.addTarget(self, action: #selector(switchAction), for: .touchUpInside)
        addSubview(button2)
        button2.anchor(top: self.topAnchor, bottom: self.bottomAnchor,left: v2.leftAnchor,right: self.rightAnchor)
        
       

    }
    
    @objc func switchAction(sender: UIButton){
        print(sender.tag)
        delegate?.tabIndex(index: sender.tag)
        
        switch sender.tag {
        case 0:
            iv1.image = selectedFavourites
            iv2.image = unSelectedAccount
            v1.backgroundColor = selectedColor
            v2.backgroundColor = unselectedColor
        case 1:
            iv2.image = selectedAccount
            iv1.image = unSelectedFavourites
            v2.backgroundColor = selectedColor
            v1.backgroundColor = unselectedColor
        default:
            print(sender.tag)
        }
    }
}
