import UIKit
class MainTopView: UIView {
    
    let profileButton: UIButton =  {
        let button = UIButton()
        button.configuration = .plain()
        button.configuration?.title = "Profile"
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let currencies = ["EUR", "USD", "RUB"]
    static let titleTextAttributesBlack = [NSAttributedString.Key.foregroundColor: UIColor.black]
    static let titleTextAttributesWhite = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    let currencySegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: currencies)
        control.selectedSegmentIndex = 0
        control.backgroundColor = #colorLiteral(red: 0, green: 0.5524268746, blue: 1, alpha: 1)
        control.selectedSegmentTintColor = .white
        control.setTitleTextAttributes(titleTextAttributesWhite, for: .normal)
        control.setTitleTextAttributes(titleTextAttributesBlack, for: .selected)
        control.layer.borderWidth = 1.0
        control.layer.cornerRadius = 5.0
        control.layer.borderColor = UIColor.white.cgColor
        control.layer.masksToBounds = true
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let totalTax: UILabel = {
        let total = UILabel()
        total.font = UIFont(name: "Noto Sans Myanmar", size: 25)
        total.textColor = .white
        total.text = "Your Total Tax is"
        total.translatesAutoresizingMaskIntoConstraints = false
        return total
    }()
    
    let gelLabel: UILabel = {
        let label = UILabel()
        label.text = "GEL"
        label.textColor = .white
        label.font = UIFont(name: "Noto Sans Myanmar", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountLabel: UILabel = {
        let amount = UILabel()
        amount.text = "123"
        amount.textColor = .white
        amount.font = UIFont(name: "Noto Sans Myanmar", size: 55)
        amount.translatesAutoresizingMaskIntoConstraints = false
        return amount
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Layout

extension MainTopView {
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            profileButton.widthAnchor.constraint(equalToConstant: 80),
            profileButton.heightAnchor.constraint(equalToConstant: 40),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            profileButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            
            currencySegmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            currencySegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            currencySegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            totalTax.heightAnchor.constraint(equalToConstant: 25),
            totalTax.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalTax.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            
            amountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            amountLabel.topAnchor.constraint(equalTo: totalTax.bottomAnchor, constant: 10),
            
            gelLabel.heightAnchor.constraint(equalTo: amountLabel.heightAnchor),
            gelLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -20),
            gelLabel.bottomAnchor.constraint(equalTo: amountLabel.bottomAnchor)
        ])
    }
}

//MARK: - SetupView
extension MainTopView {
    func setupView() {
        backgroundColor = #colorLiteral(red: 0, green: 0.5524268746, blue: 1, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileButton)
        addSubview(currencySegmentedControl)
        addSubview(totalTax)
        addSubview(gelLabel)
        addSubview(amountLabel)
    }
}
