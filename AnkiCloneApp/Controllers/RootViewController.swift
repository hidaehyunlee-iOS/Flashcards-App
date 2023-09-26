import SnapKit
import UIKit

final class RootViewController: UIViewController {
    private lazy var label = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.sizeToFit()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
}
