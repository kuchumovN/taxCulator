import UIKit


class MainScreen: UIViewController {
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    
    let mainTopView = MainTopView()
    let rateView = RateView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(mainTopView)
        view.addSubview(rateView)
    }


}

//MARK: - SetupConstraints
extension MainScreen {
    
    func setupConstraints() {
        mainTopView.heightAnchor.constraint(equalToConstant: 375).isActive = true
        mainTopView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        mainTopView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTopView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainTopView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        rateView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rateView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4).isActive = true
        rateView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4).isActive = true
        rateView.topAnchor.constraint(equalTo: mainTopView.bottomAnchor, constant: 16).isActive = true
    }
}
