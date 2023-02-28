import UIKit

class ErrorToast: UIView {
    
    let label: UILabel =  {
        
        let label = UILabel()
        label.text = "ErrorMessage"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Noto Sans Myanmar", size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    

    override init(frame: CGRect) { //ViewDidLoad
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 20
        setupViews()
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            label.widthAnchor.constraint(equalTo: widthAnchor, constant:  -10),
            label.topAnchor.constraint(equalTo: topAnchor, constant: -15),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
            
          
            
        ])
    }
}
