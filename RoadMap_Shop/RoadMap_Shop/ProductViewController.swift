//
//  ProductViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 07.10.2022.
//

import UIKit
// productScreen
class ProductViewController: UIViewController {

    // MARK: - Public properties
    lazy var productImageView = UIImageView()
    lazy var productNameLabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - Private methods
    private func configurateProductImageView() {
        productImageView.frame = CGRect(x: 70, y: 200, width: 200, height: 200)
        productImageView.contentMode = .scaleAspectFit
    }
    
    private func configurateProductNameLabel() {
        productNameLabel.frame = CGRect(x: 35, y: 50, width: 350, height: 200)
        productNameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        productNameLabel.numberOfLines = 0
    }
    
    private func setupUI() {
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        configurateProductImageView()
        configurateProductNameLabel()
    }
    
}
