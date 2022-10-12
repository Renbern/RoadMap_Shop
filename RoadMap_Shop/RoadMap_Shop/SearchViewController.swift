//
//  ViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 06.10.2022.
//

import UIKit

/// Экран поиска товара
final class SearchViewController: UIViewController {
    
    // MARK: - Public properties
    private lazy var productsScrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 250, width: self.view.bounds.width, height: 190)
        scrollView.contentSize = CGSize(width: 680, height: 190)
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var blackCaseView: UIView = {
        let caseView = UIView()
        caseView.backgroundColor = UIColor(named: Constants.MyColorForUIElements.grayForProductView)
        caseView.layer.cornerRadius = 15
        caseView.frame = CGRect(x: 20, y: 0, width: 150, height: 190)
        caseView.tag = 0
        caseView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)
            )
        )
        return caseView
    }()
    
    private lazy var appleWatchStrapView: UIView = {
        let caseView = UIView()
        caseView.backgroundColor = UIColor(named: Constants.MyColorForUIElements.grayForProductView)
        caseView.layer.cornerRadius = 15
        caseView.frame = CGRect(x: blackCaseView.frame.maxX + 10, y: 0, width: 150, height: 190)
        caseView.tag = 1
        caseView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)
            )
        )
        return caseView
    }()
    
    private lazy var caseBrownView: UIView = {
        let caseView = UIView()
        caseView.backgroundColor = UIColor(named: Constants.MyColorForUIElements.grayForProductView)
        caseView.layer.cornerRadius = 15
        caseView.frame = CGRect(x: appleWatchStrapView.frame.maxX + 10, y: 0, width: 150, height: 190)
        caseView.tag = 2
        caseView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)
            )
        )
        return caseView
    }()
    
    private lazy var iPhoneView: UIView = {
        let iPhone = UIView()
        iPhone.backgroundColor = UIColor(named: Constants.MyColorForUIElements.grayForProductView)
        iPhone.layer.cornerRadius = 15
        iPhone.frame = CGRect(x: caseBrownView.frame.maxX + 10, y: 0, width: 150, height: 190)
        iPhone.tag = 3
        iPhone.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)
            )
        )
        return iPhone
    }()
    
    private var productViewFrame = 12
    private var tag = 0
    private var product = [
        Product(
            productName: Constants.ProductText.caseBlackNameLabelText,
            productPrice: Constants.ProductPriceText.caseBlackPriceLabelText,
            productImages: Constants.ProductImageName.blackCaseImageName,
            productLink: Constants.ProductLink.caseBlackLink
        ),
        Product(
            productName: Constants.ProductText.caseBrownLabelText,
            productPrice: Constants.ProductPriceText.caseBrownPriceLabelText,
            productImages: Constants.ProductImageName.brownCaseImageName,
            productLink: Constants.ProductLink.caseBrownLink
        ),
        Product(
            productName: Constants.ProductText.iPhoneLabelText,
            productPrice: Constants.ProductPriceText.iPhonePriceLabelText,
            productImages: Constants.ProductImageName.iPhoneImageName,
            productLink: Constants.ProductLink.iPhoneLink
        ),
        Product(
            productName: Constants.ProductText.appleWatchStrapLabelText,
            productPrice: Constants.ProductPriceText.appleWatchStrapPriceLabelText,
            productImages: Constants.ProductImageName.appleWatchStrapImageName,
            productLink: Constants.ProductLink.appleWatchStrapLink
        )
    ]
    
    // MARK: - Private properties
    private let constants = Constants()
    
    private let searchBar: UISearchBar = {
        let searchText = UISearchBar()
        searchText.placeholder = Constants.TextForUIElements.searchTextFieldPlaceholder
        searchText.frame = CGRect(x: 12, y: 160, width: 380, height: 40)
        searchText.searchBarStyle = .minimal
        return searchText
    }()
    
    private let recentlyViewedProductLabel: UILabel = {
        let viewedProduct = UILabel()
        viewedProduct.text = Constants.TextForUIElements.recentlyViewedProductLabelText
        viewedProduct.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        viewedProduct.frame = CGRect(x: 15, y: 211, width: 280, height: 30)
        viewedProduct.font = .systemFont(ofSize: 20, weight: .bold)
        return viewedProduct
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.TextForUIElements.clearButtonText, for: .normal)
        button.frame = CGRect(x: 290, y: 211, width: 80, height: 30)
        return button
    }()
    
    private let caseBlackImageView: UIImageView = {
        let caseImage = UIImageView()
        caseImage.image = UIImage(named: Constants.ProductImageName.blackCaseImageName[0])
        caseImage.frame = CGRect(x: 15, y: 7, width: 110, height: 110)
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let caseBlackNameLabel: UILabel = {
        let productName = UILabel()
        productName.text = Constants.ProductText.caseBlackNameLabelText
        productName.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        productName.frame = CGRect(x: 10, y: 90, width: 130, height: 100)
        productName.font = .systemFont(ofSize: 12, weight: .bold)
        productName.numberOfLines = 0
        productName.lineBreakMode = .byWordWrapping
        return productName
    }()
    
    private let appleWatchStrapImageView: UIImageView = {
        let caseImage = UIImageView()
        caseImage.image = UIImage(named: Constants.ProductImageName.appleWatchStrapImageName[0])
        caseImage.frame = CGRect(x: 15, y: 7, width: 110, height: 110)
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let appleWatchStrapNameLabel: UILabel = {
        let productName = UILabel()
        productName.text = Constants.ProductText.appleWatchStrapLabelText
        productName.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        productName.frame = CGRect(x: 10, y: 90, width: 130, height: 100)
        productName.font = .systemFont(ofSize: 12, weight: .bold)
        productName.numberOfLines = 0
        productName.lineBreakMode = .byWordWrapping
        return productName
    }()
    
    private let caseBrownImageView: UIImageView = {
        let caseImage = UIImageView()
        caseImage.image = UIImage(named: Constants.ProductImageName.brownCaseImageName[0])
        caseImage.frame = CGRect(x: 15, y: 7, width: 110, height: 110)
        caseImage.contentMode = .scaleAspectFit
        return caseImage
    }()
    
    private let caseBrownNameLabel: UILabel = {
        let productName = UILabel()
        productName.text = Constants.ProductText.caseBrownLabelText
        productName.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        productName.frame = CGRect(x: 10, y: 90, width: 130, height: 100)
        productName.font = .systemFont(ofSize: 12, weight: .bold)
        productName.numberOfLines = 0
        productName.lineBreakMode = .byWordWrapping
        return productName
    }()
    
    private let iPhoneImageView: UIImageView = {
        let iPhoneImage = UIImageView()
        iPhoneImage.frame = CGRect(x: 15, y: 7, width: 110, height: 110)
        iPhoneImage.contentMode = .scaleAspectFit
        return iPhoneImage
    }()
    
    private let iPhoneNameLabel: UILabel = {
        let productName = UILabel()
        productName.text = Constants.ProductText.iPhoneLabelText
        productName.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        productName.frame = CGRect(x: 10, y: 90, width: 130, height: 100)
        productName.font = .systemFont(ofSize: 12, weight: .bold)
        productName.numberOfLines = 0
        productName.lineBreakMode = .byWordWrapping
        return productName
    }()
    
    private let requestOptionsLabel: UILabel = {
        let viewedProduct = UILabel()
        viewedProduct.text = Constants.TextForUIElements.requestLabelText
        viewedProduct.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
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
        airPods.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
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
        let appleCare = UILabel()
        appleCare.frame = CGRect(x: 35, y: 5, width: 200, height: 30)
        appleCare.font = .systemFont(ofSize: 20, weight: .light)
        appleCare.text = Constants.TextForUIElements.appleCareRequestLabelText
        appleCare.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        return appleCare
    }()
    
    private let beatsRequestView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 590, width: 350, height: 45)
        return view
    }()
    
    private let beatsRequestLabel: UILabel = {
        let beats = UILabel()
        beats.frame = CGRect(x: 35, y: 5, width: 200, height: 30)
        beats.font = .systemFont(ofSize: 20, weight: .light)
        beats.text = Constants.TextForUIElements.beatsRequestLabelText
        beats.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        return beats
    }()
    
    private let compareModelsView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 640, width: 350, height: 45)
        return view
    }()
    
    private let compareModelsLabel: UILabel = {
        let compareModel = UILabel()
        compareModel.frame = CGRect(x: 35, y: 5, width: 260, height: 30)
        compareModel.font = .systemFont(ofSize: 20, weight: .light)
        compareModel.text = Constants.TextForUIElements.compareModelsLabelText
        compareModel.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        return compareModel
    }()
    
    private let magnifyingGlassAirPodsImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: Constants.SystemImage.searchGlass))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        return image
    }()
    
    private let magnifyingGlassAppleCareImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: Constants.SystemImage.searchGlass))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        return image
    }()
    
    private let magnifyingGlassBeatsImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: Constants.SystemImage.searchGlass))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        return image
    }()
    
    private let magnifyingGlassCompareModelsImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: Constants.SystemImage.searchGlass))
        image.frame = CGRect(x: 5, y: 10, width: 20, height: 20)
        image.tintColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        return image
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    @objc private func handleTap(sender: UIGestureRecognizer) {
        let productVC = ProductViewController()
        guard let tag = sender.view?.tag else { return }
        productVC.product = product[tag]
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    private func addView() {
        for item in product {
            configurateProductView(
                image: item.productImages.first ?? "",
                product: item.productName,
                price: item.productPrice,
                tag: tag
            )
            tag += 1
        }
    }
    
    private func configurateProductView(image: String, product: String, price: String, tag: Int) {
             let productView = UIView()
            productView.backgroundColor = UIColor(named: Constants.MyColorForUIElements.grayForProductView)
             productView.frame = CGRect(x: productViewFrame, y: 0, width: 150, height: 190)
             productView.layer.cornerRadius = 12

             let productName = UILabel()
            productName.text = product
            productName.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
            productName.numberOfLines = 3
        productName.font = .systemFont(ofSize: 12, weight: .semibold)
            productName.frame = CGRect(x: 13, y: 120, width: 130, height: 80)

             let productImageView = UIImageView()
             let productImage = UIImage(named: image)
             productImageView.contentMode = .scaleAspectFit
             productImageView.image = productImage
             productImageView.frame = CGRect(x: 23, y: 30, width: 100, height: 100)

             productView.addSubview(productImageView)
             productView.addSubview(productName)
             productView.tag = tag
             productView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
             productViewFrame += 170
             productsScrollView.addSubview(productView)
         }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteView)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.TextForUIElements.searchLabelText
        addView()
        view.addSubview(searchBar)
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
        
        view.addSubview(productsScrollView)
    }
}
