//
//  ViewController.swift
//  CGAffineTransformSample
//
//  Created by 大塚周 on 2021/05/13.
//

import UIKit

class ViewController: UIViewController {

    let sampleView = SampleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sampleView)
        // Do any additional setup after loading the view.
    }

}

class SampleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panObject(_:))))
        addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(pinchObject)))
        addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(rotateObject(_:))))
        addGestureRecognizer((UITapGestureRecognizer(target: self, action: #selector(tapObject(_:)))))
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longPressedObject(_:))))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var rotation: CGFloat = 0
    @objc func panObject(_ sender: UIPanGestureRecognizer) {
        let move: CGPoint = sender.translation(in: self)
        sender.view!.center.x += move.x*self.transform.a + move.y*self.transform.c
        sender.view!.center.y += move.x*self.transform.b + move.y*self.transform.d
        sender.setTranslation(CGPoint.zero, in: self)
    }
    
    @objc func tapObject(_ sender: UITapGestureRecognizer) {
        self.backgroundColor = UIColor.randomColor
    }
    
    @objc func rotateObject(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        self.rotation = rotation
        if sender.state == .began {
            startTransform = self.transform
        }
        self.transform = startTransform.rotated(by: rotation)
    }
    var startTransform: CGAffineTransform!
    @objc func pinchObject(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began {
            startTransform = self.transform
        }
        self.transform = startTransform.scaledBy(x: sender.scale, y: sender.scale)
    }
    
    @objc func tappedObject(_ sender: UIHoverGestureRecognizer) {
        self.backgroundColor = .blue
    }
    @objc func longPressedObject(_ :UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 1.0, animations: {
            self.transform = CGAffineTransform(scaleX: 2, y: 2)
        })
    }
    
}
extension UIColor {
    static var randomColor: UIColor {
        let r = CGFloat.random(in: 0 ... 255) / 255.0
        let g = CGFloat.random(in: 0 ... 255) / 255.0
        let b = CGFloat.random(in: 0 ... 255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
