//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class MyView: UIView {
    
    let scrollView: UIScrollView
    let contentView: UIView
    let textField: UITextField
    
    override init(frame: CGRect) {
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        
        backgroundColor = .white
        scrollView.backgroundColor = randomColor()
        contentView.backgroundColor = randomColor()
        textField.backgroundColor = randomColor()
        
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textField)
        
        let views = ["scrollView": scrollView, "contentView": contentView, "textField": textField]
        
        var constraints = [NSLayoutConstraint]()
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-0-[scrollView]-0-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollView]-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-0-[contentView]-0-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[contentView]-|", options: [], metrics: nil, views: views)
        constraints.append(contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor))
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[textField]-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textField(100)]", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // thx to
    // @asarode
    // https://gist.github.com/asarode/7b343fa3fab5913690ef
    
    func randomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
}

class MyViewController: UIViewController {
    
    override func loadView() {
        view = MyView()
    }
}

PlaygroundPage.current.liveView = MyViewController()
