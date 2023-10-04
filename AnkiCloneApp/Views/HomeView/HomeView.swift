import EventBus
import SnapKit
import UIKit

final class HomeView: UIView, RootView {
    
    private lazy var settingButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "gearshape")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var floatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        let image = UIImage(systemName: "plus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        return button
    }()
    
    private lazy var writeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        let image = UIImage(systemName: "pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.alpha = 0
        
        return button
    }()
    
    func initializeUI() {
        backgroundColor = .systemBackground
        
        
        setUI()
        
        bringSubviewToFront(floatingButton)
        bringSubviewToFront(writeButton)
    }
    
    private func setUI() {
        addSubview(settingButton)
        addSubview(floatingButton)
        addSubview(writeButton)
        
        settingButton.snp.makeConstraints { make in
            make.width.equalTo(37)
            make.height.equalTo(37)
            make.left.equalToSuperview().offset(330)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(0)
        }
        
        floatingButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.bottomMargin.equalToSuperview().offset(-40)
            make.rightMargin.equalToSuperview().offset(-20)
        }
        
        writeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.bottom.equalTo(floatingButton.snp.top).offset(-15)
            make.rightMargin.equalToSuperview().offset(-20)
        }
        
    }
}
