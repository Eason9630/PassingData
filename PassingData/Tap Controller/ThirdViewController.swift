//
//  ThirdViewController.swift
//  PassingData
//
//  Created by 林祔利 on 2023/9/9.
//

import UIKit

// NotificationCenter
class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("Fire Event", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapNotificatButton), for: .touchUpInside)

    }
    
    @objc func didTapNotificatButton() {
        //傳送文字給 SecondViewController
        NotificationCenter.default.post(name: Notification.Name("Message"), object: self, userInfo: ["message": "我是Notification Hello"])
//        傳送物件給 ViewController
//        NotificationCenter.default.post(name: Notification.Name("ourCustom"), object: ["color": UIColor.red])
    }


}
