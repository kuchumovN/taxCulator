//
//  RateView.swift
//  UiWithCode
//
//  Created by Nikita Kuchumov on 01.03.2023.
//

import UIKit

class RateView: UIView {
    
    let bogIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "bogIcon")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let refreshButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "refreshIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let bogLabel: UILabel = {
        let bogLabel = UILabel()
        bogLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        bogLabel.text = "National bank of Georgia"
        bogLabel.textColor = .black
        bogLabel.numberOfLines = 0
        bogLabel.textAlignment = .left
        bogLabel.addInterlineSpacing(spacingValue: 2.5)
        bogLabel.translatesAutoresizingMaskIntoConstraints = false
        return bogLabel
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        label.text = "1 EUR = 3.1 GEl"
        label.textColor = #colorLiteral(red: 0.6251094341, green: 0.6256788373, blue: 0.6430239081, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(bogIcon)
        addSubview(bogLabel)
        addSubview(refreshButton)
        addSubview(rateLabel)
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            bogIcon.centerYAnchor.constraint(equalTo: bogLabel.centerYAnchor),
            bogIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            bogIcon.heightAnchor.constraint(equalToConstant: 64),
            bogIcon.widthAnchor.constraint(equalToConstant: 64),
            
            bogLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            bogLabel.widthAnchor.constraint(equalToConstant: 164),
            bogLabel.leadingAnchor.constraint(equalTo: bogIcon.trailingAnchor, constant: 8),
            
            rateLabel.leadingAnchor.constraint(equalTo: bogLabel.leadingAnchor),
            rateLabel.topAnchor.constraint(equalTo: bogLabel.bottomAnchor, constant: 6),
            
            refreshButton.heightAnchor.constraint(equalToConstant: 16),
            refreshButton.widthAnchor.constraint(equalToConstant: 16),
            refreshButton.centerYAnchor.constraint(equalTo: bogLabel.centerYAnchor),
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
            
        ])
    }
}
private extension UILabel {

    // MARK: - spacingValue is spacing that you need
    func addInterlineSpacing(spacingValue: CGFloat = 2) {

        // MARK: - Check if there's any text
        guard let textString = text else { return }

        // MARK: - Create "NSMutableAttributedString" with your text
        let attributedString = NSMutableAttributedString(string: textString)

        // MARK: - Create instance of "NSMutableParagraphStyle"
        let paragraphStyle = NSMutableParagraphStyle()

        // MARK: - Actually adding spacing we need to ParagraphStyle
        paragraphStyle.lineSpacing = spacingValue

        // MARK: - Adding ParagraphStyle to your attributed String
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))

        // MARK: - Assign string that you've modified to current attributed Text
        attributedText = attributedString
    }

}
