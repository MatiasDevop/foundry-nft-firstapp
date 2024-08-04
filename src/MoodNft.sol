// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Base64 } from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;

    enum Mood {
        HAPPY,
        SAD
    }
    
    mapping (uint256 => Mood ) private s_tokenIdToMood;

    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("Mood Nft", "MN") {
        s_tokenCounter = 0;
        s_sadSvg = sadSvgImageUri;
        s_happySvg = happySvgImageUri;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory tokenMetadata = string.concat('{"name": "', name(),'", "description": "An Nft that reflects the owners mood.", "attributes": [{"trait_type": "moodiness","value": 100 }], "image": "',
        imageURI,'"}');

    }
}