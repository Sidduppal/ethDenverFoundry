// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// Standard test libs
import "forge-std/Test.sol";

// Contract under test
import "../src/volcanoCoin.sol";

contract volcanoCoin is Test {
    // Variable for contract instance
    VolcanoCoin public volcanoCoin;

    function setUp() public {
        // Instantiate new contract instance
        volcanoCoin = new VolcanoCoin();
    }

    function testInitialSupply() public {
        assertEq(volcanoCoin.getTotalSupply(), 10000);
        volcanoCoin.updateSupply();
        assertEq(volcanoCoin.getTotalSupply(), 11000);
    }

    function testFailUpdateSupplyAsNotOwner() public {
        vm.prank(address(0));
        volcanoCoin.updateSupply();
    }
}
