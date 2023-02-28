//
//  SecondScreen.swift
//  UiWithCode
//
//  Created by Nikita Kuchumov on 23.02.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegistrationScreen: UIViewController {
    
    let topView = TopView()
    let middleView = MiddleView()
    let bottomButton = BottomButton()
    let textFieldView = TextFieldView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .white
        
        setupView()
        setConstraint()
        textFieldView.emailField.delegate = self
        textFieldView.passwordField.delegate = self
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    
    
    
    func setupView() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(topView)
        view.addSubview(middleView)
        
        view.addSubview(bottomButton)
        bottomButton.BottomButton.addTarget(self, action: #selector(goToMainScreen), for: .touchUpInside)
        
        view.addSubview(textFieldView)
    }
    @objc func goToMainScreen() {
        
        if let email = textFieldView.emailField.text, let password = textFieldView.passwordField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let mainScreen = MainScreen()
                    self.navigationController?.pushViewController(mainScreen, animated: true)
                }
            }
        }
    }
    
   
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 200),
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            middleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            middleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            middleView.heightAnchor.constraint(equalToConstant: 150),
            
            bottomButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            bottomButton.heightAnchor.constraint(equalToConstant: 80),
            
            textFieldView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 10),
            textFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textFieldView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
//MARK: - UITextFieldDelegate
extension RegistrationScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

