//
//  InputContainerView.swift
//  FireChatMVVM
//
//  Created by Avijeet Pandey on 13/07/22.
//

import UIKit

class InputContainerView: UIView {
    init(image: UIImage, textField: UITextField) {
        super.init(frame: .zero)
        
        setHeight(height: 50)
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .white
        imageView.alpha = 0.87
        
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 28, width: 28)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: imageView.rightAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingLeft: 8,
                         paddingBottom: -8)

        let dividerView = UIView()
        addSubview(dividerView)
        dividerView.backgroundColor = .white
        dividerView.anchor(left: leftAnchor,
                           bottom: bottomAnchor,
                           right: rightAnchor,
                           paddingLeft: 0,
                           height: 0.75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
