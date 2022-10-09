//
//  Constants.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 08.10.2022.
//

import UIKit

/// Класс с константами
final class Constants {
    
    // MARK: - Constants
    
    /// Текст для элементов пользовательского интерфейса
    enum TextForUIElements {
        static let searchLabelText = "Поиск"
        static let searchTextFieldPlaceholder = "Поиск по продуктам и магазинам"
        static let recentlyViewedProductLabelText = "Недавно просмотренные"
        static let clearButtonText = "Очистить"
        static let requestLabelText = "Варианты запросов"
        static let airPodsRequestLabelText = "AirPods"
        static let appleCareRequestLabelText = "Apple Care"
        static let beatsRequestLabelText = "Beats"
        static let addToCartButtonText = "Добавить в корзину"
        static let compareModelsLabelText = "Сравните модели iPhone"
        static let connectLabelText = "Совместимо с "
        static let connectDeviceLabelText = "MacBook Air - Артур"
        static let deliveryLabelText = "Заказ сегодня в течение дня, доставка:"
        static let deliveryDateLabelText = "Чт, 25 Фев - Бесплатно"
        static let deliveryOptionsLabelText = "Варианты доставки для иемтоположения: 11253"
    }
    
    /// Названия продуктов
    enum ProductText {
        static let caseBlackNameLabelText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let appleWatchStrapLabelText = "Спортивный ремешок Black Unity (для к"
        static let caseBrownLabelText = "Кожанный чехол для MacBook Pro 16 дюймов"
        static let iPhoneLabelText = "Смартфон Apple iPhone 12 Pro 128GB тихоокеанский синий"
    }
    
    ///  Названия изображэений продуктов
    enum ProductImageName {
        static let appleWatchStrapImageName = ["appleWatchStrap1", "appleWatchStrap2"]
        static let airPodsImageName = ["airPods"]
        static let blackCaseImageName = ["caseBlackBack", "caseBlackFront", "caseBlackSide"]
        static let brownCaseImageName = ["caseBrownBack", "caseBrownFront1", "caseBrownFront2"]
        static let iPhone = ["iPhone1", "iPhone2"]
    }
    
    /// Цены продутов
    enum ProductPriceText {
        static let appleWatchStrapPriceText = "3 999 00 руб."
    }
    
    /// Названия изображений barItem'ов
    enum SystemImage {
        static let heart = "heart"
        static let share = "square.and.arrow.up"
        static let connectCheck = "checkmark.circle.fill"
        static let deliveryBox = "shippingbox"
        static let searchGlass = "magnifyingglass"
    }
    
    /// Цвета элементов пользовательского интерфейса
    enum MyColorForUIElements {
        static let blackWhiteForLabel = "blackWhite"
        static let blackWhiteForSearchBar = "blackWhiteForSearchBar"
        static let blackWhiteView = "blackWhiteView"
        static let grayForProductView = "myGray"
        static let blackForGradient = "myBlack"
        static let whiteForGradient = "myWhite"
        static let silverForGradient = "mySilver"
    }
}
