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
        static let forYouText = "Для вас"
        static let searchTextFieldPlaceholder = "Поиск по продуктам и магазинам"
        static let recentlyViewedProductLabelText = "Недавно просмотренные"
        static let clearButtonText = "Очистить"
        static let requestLabelText = "Варианты запросов"
        static let airPodsRequestLabelText = "AirPods"
        static let appleCareRequestLabelText = "Apple Care"
        static let beatsRequestLabelText = "Beats"
        static let whatsNew = "Вот что нового"
        static let yourDevices = "Ваши устройства"
        static let showAll = "Показать все"
        static let recomendedToYouLabel = "Рекомендуется вам"
        static let recommendTitle = "Получайте новости о своем заказе в режиме реального времени"
        static let recommendText = "Включите уведомления, чтобы получать новости о своем заказе"
        static let yourOrderSent = "Ваш заказ отправлен"
        static let orderAndDeliveryInfo = "1 товар, доставка завтра"
        static let addToCartButtonText = "Добавить в корзину"
        static let compareModelsLabelText = "Сравните модели iPhone"
        static let connectLabelText = "Совместимо с "
        static let connectDeviceLabelText = "MacBook Air - Артур"
        static let deliveryLabelText = "Заказ сегодня в течение дня, доставка:"
        static let deliveryDateLabelText = "Чт, 25 Фев - Бесплатно"
        static let deliveryOptionsLabelText = "Варианты доставки для иемтоположения: 11253"
        static let photoForProdileImage = "Photo"
    }
    
    /// Текст статусов доставки
    enum ProgressViewStatusText {
        static let processed = "Обрабатывается"
        static let sent = "Отправлено"
        static let delivered = "Доставлено"
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
        static let appleWatchStrapImageName = ["appleWatchStrap1", "appleWatchStrap2", "appleWatchStrap3"]
        static let blackCaseImageName = ["caseBlackBack", "caseBlackFront", "caseBlackSide"]
        static let brownCaseImageName = ["caseBrownBack", "caseBrownFront1", "caseBrownFront2"]
        static let iPhoneImageName = ["iPhone1", "iPhone2", "iPhone3"]
        static let airPodsUmageName = "airPods"
    }
    
    /// Цены продутов
    enum ProductPriceText {
        static let caseBlackPriceLabelText = "4 999 00 руб."
        static let appleWatchStrapPriceLabelText = "4 000 00 руб."
        static let caseBrownPriceLabelText = "5 350 00 руб."
        static let iPhonePriceLabelText = "89 990 00 руб."
    }
    
    /// Ссылки на странички продуктов
    enum ProductLink {
        static let caseBlackLink = "https://re-store.ru/catalog/PA15OCBL5448/"
        static let appleWatchStrapLink = "https://re-store.ru/catalog/MJ4V3ZM-A/"
        static let caseBrownLink = "https://re-store.ru/catalog/PA15DACH5449/"
        static let iPhoneLink = "https://re-store.ru/catalog/10113256BLU/"
    }
    
    /// Названия изображений barItem'ов
    enum SystemImage {
        static let heart = "heart"
        static let share = "square.and.arrow.up"
        static let connectCheck = "checkmark.circle.fill"
        static let deliveryBox = "shippingbox"
        static let searchGlass = "magnifyingglass"
        static let recommend = "dot.square"
        static let chevroneRight = "chevron.right"
        static let appBadge = "app.badge"
        static let defaultImage = "person.crop.circle"
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
    
    enum TabBarItemText {
        static let buyItemText = "Купить"
        static let offerItemText = "Для вас"
        static let searchItemText = "Поиск"
        static let cartItemText = "Корзина"
    }
    enum TabBarItemImage {
        static let buyItemImage = "laptopcomputer.and.iphone"
        static let offerItemImage = "person.circle"
        static let searchItemImage = "magnifyingglass"
        static let cartItemImage = "bag"
    }
}
