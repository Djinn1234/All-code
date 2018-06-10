//
//  ViewController.swift
//  Custom View Controller
//
//  Created by Caleb Wells on 6/9/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let segmentedControl = UISegmentedControl(items: ["blue", "red"])
    let containerView = UIView()
    
    lazy var redVC: RedViewController = {
        let vc = RedViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    lazy var blueVC: RedViewController = {
        let vc = RedViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        
        setupViews()
        blueVC.view.isHidden = false
    }
    
    func setupViews() {
        //let screenHeight = UIScreen.main.bounds.height
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(madeSelection(_:)), for: .valueChanged)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            containerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    func addAsChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.frame
        childVC.didMove(toParentViewController: self)
    }
    
    @objc func madeSelection(_ sender: UISegmentedControl) {
        blueVC.view.isHidden = sender.selectedSegmentIndex == 1
        redVC.view.isHidden = sender.selectedSegmentIndex == 0
    }
}

