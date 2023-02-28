import UIKit


class MainScreen: UIViewController {
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .red
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
    }


}

//MARK: - SetupConstraints
extension MainScreen {
    
    func setupConstraints() {
    }
}
