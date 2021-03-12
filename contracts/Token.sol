// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Token is AccessControl, ERC721 {
 	using Counters for Counters.Counter;
	Counters.Counter private _tokenIds;
	mapping(string => bool) private hashExists;

	bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
	bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
	
	constructor() ERC721("MyNFT", "MNFT") {
		_setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
		_setupRole(MINTER_ROLE, _msgSender());
		_setupRole(PAUSER_ROLE, _msgSender());
	}
	
	function mint(address to, string memory tokenURI, string memory hash) public {
		require(hasRole(MINTER_ROLE, _msgSender()), "ERC721: must have minter role to mint");
		require(!hashExists[hash], "ERC721: hash already minted");
		_tokenIds.increment();

		uint256 newItemId = _tokenIds.current();
		_mint(to, newItemId);
		_setTokenURI(newItemId, tokenURI);
		hashExists[hash] = true;
	}
}
