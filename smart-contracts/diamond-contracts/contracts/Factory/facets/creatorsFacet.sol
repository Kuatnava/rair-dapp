// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11; 

import '../AppStorage.sol';

/// @title 	Our Facet creators contract
/// @notice You can use this contract to view the creator of contracts and the list of contractsdeployed
contract creatorFacet is AccessControlAppStorageEnumerable {
	/// @notice Returns the number of addresses that have deployed a contract
	/// @return uint with the total of creators of this contract
	function getCreatorsCount() public view returns(uint count) {
		return s.creators.length;
	}

	/// @notice Returns a single address inside the creators array
	/// @param 	index number of the index for look inside our array
	/// @return address of the selected index
	function getCreatorAtIndex(uint index) public view returns (address creator) {
		creator = s.creators[index];
	}

	/// @notice Returns the number of contracts deployed by an address
	/// @dev	Use alongside creatorToContracts for the full list of tokens 
	/// @param	deployer	Wallet address to query
	/// @return uint of total contracts for the address
	function getContractCountOf(address deployer) public view returns(uint count) {
		return s.creatorToContracts[deployer].length;
	}

	/// @notice Necessary view function now that public mappings are not possible
	/// @param 	deployer Contains the facet addresses and function selectors
	/// @param 	index Contains the facet addresses and function selectors
	/// @return address of the contract ERC721 for a deployer that is in the selected index
	function creatorToContractIndex(address deployer, uint index) public view returns(address deployedContract) {
		return s.creatorToContracts[deployer][index];
	}

	/// @notice Returns the whole array of deployed addresses of a creator
	/// @param 	deployer Contains the facet addresses and function selectors
	/// @return address array of the deployed contracts  
	function creatorToContractList(address deployer) public view returns(address[] memory deployedContracts) {
		return s.creatorToContracts[deployer];
	}

	/// @notice Returns the address of the creator given a deployed contract's address
	/// @param 	deployerContract Contains the facet addresses and function selectors
	/// @return address of the contracts creator
	function contractToCreator(address deployedContract) public view returns (address creator) {
		creator = s.contractToCreator[deployedContract];
	}
}