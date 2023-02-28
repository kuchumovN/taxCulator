
import UIKit

class BottomButton: UIView {
    
    let BottomButton: UIButton =  {
        
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemBlue
        button.configuration?.title = "asdasdasdasdasd"
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) { //ViewDidLoad
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(BottomButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
           
            BottomButton.widthAnchor.constraint(equalToConstant: 350),
            BottomButton.heightAnchor.constraint(equalToConstant: 50),
            BottomButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            BottomButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
