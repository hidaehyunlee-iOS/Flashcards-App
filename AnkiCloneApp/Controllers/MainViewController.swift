import UIKit

final class MainViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewControllers([HomeViewController()], animated: false)
    }
}
