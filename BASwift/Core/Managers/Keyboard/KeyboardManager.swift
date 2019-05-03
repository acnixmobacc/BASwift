//
//  KeyboardManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class KeyboardManager: NSObject {

    // MARK: - Properties
    var scrollView: UIScrollView

    var oldBottomContentInset: CGFloat

    private let bottomMargin: CGFloat

    // MARK: - Initialization
    public init(withScrollView scrollView: UIScrollView, bottomMargin: CGFloat = 0.0) {
        self.scrollView = scrollView
        self.oldBottomContentInset = scrollView.contentInset.bottom
        self.bottomMargin = bottomMargin
        super.init()
    }

    // MARK: - Observing Methods
    public func startObservingKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)),
                                               name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    public func stopObservingKeyboard() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

    }

    // MARK: - Keyboard Handler Methods
    @objc
    func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo, let value = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
            let keyboardFrame = value.cgRectValue
            let contentInset = UIEdgeInsets(top: scrollView.contentInset.top, left: 0.0, bottom: keyboardFrame.height + bottomMargin, right: 0.0)
            setTableViewEdgeInset(contentInset)
        }
    }

    @objc
    func keyboardDidHide(_ notification: Notification) {
        let contentInset = UIEdgeInsets(top: scrollView.contentInset.top, left: 0.0, bottom: self.oldBottomContentInset, right: 0.0)
        setTableViewEdgeInset(contentInset)
    }

    // MARK: - Private Methods
    private func setTableViewEdgeInset(_ contentInset: UIEdgeInsets) {
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
}
