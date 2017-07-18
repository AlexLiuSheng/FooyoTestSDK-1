//
//  ViewController.swift
//  SmartSentosa
//
//  Created by Yangfan Liu on 15/2/17.
//  Copyright © 2017 Yangfan Liu. All rights reserved.
//

import UIKit
import SnapKit
//
class ViewController: UIViewController {
    var button: UIButton! = {
        let t = UIButton()
        t.backgroundColor = .red
        t.setTitle("test", for: .normal)
        return t
    }()
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(sdkHandler), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
        
    }
//
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func sdkHandler() {
        let vc = NewItineraryViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
