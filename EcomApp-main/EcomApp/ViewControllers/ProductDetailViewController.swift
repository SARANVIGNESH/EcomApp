//
//  ProductDetailViewController.swift
//  EcomApp
//
//  Created by Saranvignesh Soundararajan on 27/12/22.
//

import UIKit



class ProductDetailViewController: UIViewController {
    // MARK: - Creating instance for productdetailviewmodel
    var viewModel = ProductDetailViewModel()
    // MARK: - Variable for storing product data
    var products: Products?
    
    
    // MARK: - Variable for storing product title
    lazy var titleLbl: UILabel = {
        let titleLbl = UILabel()
        titleLbl.font = UIFont.systemFont(ofSize: 20)
        titleLbl.font = UIFont.boldSystemFont(ofSize: 20)
        titleLbl.textAlignment = .center
        titleLbl.backgroundColor = .white
        return titleLbl
        
    }()
    
    lazy var productDetailTableView: UITableView = {
        var productDetailTableView = UITableView()
        return productDetailTableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setTitle()
        setTableView()
        viewModel.apiToGetProductsData { [weak self] in
            self?.products = self?.viewModel.productsData
            
            DispatchQueue.main.async {
                self?.productDetailTableView.reloadData()
            }
            
        }
        
    }
    
    // MARK: - Setting up product title
    func setTitle() {
        self.view.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.topMargin.equalTo(10)
        }
        
        
    }
    
    // MARK: - Setting up product tableview
    func setTableView() {

        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        self.view.addSubview(productDetailTableView)
        productDetailTableView.snp.makeConstraints { make in
            make.topMargin.equalTo(60)
            make.width.equalTo(displayWidth)
            make.height.equalTo(displayHeight-100)
        }
        productDetailTableView.register(ProductDetailTableViewCell.self, forCellReuseIdentifier: "Cell")
        productDetailTableView.delegate = self
        productDetailTableView.dataSource = self
        
    }

}


// MARK: - Extensions for productstableview
extension ProductDetailViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = productDetailTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductDetailTableViewCell
        cell.productName.text = "\(products![indexPath.row].title)"
        cell.productPrice.text = "₹ \(products![indexPath.row].price)"
        cell.productImage.downloaded(from: "\(products![indexPath.row].image)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productDetailTableView.deselectRow(at: indexPath, animated: true)
        let vc = ProductDescriptionViewController()
        vc.productDescName.text = products![indexPath.row].title
        vc.productDescDescription.text = products![indexPath.row].productDescription
        vc.countLbl.text = "Count: \(products![indexPath.row].rating.count)"
        vc.productDescImage.downloaded(from: "\(products![indexPath.row].image)")
        vc.priceLbl.text = "₹ \(products![indexPath.row].price)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

// MARK: - Extensions for imageview
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}



