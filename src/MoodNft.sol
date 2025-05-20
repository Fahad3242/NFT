//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    string private s_sadSvgImageUri;
    string private s_happySvgImageUri;
    uint256 private s_tokenCounter;

    error MoodNFT__CantFlipMoodIfNotOwner();

    enum Mood{
        SAD,
        HAPPY   
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("MoodNft", "MN") {
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
        s_tokenCounter = 0;

    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
        ) public view override returns (string memory)
        {
        string memory ImageUri;
            if(s_tokenIdToMood[tokenId] == Mood.HAPPY) {
                ImageUri = s_happySvgImageUri;
            } else {
                ImageUri = s_sadSvgImageUri;
            }

                return string(
                    abi.encodePacked(
                        _baseURI(),
                        Base64.encode(
                        bytes(
                            abi.encodePacked(
                            '{"name: "',
                            name(),
                            '", description: "An NFT that reflects your mood!", "attributes": [{"trait_type": "Mood", "value": 100}], "image": ',
                            ImageUri,
                            '"}'
                            )
                        )
                    )
                )
            );
        }

    function flipMood(uint256 tokenId) public {
    if(getApproved(tokenId) != msg.sender && ownerOf(tokenId) != msg.sender) {
        revert MoodNFT__CantFlipMoodIfNotOwner();
    }
}

    }