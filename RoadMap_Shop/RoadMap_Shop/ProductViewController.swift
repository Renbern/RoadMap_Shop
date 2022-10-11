//
//  ProductViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 07.10.2022.
//

import UIKit
// Экран информации о продукте
final class ProductViewController: UIViewController {
    
    // MARK: - Public properties
    lazy var productImages: [String] = []
    
    private var productScrollView = UIScrollView()
    
    lazy var firstImage = UIImage()
    lazy var secondImage = UIImage()
    lazy var thirdImage = UIImage()
    
    lazy var productImageView = UIImageView()
    lazy var productNameLabel = UILabel()
    lazy var productColorNameLabel = UILabel()
    
    private lazy var  connectView: UIView = {
       let view = UIView()
        view.frame = CGRect(x: 35, y: 580, width: 320, height: 40)
        return view
    }()
    
    // MARK: - Private properties
    private let constants = Constants()
    
    private let productPriceLabel: UILabel = {
       let price = UILabel(frame: CGRect(x: 150, y: 175, width: 200, height: 30))
        price.text = Constants.ProductPriceText.appleWatchStrapPriceText
        price.font = .systemFont(ofSize: 15, weight: .semibold)
        price.textColor = .gray
        return price
    }()
    
    private let firstColorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 530, width: 37, height: 37))
        button.clipsToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 18
        return button
    }()
    
    private let secondColorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 210, y: 530, width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.tintColor = .black
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        return button
    }()
    
    private let connectImageView: UIImageView = {
       let connect = UIImageView()
        connect.image = UIImage(systemName: Constants.SystemImage.connectCheck)
        connect.tintColor = .systemGreen
        connect.frame = CGRect(x: 25, y: 7, width: 25, height: 25)
        return connect
    }()
    
    private let connectLabel: UILabel = {
       let label = UILabel()
        label.text = Constants.TextForUIElements.connectLabelText
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        label.frame = CGRect(x: 65, y: 7, width: 150, height: 25)
        return label
    }()
    
    private let connectDeviceLabel: UILabel = {
       let label = UILabel()
        label.text = Constants.TextForUIElements.connectDeviceLabelText
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 12)
        label.frame = CGRect(x: 155, y: 7, width: 150, height: 25)
        return label
    }()
    
    private let addToCardButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 5, y: 640, width: 380, height: 50)
        button.setTitle(Constants.TextForUIElements.addToCartButtonText, for: .normal)
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let boxImageView: UIImageView = {
       let box = UIImageView()
        box.image = UIImage(systemName: Constants.SystemImage.deliveryBox)
        box.tintColor = .gray
        box.frame = CGRect(x: 5, y: 710, width: 25, height: 25)
        return box
    }()

    private let deliveryLabel: UILabel = {
       let label = UILabel()
        label.text = Constants.TextForUIElements.deliveryLabelText
        label.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        label.font = .systemFont(ofSize: 13)
        label.frame = CGRect(x: 40, y: 705, width: 300, height: 25)
        return label
    }()
    
    private let deliveryDateLabel: UILabel = {
       let label = UILabel()
        label.text = Constants.TextForUIElements.deliveryDateLabelText
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        label.frame = CGRect(x: 40, y: 720, width: 300, height: 25)
        return label
    }()
    
    private let deliveryOptionsLabel: UILabel = {
       let label = UILabel()
        label.text = Constants.TextForUIElements.deliveryOptionsLabelText
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 10)
        label.frame = CGRect(x: 40, y: 735, width: 300, height: 25)
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func configurateProductNameLabel() {
        productNameLabel.frame = CGRect(x: 35, y: 50, width: 350, height: 200)
        productNameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        productNameLabel.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        productNameLabel.numberOfLines = 0
    }
    
    private func configurateProductColorNameLabel() {
        productColorNameLabel.frame = CGRect(x: 35, y: 470, width: 350, height: 30)
        productColorNameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        productColorNameLabel.textColor = .gray
        productColorNameLabel.textAlignment = .center
        productColorNameLabel.text = productNameLabel.text
        productColorNameLabel.numberOfLines = 0
    }
    
    private func confugirateNavigationBar() {
        let shareButtonItem = UIBarButtonItem()
        shareButtonItem.image = UIImage(systemName: Constants.SystemImage.share)
        let favoriteButtonItem = UIBarButtonItem()
        favoriteButtonItem.image = UIImage(systemName: Constants.SystemImage.heart)
        navigationItem.rightBarButtonItems = [favoriteButtonItem, shareButtonItem]
    }
    
    private func configurateProductScrollView() {
        let scrollViewRect = view.bounds
        
        productScrollView = UIScrollView(frame: scrollViewRect)
        productScrollView.isPagingEnabled = true
        productScrollView.flashScrollIndicators()
        productScrollView.indicatorStyle = .white
        productScrollView.contentSize = CGSize(
            width: CGFloat(scrollViewRect.size.width) * CGFloat(productImages.count),
            height: 200
        )
        productScrollView.frame = CGRect(x: 0, y: 230, width: Int(scrollViewRect.size.width), height: 200)
        view.addSubview(productScrollView)
        
        var imageViewRect = productScrollView.bounds
        guard productImages.count > 2 else {
            if let image = UIImage(named: productImages.first ?? "") {
                let firstImageView = newImageWithImage(
                    paramImage: image,
                    paramFrame: imageViewRect)
                productScrollView.addSubview(firstImageView)
            }
            
            if let image = UIImage(named: productImages[1]) {
                imageViewRect.origin.x += imageViewRect.size.width
                let secondImageView = newImageWithImage(
                    paramImage: image,
                    paramFrame: imageViewRect)
                productScrollView.addSubview(secondImageView)
            }
            return
        }
        if let image = UIImage(named: productImages.first ?? "") {
            let firstImageView = newImageWithImage(
                paramImage: image,
                paramFrame: imageViewRect)
            productScrollView.addSubview(firstImageView)
        }
        
        if let image = UIImage(named: productImages[1] ) {
            imageViewRect.origin.x += imageViewRect.size.width
            let secondImageView = newImageWithImage(
                paramImage: image,
                paramFrame: imageViewRect)
            productScrollView.addSubview(secondImageView)
        }
        
        if let image = UIImage(named: productImages[2] ) {
            imageViewRect.origin.x += imageViewRect.size.width
            let thirdImageView = newImageWithImage(
                paramImage: image,
                paramFrame: imageViewRect)
            productScrollView.addSubview(thirdImageView)
        }
    }
    
    private func newImageWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
    
    private func setGradientBackgroundForSecondButton() {
        let colorTop =  UIColor(named: Constants.MyColorForUIElements.blackForGradient)?.cgColor
        let colorBottom = UIColor(named: Constants.MyColorForUIElements.whiteForGradient)?.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = secondColorButton.bounds
        secondColorButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setGradientBackgroundForFirstButton() {
        let colorTop =  UIColor(named: Constants.MyColorForUIElements.whiteForGradient)?.cgColor
        let colorBottom = UIColor(named: Constants.MyColorForUIElements.silverForGradient)?.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = firstColorButton.bounds
        firstColorButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteView)
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(productPriceLabel)
        view.addSubview(productColorNameLabel)
        view.addSubview(firstColorButton)
        view.addSubview(secondColorButton)
        view.addSubview(addToCardButton)
        view.addSubview(boxImageView)
        view.addSubview(deliveryLabel)
        view.addSubview(deliveryDateLabel)
        view.addSubview(deliveryOptionsLabel)
        view.addSubview(connectView)
        connectView.addSubview(connectImageView)
        connectView.addSubview(connectLabel)
        connectView.addSubview(connectDeviceLabel)
        configurateProductNameLabel()
        confugirateNavigationBar()
        configurateProductScrollView()
        configurateProductColorNameLabel()
        setGradientBackgroundForFirstButton()
        setGradientBackgroundForSecondButton()
    }
    
}
