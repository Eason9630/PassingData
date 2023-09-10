//
//  SecondViewController.swift
//  PassingData
//
//  Created by 林祔利 on 2023/9/9.
//

import UIKit

//Conpletion Header closure model
class SecondViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Name: -"
        return label
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        view.addSubview(label)
        
        label.frame = CGRect(x: 0, y: 50, width: view.bounds.size.width, height: 100)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Set Name", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(noti:)), name: Notification.Name("Message"), object: nil)
        
    }
    
    @objc func getNotification(noti: Notification) {
        if let userInfo = noti.userInfo,let message = userInfo["message"] as? String{
            DispatchQueue.main.async {
                self.label.text = message
            }
        }
    }
    
    @objc private func didTapButton() {
        let textEntry = TextEntryViewController()
        textEntry.completion = { [weak self] text in
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        let vc = UINavigationController(rootViewController: textEntry)
        present(vc,animated: true)
    }

}
