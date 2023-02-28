import UIKit

class TextFieldView: UIView {
    
    
    //MARK: - UITextFields
    let emailField: UITextField =  {
        
        let emailField = UITextField()
        emailField.borderStyle = .none
        emailField.textColor = .black
        emailField.placeholder = "Email"
        emailField.keyboardType = .emailAddress
        
        //MARK: - Underlined UITextField
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 30, 340 - 1, 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        emailField.layer.addSublayer(bottomLine)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    let passwordField: UITextField =  {
        
        let passwordField = UITextField()
        passwordField.borderStyle = .none
        passwordField.textColor = .black
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry.toggle()
        //passwordField.isSecureTextEntry = true
        
        //MARK: - Underlined UITextField
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 30, 340 - 1, 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        passwordField.layer.addSublayer(bottomLine)
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    //MARK: - UILabels
    
    let emailLabel: UILabel = {
        
        let emailLabel = UILabel()
        emailLabel.textColor = #colorLiteral(red: 0.2470588235, green: 0.2470588235, blue: 0.2470588235, alpha: 1)
        emailLabel.textAlignment = .left
        emailLabel.text = "E-mail"
        emailLabel.font = UIFont(name: "Noto Sans Myanmar", size: 15)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    let passwordLabel: UILabel = {
        
        let passwordLabel = UILabel()
        passwordLabel.textColor = #colorLiteral(red: 0.2470588235, green: 0.2470588235, blue: 0.2470588235, alpha: 1)
        passwordLabel.textAlignment = .left
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Noto Sans Myanmar", size: 15)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayout()
    }
    required init?(coder: NSCoder) {
        
        fatalError("error")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(emailField)
        addSubview(emailLabel)
        emailField.addTarget(self, action: #selector(self.textFieldShouldBeginEditing(_:)), for: .editingDidBegin)
        emailField.addTarget(self, action: #selector(self.textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        
        addSubview(passwordField)
        addSubview(passwordLabel)
        passwordField.addTarget(self, action: #selector(self.textFieldShouldBeginEditing(_:)), for: .editingDidBegin)
        passwordField.addTarget(self, action: #selector(self.textFieldDidEndEditing(_:)), for: .editingDidEnd)
    }
    
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            emailField.heightAnchor.constraint(equalToConstant: 30),
            emailField.widthAnchor.constraint(equalToConstant: 340),
            emailField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
            emailLabel.widthAnchor.constraint(equalToConstant: 50),
            emailLabel.bottomAnchor.constraint(equalTo: emailField.topAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
            passwordLabel.widthAnchor.constraint(equalToConstant: 90),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            
            passwordField.widthAnchor.constraint(equalToConstant: 340),
            passwordField.heightAnchor.constraint(equalToConstant: 30),
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor)
            
            
        ])
    }
    
    //MARK: - UITextFieldMethods
    
    @objc func textFieldShouldBeginEditing(_ textField: UITextField) {
        let blueUnderline = CALayer()
        blueUnderline.frame = CGRectMake(0.0, 30, 340 - 1, 1.0)
        blueUnderline.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        textField.layer.addSublayer(blueUnderline)
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        let greyUnderline = CALayer()
        greyUnderline.frame = CGRectMake(0.0, 30, 340 - 1, 1.0)
        greyUnderline.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        textField.layer.addSublayer(greyUnderline)
    }
}



