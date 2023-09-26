import SnapKit
import UIKit

final class StudyView: UIView, RootView {
    private lazy var label = {
        let label = UILabel()
        label.text = "Study Screen"
        label.sizeToFit()
        return label
    }()

    func initializeUI() {
        backgroundColor = .systemBackground

        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }
}
