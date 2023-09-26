import EventBus
import UIKit

struct PushToSettingScreenEvent: EventProtocol {
    let payload: Void = ()
}

final class HomeViewController: RootViewController<HomeView> {
    override func viewDidLoad() {
        super.viewDidLoad()

        EventBus.shared.on(PushToSettingScreenEvent.self, by: self) { listener, _ in
            listener.navigationController?.pushViewController(SettingViewController(), animated: true)
        }
    }
}
