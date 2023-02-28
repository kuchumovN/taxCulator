import UIKit

class MiddleView: UIView {
    
    let Header: UILabel =  {
        
        let label = UILabel()
        label.text = "Let's start"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Noto Sans Myanmar", size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let SubHeader: UILabel =  {
        
        let subHeader = UILabel()
        subHeader.text = "Welcome to Taxculator! App that helps you to calculate taxes and track them."
        subHeader.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
        subHeader.font = UIFont(name: "Noto Sans Myanmar", size: 17)
        subHeader.numberOfLines = 2
        subHeader.adjustsFontSizeToFitWidth = true
        subHeader.textAlignment = .center
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        return subHeader
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
        addSubview(Header)
        addSubview(SubHeader)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            Header.centerXAnchor.constraint(equalTo: centerXAnchor),
            Header.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            SubHeader.topAnchor.constraint(equalTo: Header.bottomAnchor, constant: 5),
            SubHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            SubHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
            
        ])
    }
}
