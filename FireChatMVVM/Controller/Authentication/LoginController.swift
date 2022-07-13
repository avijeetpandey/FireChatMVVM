//
//  LoginController.swift
//  FireChatMVVM
//
//  Created by Avijeet Pandey on 13/07/22.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: Properties
    private let iconImage: UIImageView =  {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let containerview = UIView()
        
        let iv = UIImageView()
        let image = UIImage(systemName: "envelope")
        iv.image = image
        iv.tintColor = .white
        
        containerview.addSubview(iv)
        iv.centerY(inView: containerview)
        iv.anchor(left: containerview.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 24)
        
        containerview.addSubview(emailTextField)
        emailTextField.centerY(inView: containerview)
        emailTextField.anchor(left: iv.rightAnchor,
                              bottom: containerview.bottomAnchor,
                              right: containerview.rightAnchor,
                              paddingLeft: 8,
                              paddingBottom: 4)
        
        containerview.setHeight(height: 50)
        return containerview
    }()
    
    private lazy var passwordContainerView: UIView = {
        let containerview = UIView()
        
        let iv = UIImageView()
        let image = UIImage(systemName: "lock")
        iv.image = image
        iv.tintColor = .white
        
        containerview.addSubview(iv)
        iv.centerY(inView: containerview)
        iv.anchor(left: containerview.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 24)
        
        containerview.addSubview(passwordTextField)
        passwordTextField.centerY(inView: containerview)
        passwordTextField.anchor(left: iv.rightAnchor,
                                 bottom: containerview.bottomAnchor,
                                 right: containerview.rightAnchor,
                                 paddingLeft: 8,
                                 paddingBottom: 4)
        
        containerview.setHeight(height: 50)
        return containerview
    }()
    
    private let authButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemRed
        button.setHeight(height: 50)
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Helpers
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.backgroundColor = .systemPink
        
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView,
                                                       passwordContainerView,
                                                       authButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        
        stackView.anchor(top: iconImage.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 32,
                         paddingLeft: 32,
                         paddingRight: 32)
    }
    
    func configureGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
