import UIKit

final class KeyboardHandler {
    weak var view: UIView?
    private let offset: Double

    init(view: UIView, offset: Double? = nil) {
        self.view = view
        self.offset = offset ?? 30.0
    }

    func register(view: UIView) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func unregister() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let view else { return }

        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else { return }

        let keyboardHeight = keyboardFrame.cgRectValue.height
        if let activeTextField = findFirstResponder(in: view) {
            let textFieldBottomPoint = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
            let overlap = textFieldBottomPoint - (view.bounds.height - keyboardHeight) + offset

            if overlap > 0 {
                view.frame.origin.y = -overlap
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        view?.frame.origin.y = .zero
    }

    private func findFirstResponder(in view: UIView) -> UITextField? {
        if let textField = view as? UITextField, textField.isFirstResponder {
            return textField
        }

        for subview in view.subviews {
            if let activeTextField = findFirstResponder(in: subview) {
                return activeTextField
            }
        }
        return nil
    }
}
