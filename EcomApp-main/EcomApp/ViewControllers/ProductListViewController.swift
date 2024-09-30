//
//  ViewController.swift
//  EcomApp
//
//  Created by Saranvignesh Soundararajan on 27/12/22.
//

import UIKit
import SnapKit

// MARK: - Variable for storing selected
var selectedCat: String = ""
class ProductListViewController: UIViewController {
    
    // MARK: - Creating instance for productlistviewmodel
    var viewModel = ProductListViewModel()
    
    // MARK: - Variable for storing product list
    var productList: ProductList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 200, height: 200)
        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(ProductListCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView)
        viewModel.apiToGetProductsList {
            self.productList = self.viewModel.categoriesData
            DispatchQueue.main.async {
                myCollectionView.reloadData()
            }
        }
        
    }
    
    
   
}

extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ProductListCollectionViewCell
        
        myCell.backgroundColor = UIColor.blue
        myCell.catLbl.text = productList![indexPath.row].capitalized
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(productList![indexPath.row])
        selectedCat = productList![indexPath.row].replacingOccurrences(of: " ", with: "%20")
        let vc = ProductDetailViewController()
        vc.titleLbl.text = productList![indexPath.row].capitalized
        navigationController?.pushViewController(vc, animated: true)
    }
    
}









