//
//  DataService.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 18/10/20.
//

import Foundation

struct DataService {
    //changed to var to insert product
    static var instance = DataService()
    
    //MARK: - Categories
    private let categories = [
        Caterogy(title: "NIKE", imageName: "nike.jpg"),
        Caterogy(title: "ADIDAS", imageName: "adidas.jpg"),
        Caterogy(title: "PUMA", imageName: "puma.jpg")
    ]
    
    //MARK: - Products
    private let nikeShoes = [
        Product(title: "Nike Air Zoom Alphafly NEXT%", price: 22795, description: "Gear up for your next personal best with the Nike Air Zoom Alphafly NEXT%. Responsive foam is combined with 2 Zoom Air units to push your running game forwards for your next marathon or road race.", imageName: ["nike-air-zoom-1.jpg","nike-air-zoom-2.jpg","nike-air-zoom-3.jpg","nike-air-zoom-4.jpg"]),
        Product(title: "Nike Zoom Rival Fly 2", price: 7995, description: "The Nike Zoom Rival Fly features a futuristic look with cushioning in the forefoot that gives you a responsive feel. Flex grooves underneath optimise toe-off and soft foam cushions your stride.", imageName: ["nike-zoom-rival-fly-1.jpg","nike-zoom-rival-fly-2.jpg","nike-zoom-rival-fly-3.jpg","nike-zoom-rival-fly-4.jpg"]),
        Product(title: "LeBron 18", price: 17595, description: "When LeBron accelerates down the court, he produces tremendous force. The LeBron 18 is designed to harness his abilities while helping with the stress he puts on his body. Combined cushioning underfoot allows him to use his power for unstoppable bursts of speed.", imageName: ["nike-lebron-1.jpg","nike-lebron-2.jpg","nike-lebron-3.jpg","nike-lebron-4.jpg"]),
        Product(title: "Nike Air Max 97 Pendleton By You", price: 18695, description: "The Nike Air Max 97 Pendleton By You celebrates the spirit of the pioneers with brand-new Pendleton wool options to customise a Nike icon. Choose from 4 different wools including a premium wool twill or the Scout Stripe pattern. OG or custom overlays, an embossed luggage tag and other premium details are just the start of a brand-new take on our seasonal collaboration with the historic woollen mill.", imageName: ["custom-nike-air-1.jpg","custom-nike-air-2.jpg","custom-nike-air-3.jpg","custom-nike-air-4.jpg"])
    ]
    
    private let adidasShoes = [
        Product(title: "Adidas Running Solarboost 19", price: 15999, description: "There's no such thing as an ordinary run. These men's shoes provide targeted support and optimal comfort for everyday long-distance running. Inspired by NASA technology, the mesh upper has stitched-in areas of reinforcement for precisely calibrated support. Responsive cushioning returns energy to your stride to give you a smooth, confident ride.", imageName: ["blue-adidas-1.jpeg","blue-adidas-2.jpeg","blue-adidas-3.jpeg","blue-adidas-4.jpeg"]),
        Product(title: "Adidas Running Ultraboost 20", price: 18999, description: "A new day. A new run. Make it your best. These high-performance shoes feature a foot-hugging knit upper. Stitched-in reinforcement is precisely placed to give you support in the places you need it most. The soft elastane heel delivers a more comfortable fit. Responsive cushioning returns energy to your stride with every footstrike for that I-could-run-forever feeling.", imageName: ["green-adidas-1.jpeg","green-adidas-2.jpeg","green-adidas-3.jpeg","green-adidas-4.jpeg"]),
        Product(title: "Adidas Running Adizero Adios Pro", price: 19999, description: "Forget what you knew about ADIZERO ADIOS. This world record-breaking shoe has been totally re-imagined. Together with some of our fastest running athletes, like Joyciline Jepkosgei and Rhonex Kipruto, we've co-created something that's challenging everything we knew about bending stiffness, energy return, mass reduction and design geometry to optimize running economy for faster, longer runs. Introducing ADIZERO ADIOS PRO. Not just fast, WTFAST.", imageName: ["red-adidas-1.jpeg","red-adidas-2.jpeg","red-adidas-3.jpeg","red-adidas-4.jpeg"]),
        Product(title: "Adidas Running Ultraboost", price: 17999, description: "A new day. A new run. Make it your best. These high-performance shoes feature a foot-hugging knit upper. Stitched-in reinforcement is precisely placed to give you support in the places you need it most. The soft elastane heel delivers a more comfortable fit. Responsive cushioning returns energy to your stride with every footstrike for that I-could-run-forever feeling.", imageName: ["white-adidas-1.jpeg","white-adidas-2.jpeg","white-adidas-3.jpeg","white-adidas-4.jpeg"])
    ]
    
