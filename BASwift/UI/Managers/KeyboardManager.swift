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

    // MARK: - Initialization
    public init(withScrollView scrollView: UIScrollView) {
        self.scrollView = scrollView
        self.oldBottomContentInset = scrollView.contentInset.bottom
        super.init()
    }

    // MARK: - Observing Methods
    public func startObservingKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: .UIKeyboardDidHide, object: nil)
    }

    public func stopObservingKeyboard() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

    // MARK: - Keyboard Handler Methods
    @objc
    func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo, let value = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue {
            let keyboardFrame = value.cgRectValue
            let contentInset = UIEdgeInsets(top: scrollView.contentInset.top, left: 0.0, bottom: keyboardFrame.height, right: 0.0)
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
