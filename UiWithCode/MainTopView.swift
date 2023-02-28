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
    
    let currencySegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: currencies)
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = .white
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
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
            
            currencySegmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            currencySegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            currencySegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
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
    }
}
