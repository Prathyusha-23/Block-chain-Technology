pragma solidity ^0.8.0;

contract SupplyChain {

    struct Product {
        uint productId;
        address owner;
        address[] previousOwners;
        string name;
        uint price;
        string status;
    }
    
    mapping(uint => Product) products;
    uint productIdCounter = 0;
    
    function createProduct(string memory _name, uint _price) public {
        productIdCounter++;
        products[productIdCounter] = Product(productIdCounter, msg.sender, new address[](0), _name, _price, "created");
    }
    
    function getProduct(uint _productId) public view returns (Product memory) {
        return products[_productId];
    }
    
    function updateProductStatus(uint _productId, string memory _status) public {
        require(products[_productId].owner == msg.sender, "Only the current owner can update the status");
        products[_productId].status = _status;
    }
    
    function transferOwnership(uint _productId, address _newOwner) public {
        require(products[_productId].owner == msg.sender, "Only the current owner can transfer ownership");
        products[_productId].previousOwners.push(products[_productId].owner);
        products[_productId].owner = _newOwner;
}
}
