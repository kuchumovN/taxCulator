//
//  SecondScreen.swift
//  UiWithCode
//
//  Created by Nikita Kuchumov on 23.02.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginScreen: UIViewController {
    
    let topView = TopView()
    let middleView = MiddleView()
    let bottomButton = BottomButton()
    let textFieldView = TextFieldView()
    let toast = ErrorToast()
    
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
    
    func showToast(message: String) {
        toast.label.text = "\(message)"
        self.view.addSubview(toast)
        toast.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -55).isActive = true
        toast.heightAnchor.constraint(equalToConstant: 40).isActive = true
        toast.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        toast.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        ErrorToast.animate(withDuration: 3.0, delay: 0.01, options: .curveLinear, animations: {
            self.toast.label.alpha = 0.0
        }, completion: {(isCompleted) in
            self.toast.removeFromSuperview()
            self.toast.label.alpha = 1.0
        })
    }
    
    
    @objc func goToMainScreen() {
        
        if let email = textFieldView.emailField.text, let password = textFieldView.passwordField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    self.showToast(message: "\(e.localizedDescription)")
                    
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
            textFieldView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
}

//MARK: - UITextFieldDelegate
extension LoginScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
