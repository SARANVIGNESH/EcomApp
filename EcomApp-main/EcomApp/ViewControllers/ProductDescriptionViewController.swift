//
//  ProductDescriptionViewController.swift
//  EcomApp
//
//  Created by Saranvignesh Soundararajan on 02/01/23.
//

import UIKit
import SnapKit

class ProductDescriptionViewController: UIViewController {
    
    
    // MARK: - Variable for storing constraints for content view of scroll view
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    lazy var scrollViewContainer: UIScrollView = {
        let scrollViewContainer = UIScrollView(frame: .zero)
        scrollViewContainer.backgroundColor = .white
        scrollViewContainer.contentSize = contentViewSize
        scrollViewContainer.frame = view.bounds
        return scrollViewContainer
    }()
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        return containerView
        
    }()
    
    
    lazy var productDescImage: UIImageView = {
        let productDescImage = UIImageView()

        return productDescImage
        
        
    }()
    
    lazy var productDescName: UILabel = {
        let productDescName = UILabel()
        productDescName.numberOfLines = 0
        productDescName.textAlignment = .center
        productDescName.font = UIFont.systemFont(ofSize: 20)
        productDescName.font = UIFont.boldSystemFont(ofSize: 20)

        
        
        return productDescName
        
    }()
    
    lazy var productDescDescription: UILabel = {
        let productDescDescription = UILabel()
        productDescDescription.numberOfLines = 0

        return productDescDescription
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ratingStar,ratingStar1,ratingStar2,ratingStar3,ratingStar4])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 1.0
        return stackView
        
    }()
    
    lazy var ratingStar: UIImageView = {
        let ratingStar = UIImageView()
        ratingStar.image = UIImage(systemName: "star.fill")
        ratingStar.tintColor = .yellow
        return ratingStar
        
    }()

    
    lazy var ratingStar1: UIImageView = {
        let ratingStar1 = UIImageView()
        ratingStar1.image = UIImage(systemName: "star")
        ratingStar1.tintColor = .yellow
        return ratingStar1

    }()

    lazy var ratingStar2: UIImageView = {
        let ratingStar2 = UIImageView()
        ratingStar2.image = UIImage(systemName: "star")
        ratingStar2.tintColor = .yellow
        return ratingStar2

    }()
    
    lazy var ratingStar3: UIImageView = {
        let ratingStar3 = UIImageView()
        ratingStar3.image = UIImage(systemName: "star")
        ratingStar3.tintColor = .yellow
        return ratingStar3

    }()

    lazy var ratingStar4: UIImageView = {
        let ratingStar4 = UIImageView()
        ratingStar4.image = UIImage(systemName: "star")
        ratingStar4.tintColor = .yellow
        return ratingStar4

    }()
    
    
    
    lazy var countLbl: UILabel = {
        let countLbl = UILabel()
        countLbl.font = UIFont.systemFont(ofSize: 15)
        countLbl.font = UIFont.boldSystemFont(ofSize: 15)
        return countLbl
    }()
    
    lazy var buyBtn: UIButton = {
        let buyBtn = UIButton()
        buyBtn.backgroundColor = .blue
        buyBtn.setTitle("Buy Now", for: .normal)
        return buyBtn
        
    }()
    
    lazy var priceLbl: UILabel = {
        let priceLbl = UILabel()
        priceLbl.font = UIFont.systemFont(ofSize: 30)
        priceLbl.font = UIFont.boldSystemFont(ofSize: 30)
        return priceLbl
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        subView()
        
    }
    
    func subView() {
        view.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
            make.width.equalTo(view.bounds.width)
            make.height.equalTo(view.bounds.height)
        }
        
        scrollViewContainer.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.height)
            
        }
        
        containerView.addSubview(productDescImage)
        productDescImage.snp.makeConstraints { make in
            make.topMargin.equalTo(containerView)
            make.height.width.equalTo(200)
            make.centerX.equalToSuperview()
        }

        containerView.addSubview(productDescName)
        productDescName.snp.makeConstraints { make in
            make.topMargin.equalTo(productDescImage.snp.bottomMargin).offset(30)
            make.leftMargin.equalTo(10)
            make.rightMargin.equalTo(-10)
        }

        containerView.addSubview(productDescDescription)
        productDescDescription.snp.makeConstraints { make in
            make.topMargin.equalTo(productDescName.snp.bottomMargin).offset(30)
            make.leftMargin.equalTo(productDescName.snp.leftMargin)
            make.rightMargin.equalTo(productDescName.snp.rightMargin)
        }
        
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.width.equalTo(125)
            make.height.equalTo(30)
            make.topMargin.equalTo(productDescDescription.snp.bottomMargin).offset(30)
            make.leftMargin.equalTo(10)
            
        }
        
        stackView.addArrangedSubview(ratingStar)
        ratingStar.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }
        
        
        stackView.addArrangedSubview(ratingStar1)
        ratingStar.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }

        stackView.addArrangedSubview(ratingStar2)
        ratingStar2.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }

        stackView.addArrangedSubview(ratingStar3)
        ratingStar3.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }

        stackView.addArrangedSubview(ratingStar4)
        ratingStar4.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }
        
        
        
        containerView.addSubview(countLbl)
        countLbl.snp.makeConstraints { make in
            make.width.equalTo(125)
            make.height.equalTo(30)
            make.topMargin.equalTo(productDescDescription.snp.bottomMargin).offset(40)
            make.rightMargin.equalTo(-10)
            
        }
        containerView.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(stackView)
            make.topMargin.equalTo(stackView.snp.bottomMargin).offset(30)
            make.leftMargin.equalTo(10)
        }
        
        containerView.addSubview(buyBtn)
        buyBtn.snp.makeConstraints { make in
            make.topMargin.equalTo(priceLbl.snp.bottomMargin).offset(40)
            make.leftMargin.equalTo(10)
            make.height.equalTo(50)
            make.width.equalTo(productDescDescription)
            make.bottomMargin.equalTo(containerView)
            
        }
        
        
        
    }
    

}










