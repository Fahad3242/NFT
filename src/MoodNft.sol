//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    string private s_sadSvgImageUri;
    string private s_happySvgImageUri;
    uint256 private s_tokenCounter;

    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("MoodNft", "MN") {
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
        s_tokenCounter = 0;

    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory){

    }
}