// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract E_Commerce {

    struct Product {
        string title;
        string description;
        address payable seller;
        uint product_Id;
        uint price;
        address buyer;
        bool delivered;
    }

    uint counter;
    Product[] public products;
    event addedProduct(string title, uint product_Id, address seller);
    event bought(uint product_Id, address buyer);
    event delivered(uint product_Id);

    enum Status { Added,Bought,Delivered,Cancel}
    Status status;
    mapping(uint => Status) productStatus;
    
    function addProduct(string memory _title, string memory _description, uint _price) public {
        require(_price>0, "Price should be greater than zero");
        Product memory product;
        product.title = _title;
        product.description = _description;
        product.price = _price * 10**18;
        product.seller = payable(msg.sender);
        product.product_Id = counter;
        products.push(product); 
        status= Status.Added;
        productStatus[product.product_Id]=status;
        counter++;
        emit addedProduct(_title, product.product_Id, msg.sender);
    }

    function buy(uint _product_Id) payable public {
        require(productStatus[_product_Id]== Status.Added, "invalid Item");
        require(products[_product_Id].price == msg.value, "please pay the exact price");
        require(products[_product_Id].seller != msg.sender, "seller cannot be the buyer");
        require(msg.sender != address(0), "Invalid Adress");
        products[_product_Id].buyer = msg.sender;
        productStatus[_product_Id]= Status.Bought;
        emit bought(_product_Id, msg.sender);
    }

    function delivery(uint _product_Id) public {
        require(productStatus[_product_Id]==Status.Bought,"Try to buy first");
        require(msg.sender == products[_product_Id].buyer, "Only buyer can confirm it");
        products[_product_Id].delivered = true;
        products[_product_Id].seller.transfer(products[_product_Id].price);
        productStatus[_product_Id]=Status.Delivered;
        emit delivered(_product_Id);
    }

    function cancelOrder(uint _product_Id) public {
        require(products[_product_Id].buyer == msg.sender, "You didn't order this item");
        require(productStatus[_product_Id]==Status.Bought,"Buy Item Before");
        productStatus[_product_Id]==Status.Cancel;
        uint balance=products[_product_Id].price;
        (bool success,) = payable(msg.sender).call{value:balance}("");
        require(success, "Failed");
        products[_product_Id].buyer = address(0);
    }
}