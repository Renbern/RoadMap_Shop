//
//  OnboardingPageViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 12.10.2022.
//

import UIKit

/// Конфигурация пейдж контроллера
class OnboardingPageViewController: UIPageViewController {

    // MARK: - Private properties
    private var pages: [OnboardingHelper] = []
    private var currentIndex = 0
    private let firstPage = UIImage(named: Constants.OnboardingImage.firstImage)
    private let secondPage = UIImage(named: Constants.OnboardingImage.secondImage)
    private let thirdPage = UIImage(named: Constants.OnboardingImage.thirdImage)
    private let proxy = UIPageControl.appearance()

    private lazy var skipButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle(Constants.OnboardingButtonText.skip, for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(showMainAppAction), for: .touchUpInside)
        button.frame = CGRect(x: 30, y: 790, width: 100, height: 30)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle(Constants.OnboardingButtonText.next, for: .normal)
        button.addTarget(self, action: #selector(moveToNextPage), for: .touchUpInside)
        button.frame = CGRect(x: 280, y: 790, width: 100, height: 30)
        return button
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle(Constants.OnboardingButtonText.getStarted, for: .normal)
        button.addTarget(self, action: #selector(showMainAppAction), for: .touchUpInside)
        button.frame = CGRect(x: 150, y: 790, width: 100, height: 30)
        button.backgroundColor = .white
        button.isHidden = true
        return button
    }()
    private lazy var onboardingViewControllers: [OnboardingViewController] = {
        var pagesVC: [OnboardingViewController] = []
        for page in pages {
            pagesVC.append(OnboardingViewController(pageWith: page))
        }
        return pagesVC
    }()
    
    // MARK: - Init
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        view.backgroundColor = .white
        self.dataSource = self
        self.delegate = self
        setViewControllers([onboardingViewControllers[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func configuratePageControl() {
        proxy.pageIndicatorTintColor = .gray
        proxy.currentPageIndicatorTintColor = .systemBlue
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(getStartedButton)
    }
    
    private func findPageControl(isHidden: Bool) {
        for subview in view.subviews where subview is UIPageControl {
            subview.isHidden = isHidden
        }
    }
    
    private func setupUI() {
        guard let firstImage = firstPage, let secondImage = secondPage, let thirdImage = thirdPage else { return }
        let first = OnboardingHelper(
            title: Constants.OnboardingText.firstTitle,
            text: Constants.OnboardingText.firstText,
            image: firstImage
        )
        let second = OnboardingHelper(
            title: Constants.OnboardingText.secondTitle,
            text: Constants.OnboardingText.secondText,
            image: secondImage
        )
        let third = OnboardingHelper(
            title: Constants.OnboardingText.thirdTitle,
            text: Constants.OnboardingText.thirdText,
            image: thirdImage
        )
        pages.append(first)
        pages.append(second)
        pages.append(third)
        configuratePageControl()
    }
    
    private func isLastView(index: Int) {
        if index == onboardingViewControllers.count - 1 {
            skipButton.isHidden = true
            nextButton.isHidden = true
            getStartedButton.isHidden = false
            findPageControl(isHidden: true)
        } else {
            skipButton.isHidden = false
            nextButton.isHidden = false
            getStartedButton.isHidden = true
            findPageControl(isHidden: false)
        }
    }
    
    @objc private func showMainAppAction() {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: Constants.OnboardingText.userDefaultsKey)
        let tabBarVC = MainTabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    @objc private func moveToNextPage() {
        guard let currentViewController = viewControllers?.first,
                 let nextViewController = dataSource?.pageViewController(
                    self,
                    viewControllerAfter: currentViewController
                 ) else { return }
             if nextViewController == onboardingViewControllers.last {
                 skipButton.isHidden = true
                 nextButton.isHidden = true
                 getStartedButton.isHidden = false
                 findPageControl(isHidden: true)
             }
             setViewControllers([nextViewController], direction: .forward, animated: true)
         }
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? OnboardingViewController else { return nil }
        if let index = onboardingViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                currentIndex -= 1
                isLastView(index: index)
                return onboardingViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? OnboardingViewController else { return nil }
        if let index = onboardingViewControllers.firstIndex(of: viewController) {
            if index < pages.count - 1 {
                currentIndex += 1
                isLastView(index: index)
                return onboardingViewControllers[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func pageViewController(
            _ pageViewController: UIPageViewController,
            willTransitionTo pendingViewControllers: [UIViewController]
        ) {
            guard let nextVCOptional = pendingViewControllers.first,
                let nextVC = nextVCOptional as? OnboardingViewController,
                let index = onboardingViewControllers.firstIndex(of: nextVC) else { return }
            switch index {
            case onboardingViewControllers.indices.last:
                isLastView(index: index)
            default:
                isLastView(index: index)
            }
        }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
}
