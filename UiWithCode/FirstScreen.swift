//
//  ViewController.swift
//  UiWithCode
//
//  Created by Nikita Kuchumov on 23.02.2023.
//

import UIKit


class FirstScreen: UIViewController {
    
    let registrationButton: UIButton = {
        
        let regButton = UIButton()
        regButton.configuration = .filled()
        regButton.configuration?.baseBackgroundColor = .systemBlue
        regButton.configuration?.title = "Register"
        regButton.layer.masksToBounds = true
        regButton.layer.cornerRadius = 20
        regButton.translatesAutoresizingMaskIntoConstraints = false
        return regButton
    }()
    
    let loginButton: UIButton = {
        
        let logButton = UIButton()
        logButton.configuration = .filled()
        logButton.configuration?.baseBackgroundColor = .systemBlue
        logButton.configuration?.title = "Login"
        logButton.layer.masksToBounds = true
        logButton.layer.cornerRadius = 20
        logButton.translatesAutoresizingMaskIntoConstraints = false
        return logButton
    }()
    
    let topView = TopView()
    let middleView = MiddleView()
    let bottomView = BottomView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        view.addSubview(registrationButton)
        registrationButton.addTarget(self, action: #selector(goToRegistrationScreen), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(goToLoginScreen), for: .touchUpInside)
        
        view.addSubview(topView)
        view.addSubview(middleView)
        view.addSubview(bottomView)
    }
    
    @objc func goToRegistrationScreen() {
        
        let registerScreen = RegistrationScreen()
        registerScreen.middleView.Header.text = "Registration"
        registerScreen.middleView.SubHeader.text = "Create an account, save all your expenses in one secure place!"
        
        registerScreen.bottomButton.BottomButton.configuration?.title = "Register"
        navigationController?.pushViewController(registerScreen, animated: true)
    }
    
    @objc func goToLoginScreen() {
        
        let loginScreen = LoginScreen()
        loginScreen.middleView.Header.text = "Login"
        loginScreen.middleView.SubHeader.text = "Dive into your account, save all your expenses in one secure place!"
        
        loginScreen.bottomButton.BottomButton.configuration?.title = "Login"
        navigationController?.pushViewController(loginScreen, animated: true)
    }
}

//MARK: - SetupConstraints
extension FirstScreen {
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            registrationButton.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 400),
            registrationButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            registrationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            registrationButton.widthAnchor.constraint(equalToConstant: 170),
            registrationButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.widthAnchor.constraint(equalToConstant: 170),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 400),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: registrationButton.leadingAnchor, constant: -10),
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 200),
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            middleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            middleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            middleView.heightAnchor.constraint(equalToConstant: 150),
            
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            
            
            
            
            
        ])
    }
}
