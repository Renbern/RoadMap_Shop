//
//  ViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 06.10.2022.
//

import UIKit

// MARK: - start screen
final class SearchViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        enum TextForUIElements {
            static let searchLabelText = "Поиск"
            static let searchTextFieldPlaceholder = "Поиск по продуктам и магазинам"
            static let recentlyViewedProductLabelText = "Недавно просмотренные"
            static let clearButtonText = "Очистить"
            static let requestLabelText = "Варианты запросов"
            static let airPodsRequestLabelText = "AirPods"
            static let appleCareRequestLabelText = "Apple Care"
            static let beatsRequestLabelText = "Beats"
            static let compareModelsLabelText = "Сравните модели iPhone"
        }
        
        enum ProductText {
            static let caseBlackNameLabelText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
            static let appleWatchStrapLabelText = "Спортивный ремешок Black Unity (для к"
            static let caseBrownLabelText = "Кожанный чехол для MacBook Pro 16 дюймов"
        }
        
        static let appleWatchImageName = ["appleWatch"]
        static let appleWatchStrapImageName = ["appleWatchStrap"]
        static let airPodsImageName = ["airPods"]
        static let blackCaseImageName = ["caseBlackBack", "caseBlackFront", "caseBlackSide"]
        static let brownCaseImageName = ["caseBrownBack", "caseBrownFront1", "caseBrownFront2"]
    }

    // MARK: - Private properties
    private let searchLabel: UILabel = {
        let search = UILabel()
        search.text = Constants.TextForUIElements.searchLabelText
        search.frame = CGRect(x: 25, y: 60, width: 150, height: 50)
        search.font = .systemFont(ofSize: 35, weight: .bold)
        return search
    }()
    
    private let searchTextField: UISearchBar = {
        let searchText = UISearchBar()
        searchText.placeholder = Constants.TextForUIElements.searchTextFieldPlaceholder
        searchText.frame = CGRect(x: 12, y: 110, width: 380, height: 45)
        return searchText
    }()
    
    private let recentlyViewedProductLabel: UILabel = {
        let viewedProduct = UILabel()
        viewedProduct.text = Constants.TextForUIElements.recentlyViewedProductLabelText
        viewedProduct.frame = CGRect(x: 15, y: 170, width: 280, height: 50)
        viewedProduct.font = .systemFont(ofSize: 20, weight: .bold)
        return viewedProduct
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.TextForUIElements.clearButtonText, for: .normal)
        button.frame = CGRect(x: 290, y: 181, width: 80, height: 30)
        return button
    }()
    
    private lazy var blackCaseView: UIView = {
        let caseView = UIView()
        caseView.backgroundColor = .systemGray6
        caseView.layer.cornerRadius = 15
        caseView.frame = CGRect(x: 20, y: 230, width: 150, height: 190)
        caseView.tag = 0
        caseView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)
            )
        )
        return caseView
    }()
    
    private let caseBlackImageView: UIImageView = {
        let caseImage = UIImageView()
        caseImage.image = UIImage(named: Constants.blackCaseImageName[0])
        caseImage.frame = CGRect(x: 15, y: 7, width: 110, height: 110)
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let caseBlackNameLabel: UILabel = {
        let productName = UILabel()
        productName.text = Constants.ProductText.caseBlackNameLabelText
        productName.frame = CGRect(x: 10, y: 90, width: 130, height: 100)
        productName.font = .systemFont(ofSize: 12, weight: .bold)
        productName.numberOfLines = 0
        productName.lineBreakMode = .byWordWrapping
        return productName
    }()
    
    private lazy var appleWatchStrapView: UIView = {
        let caseView = UIView()
        caseView.backgroundColor = .systemGray6
        caseView.layer.cornerRadius = 15
        caseView.frame = CGRect(x: 180, y: 230, width: 150, height: 190)
        caseView.tag = 1
        caseView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)
            )
        )
        return caseView
    }()
    
    private let appleWatchStrapImageView: UIImageView = {
        let caseImage = UIImageView()
        caseImage.image = UIImage(named: Constants.appleWatchStrapImageName[0])
        caseImage.frame = CGRect(x: 15, y: 7, width: 110, height: 110)
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let appleWatchStrapNameLabel: UILabel = {
        let productName = UILabel()
        productName.text = Constants.ProductText.appleWatchStrapLabelText
        productName.frame = CGRect(x: 10, y: 90, width: 130, height: 100)
        productName.font = .systemFont(ofSize: 12, weight: .bold)
        productName.numberOfLines = 0
        productName.lineBreakMode = .byWordWrapping
        return productName
    }()
    
    private lazy var caseBrownView: UIView = {
        let caseView = UIView()
        caseView.backgroundColor = .systemGray6
        caseView.layer.cornerRadius = 15
        caseView.frame = CGRect(x: 345, y: 230, width: 150, height: 190)
        caseView.tag = 2
        caseView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)
            )
        )
        return caseView
    }()
    
    private let caseBrownImageView: UIImageView = {
        let caseImage = UIImageView()
        caseImage.image = UIImage(named: Constants.brownCaseImageName[0])
        caseImage.frame = CGRect(x: 15, y: 7, width: 110, height: 110)
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let caseBrownNameLabel: UILabel = {
        let productName = UILabel()
        productName.text = Constants.ProductText.caseBrownLabelText
        productName.frame = CGRect(x: 10, y: 90, width: 130, height: 100)
        productName.font = .systemFont(ofSize: 12, weight: .bold)
        productName.numberOfLines = 0
        productName.lineBreakMode = .byWordWrapping
        return productName
    }()
    
    private let requestOptionsLabel: UILabel = {
        let viewedProduct = UILabel()
        viewedProduct.text = Constants.TextForUIElements.requestLabelText
        viewedProduct.frame = CGRect(x: 15, y: 440, width: 280, height: 50)
        viewedProduct.font = .systemFont(ofSize: 20, weight: .bold)
        return viewedProduct
    }()
    
    private let airPodsRequestView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 490, width: 350, height: 45)
        return view
    }()
    
    private let airPodsRequestLabel: UILabel = {
        let airPods = UILabel()
        airPods.frame = CGRect(x: 35, y: 5, width: 200, height: 30)
        airPods.font = .systemFont(ofSize: 20, weight: .light)
        airPods.text = Constants.TextForUIElements.airPodsRequestLabelText
        return airPods
    }()
    
    private let appleCareRequestView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 540, width: 350, height: 45)
        return view
    }()
    
    private let appleCareRequestLabel: UILabel = {
        let airPods = UILabel()
        airPods.frame = CGRect(x: 35, y: 5, width: 200, height: 30)
        airPods.font = .systemFont(ofSize: 20, weight: .light)
        airPods.text = Constants.TextForUIElements.appleCareRequestLabelText
        return airPods
    }()
    
    private let beatsRequestView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 590, width: 350, height: 45)
        return view
    }()
    
    private let beatsRequestLabel: UILabel = {
        let airPods = UILabel()
        airPods.frame = CGRect(x: 35, y: 5, width: 200, height: 30)
        airPods.font = .systemFont(ofSize: 20, weight: .light)
        airPods.text = Constants.TextForUIElements.beatsRequestLabelText
        return airPods
    }()
    
    private let compareModelsView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 640, width: 350, height: 45)
        return view
    }()
    
    private let compareModelsLabel: UILabel = {
        let airPods = UILabel()
        airPods.frame = CGRect(x: 35, y: 5, width: 260, height: 30)
        airPods.font = .systemFont(ofSize: 20, weight: .light)
        airPods.text = Constants.TextForUIElements.compareModelsLabelText
        return airPods
    }()
    
    private let magnifyingGlassAirPodsImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = .white
        return image
    }()
    
    private let magnifyingGlassAppleCareImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = .white
        return image
    }()
    
    private let magnifyingGlassBeatsImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = .white
        return image
    }()
    
    private let magnifyingGlassCompareModelsImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = .white
        return image
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    @objc private func handleTap(_ sender: UIGestureRecognizer) {
        let productVC = ProductViewController()
        switch sender.view?.tag {
        case 0:
            productVC.productImageView.image = caseBlackImageView.image
            productVC.productNameLabel.text = caseBlackNameLabel.text
        case 1:
            productVC.productImageView.image = appleWatchStrapImageView.image
            productVC.productNameLabel.text = appleWatchStrapNameLabel.text
        case 2:
            productVC.productImageView.image = caseBrownImageView.image
            productVC.productNameLabel.text = caseBrownNameLabel.text
        default:
            print("Error")
        }
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(searchLabel)
        view.addSubview(searchTextField)
        view.addSubview(recentlyViewedProductLabel)
        view.addSubview(clearButton)
        view.addSubview(requestOptionsLabel)
        view.addSubview(appleCareRequestLabel)
        view.addSubview(beatsRequestLabel)
        view.addSubview(compareModelsLabel)
        
        view.addSubview(airPodsRequestView)
        view.addSubview(appleCareRequestView)
        view.addSubview(beatsRequestView)
        view.addSubview(compareModelsView)
        
        airPodsRequestView.addSubview(airPodsRequestLabel)
        airPodsRequestView.addSubview(magnifyingGlassAirPodsImage)
        airPodsRequestView.setUnderLine()
        
        appleCareRequestView.addSubview(appleCareRequestLabel)
        appleCareRequestView.addSubview(magnifyingGlassAppleCareImage)
        appleCareRequestView.setUnderLine()
        
        beatsRequestView.addSubview(beatsRequestLabel)
        beatsRequestView.addSubview(magnifyingGlassBeatsImage)
        beatsRequestView.setUnderLine()
        
        compareModelsView.addSubview(compareModelsLabel)
        compareModelsView.addSubview(magnifyingGlassCompareModelsImage)
        compareModelsView.setUnderLine()
        
        view.addSubview(blackCaseView)
        view.addSubview(appleWatchStrapView)
        view.addSubview(caseBrownView)
        blackCaseView.addSubview(caseBlackImageView)
        blackCaseView.addSubview(caseBlackNameLabel)
        appleWatchStrapView.addSubview(appleWatchStrapImageView)
        appleWatchStrapView.addSubview(appleWatchStrapNameLabel)
        caseBrownView.addSubview(caseBrownImageView)
        caseBrownView.addSubview(caseBrownNameLabel)
    }
}
