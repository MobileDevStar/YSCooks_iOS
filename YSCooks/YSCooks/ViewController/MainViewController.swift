//
//  MainViewController.swift
//  YSCooks
//
//  Created by simba on 10/4/19.
//  Copyright © 2019 simba. All rights reserved.
//

import UIKit
import Parchment

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavBar()
        // Load each of the view controllers you want to embed
        // from the storyboard.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        let cooksVC = storyboard.instantiateViewController(withIdentifier: "CooksVC")
        
        // Initialize a FixedPagingViewController and pass
        // in the view controllers.
        let pagingViewController = FixedPagingViewController(viewControllers: [
            homeVC,
            cooksVC
            ])
        pagingViewController.menuItemSize = .fixed(width: 150, height: 15)
        pagingViewController.indicatorColor = UIColor(red: 183/255, green: 149/255, blue: 1/255, alpha: 1)
        
        //pagingViewController.h
        // Make sure you add the PagingViewController as a child view
        // controller and contrain it to the edges of the view.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }
    
    private func initNavBar() {
        // 1
        let nav = self.navigationController?.navigationBar
        
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
        let image = UIImage(named: "main_title")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
       // navigationItem.titleView = imageView//
        //  navigationItem.backBarButtonItem = imageView
        
        navigationItem.leftBarButtonItem = barImageView(imageName: "main_title")
        
        //let firstImage = barImageView(imageName: "menu")
        let searchButton = searchBarButton(imageName: "search", selector: #selector(searchButtonPressed))
        let menuButton = menuBarButton(imageName: "menu", selector: #selector(menuButtonPressed))
        
        navigationItem.rightBarButtonItems = [menuButton, searchButton]
    }
    
    private func imageView(imageName: String) -> UIImageView {
        let logo = UIImage(named: imageName)
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        
        logoImageView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return logoImageView
    }
    
    func barImageView(imageName: String) -> UIBarButtonItem {
        return UIBarButtonItem(customView: imageView(imageName: imageName))
    }
    
    func searchBarButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 19, height: 21)
        button.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 20);
        button.widthAnchor.constraint(equalToConstant: 19).isActive = true
        button.heightAnchor.constraint(equalToConstant: 21).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    func menuBarButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 23, height: 17)
        button.widthAnchor.constraint(equalToConstant: 23).isActive = true
        button.heightAnchor.constraint(equalToConstant: 17).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    @objc func searchButtonPressed() {
        print("Search Pressed")
    }
    
    @objc func menuButtonPressed() {
        print("Menu Pressed")
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
