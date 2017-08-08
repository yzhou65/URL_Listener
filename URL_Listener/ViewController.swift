//
//  ViewController.swift
//  URL_Listener
//
//  Created by Yue Zhou on 8/7/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    
    private func setupUI() {
        view.addSubview(myTextView)
        
        myTextView.translatesAutoresizingMaskIntoConstraints = false
        var cons = [NSLayoutConstraint]()
        let dict = ["myTextView" : myTextView]
        let margin = ["margin" : 20]
        cons += NSLayoutConstraint.constraints(withVisualFormat: "H:|-margin-[myTextView]-margin-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: margin, views: dict)
        cons += NSLayoutConstraint.constraints(withVisualFormat: "V:|-margin-[myTextView(100)]", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: margin, views: dict)
        view.addConstraints(cons)
    }
    
    
    // MARK: lazy init
    private lazy var myTextView: AndyTextView = AndyTextView { [unowned self] (vc) in
        self.present(vc, animated: true, completion: nil)
    }
    
}

