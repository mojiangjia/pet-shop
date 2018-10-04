pragma solidity ^0.4.17;

contract Adoption {

	address[16] public adopters;  // adopters' addresses

	// adopt a pet
	function adopt(uint petId) public returns (uint) {
		require(petId >= 0 && petId <= 15);  // make sure petId is in the range
		adopters[petId] = msg.sender;        // save the adopter's address
		return petId;
	}

	// get the adopters
	function getAdopters() public view returns (address[16]) {
		return adopters;
	}

}