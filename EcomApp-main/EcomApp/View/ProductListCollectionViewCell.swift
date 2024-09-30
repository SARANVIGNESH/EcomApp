//
//  ProductListCollectionViewCell.swift
//  EcomApp
//
//  Created by Saranvignesh Soundararajan on 28/12/22.
//

import UIKit
import SnapKit

class ProductListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variable for storing category name
    lazy var catLbl: UILabel = {
        let catLbl = UILabel()
        catLbl.textColor = .white
        catLbl.textAlignment = .center
        return catLbl
        
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.layer.cornerRadius = 10
            self.clipsToBounds = true
            addSubview(catLbl)
        catLbl.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
                make.rightMargin.equalToSuperview()
            }

        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    
    
}
