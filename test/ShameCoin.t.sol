// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// Standard test libs
import "forge-std/Test.sol";

// Contract under test
import "../src/ShameCoin.sol";

contract ShameCoinTest is Test {
    // Variable for contract instance
    ShameCoin public shameCoin;

    function setUp() public {
        // Instantiate new contract instance
        shameCoin = new ShameCoin(100);
    }

    function testOwner() public {
        assertEq(
            shameCoin.owner(),
            address(0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84)
        );
    }

    function testMint() public {
        shameCoin.mint(msg.sender, 10);
        assertEq(shameCoin.balanceOf(msg.sender), 10);
    }

    function testTransfer() public {
        shameCoin.transfer(address(2), 1);
        assertEq(shameCoin.balanceOf(address(2)), 1);
        assertEq(shameCoin.balanceOf(shameCoin.owner()), 99);
    }

    function testFailTransfer() public {
        shameCoin.transfer(address(2), 3);
        vm.startPrank(address(1));
        shameCoin.transfer(address(2), 1);
        assertEq(shameCoin.balanceOf(address(2)), 1);
        vm.stopPrank();
    }

    function testApprove() public {
        shameCoin.transfer(address(1), 1);
        assertEq(shameCoin.balanceOf(address(1)), 1);
        vm.startPrank(address(1));
        shameCoin.approve(shameCoin.owner(), 1);
        vm.stopPrank();
        shameCoin.transferFrom(address(1), address(2), 1);
    }

    function testFailApprove() public {
        shameCoin.approve(address(3), 1);
        shameCoin.approve(shameCoin.owner(), 10);
    }
}
