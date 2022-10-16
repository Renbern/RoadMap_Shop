//
//  OnboardingViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 12.10.2022.
//

import UIKit

/// Конфигурация онбординга
final class OnboardingViewController: UIViewController {
    
    // MARK: Private properties
    private lazy var currentImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var subview: [UIView] = [currentImage, pageTitleLabel, pageTextLabel]
    
    private let pageTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Hoefler Text Black", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 20, y: 550, width: 350, height: 100)
        return label
    }()
    
    private let pageTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Hoefler Text", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 600, width: 350, height: 150)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: - Init
    init(pageWith: OnboardingHelper) {
        super.init(nibName: nil, bundle: nil)
        edgesForExtendedLayout = []
        currentImage.image = pageWith.imageName
        currentImage.contentMode = .scaleAspectFill
        pageTitleLabel.text = pageWith.title
        pageTextLabel.text = pageWith.text
        
        for view in subview { self.view.addSubview(view) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialLabelsAlpha()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        labelAnimation()
    }
    
    // MARK: - Private methods
    @objc private func showMainAppAction() {
        dismiss(animated: true)
    }
    
    private func labelAnimation() {
        if pageTitleLabel.alpha == 0,
           pageTextLabel.alpha == 0 {
            UILabel.animate(withDuration: 2.5) {
                self.pageTitleLabel.alpha = 1
                self.pageTextLabel.alpha = 1
            }
        } else {
            UILabel.animate(withDuration: 2.5) {
                self.pageTitleLabel.alpha = 0
                self.pageTextLabel.alpha = 0
            }
        }
    }
    
    private func setInitialLabelsAlpha() {
        pageTitleLabel.alpha = 0
        pageTextLabel.alpha = 0
    }
}
