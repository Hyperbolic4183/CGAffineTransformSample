//
//  ViewController.swift
//  CGAffineTransformSample
//
//  Created by 大塚周 on 2021/05/13.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
        // Do any additional setup after loading the view.
    }

    func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        button.backgroundColor = .blue
        button.setTitle("ボタン", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        UIView.animate(withDuration: 1.0, delay: 0,options: .curveEaseOut,animations: {
            self.button.transform = CGAffineTransform(scaleX: 2, y: 2)
        })
    }
    
}

