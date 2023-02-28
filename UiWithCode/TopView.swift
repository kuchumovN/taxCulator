import UIKit


class TopView: UIView {
    
    let CloudImage: UIImageView =  {
        
        let image = UIImageView()
        image.image = UIImage(named: "topClouds")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let DollarImage: UIImageView =  {
        
        let dollar = UIImageView()
        dollar.image = UIImage(named: "dollarSign")
        dollar.translatesAutoresizingMaskIntoConstraints = false
        return dollar
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
        addSubview(CloudImage)
        addSubview(DollarImage)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            CloudImage.topAnchor.constraint(equalTo: topAnchor),
            CloudImage.heightAnchor.constraint(equalToConstant: 160),
            CloudImage.widthAnchor.constraint(equalToConstant: 450),
            
            DollarImage.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            DollarImage.heightAnchor.constraint(equalToConstant: 120),
            DollarImage.widthAnchor.constraint(equalToConstant: 120),
            DollarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150)
        ])
    }
}
