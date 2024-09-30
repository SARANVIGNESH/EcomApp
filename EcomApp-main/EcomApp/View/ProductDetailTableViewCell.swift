//
//  ProductDetailTableViewCell.swift
//  EcomApp
//
//  Created by Saranvignesh Soundararajan on 27/12/22.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    
    // MARK: - Variable for storing product image
    lazy var productImage: UIImageView = {
        let productImage = UIImageView()
        return productImage
        
    }()
    // MARK: - Varible for storing product name
    lazy var productName: UILabel = {
        let productName = UILabel()
        productName.font = UIFont.systemFont(ofSize: 15)
        productName.font = UIFont.boldSystemFont(ofSize: 15)

        productName.numberOfLines = 0
        return productName
        
    }()
    // MARK: - Variable for storing product price
    lazy var productPrice: UILabel = {
        let productPrice = UILabel()
        return productPrice
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        addSubview(productName)
        productName.snp.makeConstraints { make in
            make.topMargin.equalTo(30)
            make.leftMargin.equalTo(170)
            make.rightMargin.equalToSuperview()
        }
        
        addSubview(productPrice)
        productPrice.snp.makeConstraints { make in
            make.topMargin.equalTo(150)
            make.leftMargin.equalTo(productImage).offset(180)
        }
    }

    

}




