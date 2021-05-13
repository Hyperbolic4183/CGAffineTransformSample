//
//  ViewController.swift
//  CGAffineTransformSample
//
//  Created by 大塚周 on 2021/05/13.
//

import UIKit

class ViewController: UIViewController {

    let springButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSpringButton()
        // Do any additional setup after loading the view.
    }

    func setupSpringButton() {
        springButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(springButton)
        NSLayoutConstraint.activate([
            springButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            springButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            springButton.widthAnchor.constraint(equalToConstant: 200),
            springButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        springButton.layer.cornerRadius = 60/2
        springButton.layer.cornerCurve = .continuous
        springButton.backgroundColor = .blue
        springButton.setTitle("ボタン", for: .normal)
        springButton.addTarget(self, action: #selector(sprintButtonTapped), for: .touchUpInside)
    }
    
    @objc func sprintButtonTapped(sender: UIButton) {
        animateView(sender)
    }
    
    func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }) { (_) in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                viewToAnimate.transform = .identity
                
            }, completion: nil)
        }
    }
}

