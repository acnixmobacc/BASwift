//
//  FormView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public class FormView: UIView {

    // MARK: - UIFields
    lazy public var scrollView: UIScrollView = {
        let instance = UIScrollView()
        instance.translatesAutoresizingMaskIntoConstraints = false
        instance.layoutMargins = .zero
        return instance
    }()

    lazy var stackView: UIStackView = {
        let instance = UIStackView()
        instance.translatesAutoresizingMaskIntoConstraints = false
        instance.axis = .vertical
        instance.distribution = .equalSpacing
        instance.spacing = 8.0
        return instance
    }()

    // MARK: - Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    public func add(_ view: IFormItemView & UIView) {
        addHeightConstraint(toView: view)
        stackView.addArrangedSubview(view)
    }
    
    public func add(_ view:IFormItemView & UIView, at index:Int){
        if index > stackView.arrangedSubviews.count{
            fatalError("Index out of range, stack view size = \(stackView.arrangedSubviews.count)")
        }
        addHeightConstraint(toView: view)
        stackView.insertArrangedSubview(view, at: index)
    }
    
    public func add(_ view:IFormItemView & UIView, after aView:IFormItemView & UIView){
        guard let index = stackView.arrangedSubviews.index(of: aView) else{
            fatalError("Stack view doesn't contains \(aView)")
        }
        add(view, at: index + 1)
    }

    public func add(_ views: [IFormItemView & UIView]) {
        for view in views {
            add(view)
        }
    }
    
    public func remove(_ view:IFormItemView & UIView){
        stackView.removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    public func validate() {
        for item in stackView.arrangedSubviews {
            guard let formItem = item as? IFormItemView else { continue }
            guard let validation = formItem.onValidation else { continue }
            if validation() {
                formItem.onSuccess()
            } else {
                formItem.onError()
            }
        }
    }

    // MARK: - Private Methods
    private func setupUI() {
        addSubview(scrollView)
        setScrollViewConstraint()
        scrollView.addSubview(stackView)
        setStackViewContraint()
    }

    private func addHeightConstraint(toView view:IFormItemView & UIView){
        let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                  multiplier: 1, constant: view.height)
        view.addConstraint(heightConstraint)
    }
    
    fileprivate func setScrollViewConstraint() {
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    fileprivate func setStackViewContraint() {

        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

}
