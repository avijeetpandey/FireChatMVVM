//
//  RegistrationController.swift
//  FireChatMVVM
//
//  Created by Avijeet Pandey on 13/07/22.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: Properties
    private let emailTextField: CustomTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let userNameTextField: CustomTextField = CustomTextField(placeholder: "Username")
    
    private let fullNameTextField: CustomTextField = CustomTextField(placeholder: "Full Name")
    
    private lazy var emailViewContainer: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "lock")!, textField: passwordTextField)
    }()
    
    private lazy var fullNameContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "person.fill")!, textField: fullNameTextField)
    }()
    
    private lazy var userNameContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "person.fill")!, textField: userNameTextField)
    }()
    
    private let alreadyHaveAnAccountButton: UIButton = {
        let button = UIButton()
        let attributtedTitle = NSMutableAttributedString(string: "Already have an account? ",
                                                         attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                      .foregroundColor: UIColor.white])
        attributtedTitle.append(NSAttributedString(string: "Log in", attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                                   .foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributtedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setHeight(height: 50)
        button.backgroundColor = .systemPink
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleShowSignup), for: .touchUpInside)
        return button
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleShowSignup(){
        print("Singup clicked")
    }
    
    @objc func handleShowLogin(){
        navigationController?.pushViewController(LoginController(), animated: true)
    }
    
    // MARK: Helpers
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.backgroundColor = .systemPink
        
        configureGradientLayer()
        
        let stackView = UIStackView(arrangedSubviews: [emailViewContainer,
                                                       passwordContainerView,
                                                       userNameContainerView,
                                                       fullNameContainerView,
                                                       signupButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 100,
                         paddingLeft: 16,
                         paddingRight: 16)
        
        view.addSubview(alreadyHaveAnAccountButton)
        alreadyHaveAnAccountButton.anchor(left: view.leftAnchor,
                                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                          right: view.rightAnchor,
                                          paddingLeft: 16,
                                          paddingRight: 16)
    }
}
