//
//  IAPController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/16/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import Foundation
import StoreKit

final class IAPController: NSObject {

    static let shared = IAPController()

    typealias ProductsRequestCompletion = (_ success: Bool, _ products: [SKProduct]?) -> ()

    private var productIdentifier = "com.going.hereminders.pro"

    fileprivate var productsRequest: SKProductsRequest?
    fileprivate var productsRequestCompletion: ProductsRequestCompletion?

    func requestProducts(completion: @escaping ProductsRequestCompletion) {
        self.productsRequest?.cancel()
        self.productsRequestCompletion = completion

        self.productsRequest = SKProductsRequest(productIdentifiers: Set(arrayLiteral: productIdentifier))
        self.productsRequest?.delegate = self
        self.productsRequest?.start()
    }
}

extension IAPController: SKProductsRequestDelegate {

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

        let products = response.products
        self.productsRequestCompletion?(true, products)

        self.clearRequestAndHandler()

        for p in products {
            print("Found product: \(p.productIdentifier) \(p.localizedTitle) \(p.price.floatValue)")
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {

        print("Failed to load list of products.")
        print("Error: \(error.localizedDescription)")
        self.productsRequestCompletion?(false, nil)

        self.clearRequestAndHandler()
    }

    func clearRequestAndHandler() {

        self.productsRequest = nil
        self.productsRequestCompletion = nil
    }
}
