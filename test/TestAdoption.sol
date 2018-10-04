pragma solidity ^0.4.17;

import "truffle/Assert.sol";   // import Assertion
import "truffle/DeployedAddresses.sol";  // get the address of tested contract
import "../contracts/Adoption.sol";      // contract to be tested

contract TestAdoption {
	Adoption adoption = Adoption(DeployedAddresses.Adoption());

	// test adopt funtion
	function testUserCanAdoptPet() public {
		uint returnedId = adoption.adopt(8);
		uint expected = 8;
		Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
	}

	// test the address of adopter
	function testGetAdopterAddressByPetId() public {
		// 期望领养者的地址就是本合约地址，因为交易是由测试合约发起交易，
		address expected = this;
		address adopter = adoption.adopters(8);
		Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
	}

	// test all owners
	function testGetAdopterAddressByPetIdInArray() public {
		address expected = this;
		// store adopters in memory rather than contract's storage
		address[16] memory adopters = adoption.getAdopters();
		Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
	}
}