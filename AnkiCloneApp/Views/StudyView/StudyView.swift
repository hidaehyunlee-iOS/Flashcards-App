import SnapKit
import UIKit

final class StudyView: UIView, RootView {
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        
        //그림자
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowOpacity = 0.7 //그림자 투명도
        view.layer.shadowRadius = 5  //퍼지는 효과
        
        return view
    }()
    
    private var answerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap to show answer", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //initializeUI() -> 호출 필요 없음. RootViewController에서 rootView.initializeUI() 해주고 있음
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeUI() {
        addSubview(collectionView)
        addSubview(answerButton)
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(450)
            make.center.equalToSuperview()
        }
        answerButton.snp.makeConstraints{ make in
            make.width.equalTo(270)
            make.height.equalTo(50)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
