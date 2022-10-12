//
//  OfferViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 06.10.2022.
//

import UIKit

/// Экран предложений для пользователя
final class OfferViewController: UIViewController {

    // MARK: - Constants
    private struct Const {
        static let ImageSizeForLargeState: CGFloat = 40
        static let ImageRightMargin: CGFloat = 16
        static let ImageBottomMarginForLargeState: CGFloat = 12
        static let ImageBottomMarginForSmallState: CGFloat = 6
        static let ImageSizeForSmallState: CGFloat = 32
        static let NavBarHeightSmallState: CGFloat = 44
        static let NavBarHeightLargeState: CGFloat = 96.5
    }
    
    // MARK: - Private properties
    private lazy var offerScrollController: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: -150, width: self.view.bounds.width, height: 1000)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        return scrollView
    }()
    
    private var deliveryProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.frame = CGRect(x: 15, y: 145, width: 320, height: 20)
        progressView.tintColor = .green
        progressView.layer.transform = CATransform3DMakeScale(1, 2.0, 0)
        progressView.progress = 0.5
        return progressView
    }()
    
    private let deliveryDetailsView: UIView = {
        let delivery = UIView()
        delivery.backgroundColor = .white
        delivery.layer.shadowColor = UIColor.lightGray.cgColor
        delivery.layer.shadowOffset = CGSize(width: 0, height: 0)
        delivery.layer.cornerRadius = 15
        delivery.layer.shadowOpacity = 1.0
        delivery.layer.shadowRadius = 10.0
        delivery.frame = CGRect(x: 20, y: 220, width: 350, height: 200)
        return delivery
    }()
    
    private let borderLineView: UIView = {
        let border = UIView()
        border.backgroundColor = .lightGray
        border.frame = CGRect(x: 0, y: 120, width: 350, height: 1)
        return border
    }()
    
    private let recommendBorderLineView: UIView = {
        let border = UIView()
        border.backgroundColor = .lightGray
        border.frame = CGRect(x: 10, y: 680, width: 370, height: 1)
        return border
    }()
    
    private let navigationUnderLineView: UIView = {
        let border = UIView()
        border.backgroundColor = .lightGray
        border.frame = CGRect(x: 0, y: 150, width: 400, height: 1)
        return border
    }()
    
    private let orderedProductImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: Constants.ProductImageName.airPodsUmageName))
        image.sizeToFit()
        image.frame = CGRect(x: 15, y: 15, width: 80, height: 80)
        return image
    }()
    
    private let chevroneImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: Constants.SystemImage.chevroneRight))
        image.frame = CGRect(x: 310, y: 55, width: 20, height: 20)
        image.tintColor = .gray
        return image
    }()
    
    private let badgeImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: Constants.SystemImage.appBadge))
        image.frame = CGRect(x: 40, y: 560, width: 50, height: 50)
        image.tintColor = .systemRed
        return image
    }()
    
    private let orderedProductTitleLabel: UILabel = {
        let text = UILabel()
        text.text = Constants.TextForUIElements.yourOrderSent
        text.frame = CGRect(x: 100, y: 30, width: 280, height: 30)
        text.font = .systemFont(ofSize: 18, weight: .semibold)
        return text
    }()
    
    private let processLabel: UILabel = {
        let text = UILabel()
        text.text = Constants.ProgressViewStatusText.processed
        text.frame = CGRect(x: 15, y: 155, width: 120, height: 30)
        text.font = .systemFont(ofSize: 12, weight: .semibold)
        return text
    }()
    
    private let sentLabel: UILabel = {
        let text = UILabel()
        text.text = Constants.ProgressViewStatusText.sent
        text.frame = CGRect(x: 150, y: 155, width: 120, height: 30)
        text.font = .systemFont(ofSize: 12, weight: .semibold)
        return text
    }()

    private let deliveredLabel: UILabel = {
        let text = UILabel()
        text.text = Constants.ProgressViewStatusText.delivered
        text.frame = CGRect(x: 260, y: 155, width: 120, height: 30)
        text.font = .systemFont(ofSize: 12, weight: .semibold)
        text.textColor = .lightGray
        return text
    }()
    
    private let orderedProductTextLabel: UILabel = {
        let text = UILabel()
        text.text = Constants.TextForUIElements.orderAndDeliveryInfo
        text.textColor = .gray
        text.frame = CGRect(x: 100, y: 55, width: 280, height: 30)
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        return text
    }()
    
    private let newsLabel: UILabel = {
        let news = UILabel()
        news.text = Constants.TextForUIElements.whatsNew
        news.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        news.frame = CGRect(x: 18, y: 160, width: 280, height: 30)
        news.font = .systemFont(ofSize: 25, weight: .semibold)
        return news
    }()
    
    private let recommendedToYouLabel: UILabel = {
        let recommend = UILabel()
        recommend.text = Constants.TextForUIElements.recomendedToYouLabel
        recommend.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        recommend.frame = CGRect(x: 25, y: 500, width: 280, height: 30)
        recommend.font = .systemFont(ofSize: 25, weight: .semibold)
        return recommend
    }()
    
    private let yourDeviceslabel: UILabel = {
        let text = UILabel()
        text.text = Constants.TextForUIElements.yourDevices
        text.textColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteForLabel)
        text.frame = CGRect(x: 25, y: 700, width: 280, height: 30)
        text.font = .systemFont(ofSize: 25, weight: .semibold)
        return text
    }()
    
    private let recommendedTitleLabel: UILabel = {
        let text = UILabel()
        text.text = Constants.TextForUIElements.recommendTitle
        text.frame = CGRect(x: 120, y: 550, width: 220, height: 70)
        text.numberOfLines = 3
        text.lineBreakMode = .byWordWrapping
        text.font = .systemFont(ofSize: 15, weight: .bold)
        return text
    }()
    
    private let recommendedTextLabel: UILabel = {
        let text = UILabel()
        text.text = Constants.TextForUIElements.recommendText
        text.frame = CGRect(x: 120, y: 600, width: 250, height: 70)
        text.numberOfLines = 2
        text.lineBreakMode = .byWordWrapping
        text.font = .systemFont(ofSize: 14, weight: .semibold)
        text.textColor = .lightGray
        return text
    }()
    
    private let showAllDevicesButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(Constants.TextForUIElements.showAll, for: .normal)
            button.frame = CGRect(x: 280, y: 703, width: 100, height: 30)
            return button
    }()
    
    private let photoImageView = UIImageView(image: UIImage(named: "iPhone1"))
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    @objc private func showImagePickerControllerAction() {
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        imagePickerView.allowsEditing = true
        present(imagePickerView, animated: true)
    }
    
    private func saveToUserDefaults(image: Data) {
        let defaults = UserDefaults.standard
        guard defaults.object(forKey: Constants.TextForUIElements.photoForProdileImage) != nil else {
            defaults.setValue(image, forKey: Constants.TextForUIElements.photoForProdileImage)
            return
        }
        defaults.removeObject(forKey: Constants.TextForUIElements.photoForProdileImage)
        defaults.setValue(image, forKey: Constants.TextForUIElements.photoForProdileImage)
    }
    
    private func checkUserDefaults() -> UIImage? {
        let userDefaults = UserDefaults.standard
        guard let dataImage = userDefaults.object(
            forKey: Constants.TextForUIElements.photoForProdileImage
        ) as? Data else {
            let image = UIImage(
                named: Constants.SystemImage.defaultImage)?.resizeImage(to: CGSize(width: 35, height: 35)
                )
            return image
        }
        guard let image = UIImage(data: dataImage) else {
            let image = UIImage(
                named: Constants.SystemImage.defaultImage)?.resizeImage(to: CGSize(width: 35, height: 35)
                )
            return image
        }
        return image
    }
    
    private func setupPhotoUI() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(photoImageView)
        photoImageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        photoImageView.clipsToBounds = true
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                                  constant: -Const.ImageRightMargin),
            photoImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                                   constant: -Const.ImageBottomMarginForLargeState),
            photoImageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(showImagePickerControllerAction)
            )
        )
        photoImageView.image = checkUserDefaults()
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor)

        let yTranslation: CGFloat = {
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(
                0,
                min(maxYTranslation,
                    (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))
                   )
            )
        }()

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        photoImageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: Constants.MyColorForUIElements.blackWhiteView)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.TextForUIElements.forYouText
        
        view.addSubview(offerScrollController)
        
        offerScrollController.addSubview(newsLabel)
        offerScrollController.addSubview(recommendedToYouLabel)
        offerScrollController.addSubview(deliveryDetailsView)
        offerScrollController.addSubview(badgeImageView)
        offerScrollController.addSubview(recommendedTitleLabel)
        offerScrollController.addSubview(recommendedTextLabel)
        offerScrollController.addSubview(recommendBorderLineView)
        offerScrollController.addSubview(yourDeviceslabel)
        offerScrollController.addSubview(showAllDevicesButton)
        offerScrollController.addSubview(navigationUnderLineView)
        
        deliveryDetailsView.addSubview(orderedProductImageView)
        deliveryDetailsView.addSubview(orderedProductTextLabel)
        deliveryDetailsView.addSubview(orderedProductTitleLabel)
        deliveryDetailsView.addSubview(chevroneImageView)
        deliveryDetailsView.addSubview(borderLineView)
        deliveryDetailsView.addSubview(deliveryProgressView)
        deliveryDetailsView.addSubview(processLabel)
        deliveryDetailsView.addSubview(sentLabel)
        deliveryDetailsView.addSubview(deliveredLabel)
        setupPhotoUI()
        
    }
}

// MARK: - UIScrollDelegate
extension OfferViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

// MARK: - UIImage
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
extension OfferViewController: UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let img = image.resizeImage(to: CGSize(width: 30, height: 30))
        photoImageView.image = img
        guard let imageData = image.pngData() else { return }
        saveToUserDefaults(image: imageData)
        self.dismiss(animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension OfferViewController: UINavigationControllerDelegate {
}
