// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;
//INTERNAL IMPORT FOR NFT OPENZIPLINE
//hello
import "@openzeppelin/contracts/utils/Counters.sol";//using as a counter to count the contract
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NFTMarketplace is ERC721URIStorage{
    using Counters for Counters.counter;

    Counters.Counter private _tokenIds;
    Counters.Counter private _itemsSold;
    uint256 listingPrice= 0.0025 ether;

    address payable owner;
    mapping(uint256=>MarketItem) private idMarketItem;
    struct MarketItem{
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }
    modifier onlyOwner(){
        require(
            msg.sender==owner,"only owner can access the price");_;
    }
    event idMarketItemCrested(
        uint256 indexed tokenId,
        address seller,
        address owner,uint256 price,
        bool sold
    );

    constructor() ERC721("NFT Metaverse Token","MYNFT"){
        owner ==payable(msg.sender);

        
    }
    function updateListingPrice(uint256 _listingPrice) 
    public 
    payable onlyOwner(){
            listingPrice=_listingPrice;
    }
}

