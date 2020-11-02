//
//  CheckoutViewController.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 20/10/20.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var checkoutTable: UITableView!
    @IBOutlet weak var totalItem: UILabel!
    @IBOutlet weak var totalAmoutValue: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkoutTable.delegate = self
        checkoutTable.dataSource = self
        
        totalItem.text = "Total \(DataService.instance.getQuantityCount()) items"
        totalAmoutValue.text = "Rs \(DataService.instance.getTotalAmount())"
    }
    

    @IBAction func purchaseTapped(_ sender: UIButton) {
        let AlertVC = UIAlertController(title: "Purchase Successful 🎉", message: "Order placed successfully and will be delivered within 7 working days.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        AlertVC.addAction(action)
        present(AlertVC, animated: true, completion: nil)
        DataService.instance.emptyCart()
        checkoutTable.reloadData()
        emptyCartMessage()
    }
    
    func emptyCartMessage() {
        if DataService.instance.getQuantityCount() == 0 {
            messageLabel.isHidden = false
            messageLabel.text = "OPPS THE CART IS EMPTY 😳, LET'S FILL IT WITH SOME COOL SHOES! 😎"
            totalItem.text = ""
//            totalAmoutValue.text = ""
            totalAmoutValue.isHidden = true
            totalLabel.isHidden = true
            purchaseButton.isHidden = true
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//MARK: - UITableViewControllerDelegate
extension CheckoutViewController: UITableViewDelegate {}


//MARK: - UITableViewControllerDataSource
extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCartProductCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutCell") as? CheckoutCell {
            cell.delegate = self
            cell.updateCell(with: DataService.instance.cart.products[indexPath.row])
            return cell
        }
        return CheckoutCell()
    }
}

extension CheckoutViewController: UpdateTotalQuantity {
    func updateQuantity(with item: Int) {
        totalItem.text = "Total \(item) items"
    }
    func emptyCart(item: SelectedProduct) {
        DataService.instance.removeProduct(fromCart: nil, selectedProduct: item)
        checkoutTable.reloadData()
        emptyCartMessage()
    }
    func updateTotalAmount(of items: Double) {
        totalAmoutValue.text = "Rs \(items)"
    }
}
