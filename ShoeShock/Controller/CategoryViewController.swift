//
//  ViewController.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 17/10/20.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        categoryTable.delegate = self
        categoryTable.dataSource = self
        
//        navigationItem.largeTitleDisplayMode = .never
//        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationController?.navigationBar.barTintColor = UIColor.systemOrange
    }
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ProductVC = segue.destination as? ProductViewController {
            let barButton = UIBarButtonItem()
            barButton.title = ""
            navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
            navigationItem.backBarButtonItem = barButton
            guard let category = sender as? Caterogy else { return }
            ProductVC.initProducts(from: category)
        }
    }
}


//MARK: - UITableViewDelegate
extension CategoryViewController: UITableViewDelegate {}


//MARK: - UITableViewDataSource
extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(with: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductVC", sender: category)
    }
}
