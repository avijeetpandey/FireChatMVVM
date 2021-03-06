//
//  LoginController.swift
//  FireChatMVVM
//
//  Created by Avijeet Pandey on 13/07/22.
//

import UIKit

class LoginController: UIViewController {
    
    private var viewModel: LoginViewModel = LoginViewModel()
    
    // MARK: Properties
    private let iconImage: UIImageView =  {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "lock")!, textField: passwordTextField)
    }()
    
    private let authButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.isEnabled = false
        return button
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Enter email")
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Enter password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton()
        let attributtedTitle = NSMutableAttributedString(string: "Dont have an account? ",
                                                         attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                      .foregroundColor: UIColor.white])
        attributtedTitle.append(NSAttributedString(string: "Sign up", attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                                   .foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributtedTitle, for: .normal)
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
        navigationController?.pushViewController(RegistrationController(), animated: true)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        checkFormStatus()
    }
    
    // MARK: Helpers
    
    func checkFormStatus(){
        if viewModel.formIsValid {
            authButton.isEnabled = false
            authButton.backgroundColor = .systemPink
        } else {
            authButton.isEnabled = false
            authButton.backgroundColor = .gray
        }
    }
    
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
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 8,
                                     paddingBottom: 32,
                                     paddingRight: 8)
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}
