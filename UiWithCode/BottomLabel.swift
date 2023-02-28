
import UIKit

class BottomView: UIView {
    
    let Footer: UILabel =  {
        
        let footer = UILabel()
        footer.text = "By continuing you are indicating that you agree to the Terms and Privacy Policy."
        footer.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        footer.font = UIFont(name: "Noto Sans Myanmar", size: 13)
        footer.textAlignment = .center
        footer.numberOfLines = 2
        footer.adjustsFontSizeToFitWidth = true
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
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
        addSubview(Footer)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            Footer.centerXAnchor.constraint(equalTo: centerXAnchor),
            Footer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            Footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            Footer.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
    }
}