    private let pumaShoes = [
        Product(title: "Porsche Design High OCTN CMEVA", price: 19999, description: "Buckle up. The motorsport-inspired design of these Porsche Design High OCTN Men's Trainers punctuates a truly functional shoe. The rugged midsole is inspired by tyre treads. They're ready for wet surfaces, because the road is long and conditions aren't always favourable. And if it looks like they have a story to tell, they do: they're made from mainly recycled materials. These trainers have lived. Just like you.", imageName: ["puma-black-1.jpeg","puma-black-2.jpeg","puma-black-3.jpeg","puma-black-4.jpeg"]),
        Product(title: "PUMA x KIDSUPER Nitefox Sneakers", price: 11999, description: "Make a statement, and make it bold with this playful Nitefox and KIDSUPER collaboration. This new must-have for any sneaker dedicate features in-your-face colour stories and an ultra chunky sole paired with whimsical plays on shape and form, exaggerated stitching and a PUMA King tongue for a memorable, one-of-a-kind trainer.", imageName: ["puma-gold-1.jpeg","puma-gold-2.jpeg","puma-gold-3.jpeg","puma-gold-4.jpeg"]),
        Product(title: "RS Dreamer Basketball Shoes", price: 9999, description: "Known for its technical precision and support, one of our most iconic running styles has now been adapted for the basketball court. With cool colour contrasting, chunky lines and a sporty silhouette, the RS Dreamer will let you show off your agility, all while looking sharp.", imageName: ["puma-1.jpeg","puma-2.jpeg","puma-3.jpeg","puma-4.jpeg"]),
        Product(title: "RS-X Millennium Shoes", price: 9999, description: "We've elevated our classic running system to unseen heights with the RS-X, for those born to stand out from the crowd. Our RS-X Millenium celebrates the technology boom of the early 2000s, expressed in the exaggerated shapes and innovative play with overlay and colour stories.", imageName: ["white-puma-1.jpeg","white-puma-2.jpeg","white-puma-3.jpeg","white-puma-4.jpeg"])
    ]
    
    //MARK: - Get Category and Product Function
    func getCategories() -> [Caterogy] {
        return categories
    }
    
    func getProducts(forCategory title: String) -> [Product] {
        switch title {
        case "NIKE":
            return getNikeShoes()
        case "ADIDAS":
            return getAdidasShoes()
        case "PUMA":
            return getPumaShoes()
        default:
            return getNikeShoes()
        }
    }
    
    func getNikeShoes() -> [Product] {
        return nikeShoes
    }
    
    func getAdidasShoes() -> [Product] {
        return adidasShoes
    }
    
    func getPumaShoes() -> [Product] {
        return pumaShoes
    }
    
    //MARK: - Cart Service
    
    private(set) public var cart = Cart()
    
    //Adding Product
    mutating func addProduct(toCart product: Product, numberOfProduct: Int, status: Bool) {
        let selectedProduct = SelectedProduct(selectedProduct: product, addToCart: status, quantity: numberOfProduct)
        cart.products.append(selectedProduct)
    }
    
    //Removing Product
    mutating func removeProduct(fromCart product: Product?, selectedProduct: SelectedProduct?) {
        if let product = product {
            for (index, value) in cart.products.enumerated() {
                if value.selectedProduct.title == product.title && value.quantity != 0 {
                    cart.products.remove(at: index)
                }
            }
            return
        }
        if let product = selectedProduct {
            for (index, value) in cart.products.enumerated() {
                if value.selectedProduct.title == product.selectedProduct.title && value.quantity != 0 {
                    cart.products.remove(at: index)
                }
            }
            return
        }
        
    }
    
    //Getting Product Count in cart
    func getCartProductCount() -> Int {
        return cart.products.count
    }
    
    //Getting total quantity in cart
    func getQuantityCount() -> Int {
        var count = Int()
        for (_, product) in cart.products.enumerated() {
            count += product.quantity
        }
        return count
    }
    
    //Checking items in cart
    func isAddedToCart(_ product: Product) -> String {
        if cart.products.isEmpty { return "heart" }
        for (_, value) in cart.products.enumerated() {
            if value.selectedProduct.title == product.title && value.addToCart == true {
                return "heart.fill"
            }
        }
        return "heart"
    }
    
    //Checking whether product is in cart or not
    func isProductInCart(_ product: Product) -> Bool {
        for (_, value) in cart.products.enumerated() {
            if value.selectedProduct.title == product.title && value.addToCart == true {
                return true
            }
        }
        return false
    }
    
    //Updating quantity of product in cart
    mutating func updateQuantity(incart withItem: SelectedProduct?,optionalItem: Product? = nil , with quantity: Int) {
        //Selected item from CheckoutVC
        if let product = withItem {
            for (index, value) in cart.products.enumerated() {
                if value.selectedProduct.title == product.selectedProduct.title {
                    cart.products[index].quantity = quantity
                }
            }
            return
        }
        //Product from DeatailVC
        if let product = optionalItem {
            for (index, value) in cart.products.enumerated() {
                if value.selectedProduct.title == product.title {
                    cart.products[index].quantity += quantity
                }
            }
            return
        }
    }
    
    //Getting total amount of cart
    func getTotalAmount() -> Double {
        var amount = Double()
        for (_, product) in cart.products.enumerated() {
            amount += Double(product.quantity) * product.selectedProduct.price
        }
        return amount
    }
    
    //Empty cart
    mutating func emptyCart() {
        cart.products.removeAll()
    }
}
