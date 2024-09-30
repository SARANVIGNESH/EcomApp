//
//  ProductDetailViewModel.swift
//  EcomApp
//
//  Created by Saranvignesh Soundararajan on 27/12/22.
//

import Foundation


class ProductDetailViewModel {
    
    // MARK: - Variable for storing products data
    var productsData:Products?
    
    // MARK: - Api call for fetching products data
        func apiToGetProductsData(completion : @escaping () -> ()) {
            print(Urls.urlObj.productURL+"\(selectedCat)")
            URLSession.shared.dataTask(with: URL(string: Urls.urlObj.productURL+"\(selectedCat)")!) { [weak self] (data, urlResponse, error) in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let productData = try! jsonDecoder.decode(Products.self, from: data)
                    self?.productsData = productData
                    completion()
                }
            }.resume()
        }
    
}
