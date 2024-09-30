//
//  ProductListViewModel.swift
//  EcomApp
//
//  Created by Saranvignesh Soundararajan on 27/12/22.
//

import Foundation

class ProductListViewModel {
    
    // MARK: - Variable for storing categories data
    var categoriesData:ProductList?
        
    // MARK: - Api call for fetching categories data
        func apiToGetProductsList(completion : @escaping () -> ()) {
            
            URLSession.shared.dataTask(with: URL(string: Urls.urlObj.catURL)!) { [weak self] (data, urlResponse, error) in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let catData = try! jsonDecoder.decode(ProductList.self, from: data)
                    self?.categoriesData = catData
                    completion()
                }
            }.resume()
            
        }
    

    
}

