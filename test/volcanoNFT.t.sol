// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// Standard test libs
import "forge-std/Test.sol";

// Contract under test
import "../src/volcanoNFT.sol";

contract volcanoNFTTest is Test {
    // Variable for contract instance
    VolcanoNFT public volcanoNFT;

    function setUp() public {
        // Instantiate new contract instance
        volcanoNFT = new VolcanoNFT();
    }

    function testMint() public {
        // vm.startPrank(address(1));
        volcanoNFT.mintNFT(msg.sender);
        assertEq(volcanoNFT.balanceOf(msg.sender), 1);
        assertEq(volcanoNFT.ownerOf(0), msg.sender);
        // The following line will not work. My guess is that msg.sender is somehow not approved to make the transaction. That's why in the next test I had to use vm.startPrank.
        // volcanoNFT.transferNft(msg.sender, address(2), 0);
    }

    function testTransferNft() public {
        // https://book.getfoundry.sh/cheatcodes/start-prank
        vm.startPrank(address(1));
        volcanoNFT.mintNFT(address(1));
        volcanoNFT.transferNft(address(1), address(2), 0);
        assertEq(volcanoNFT.balanceOf(address(1)), 0);
        assertEq(volcanoNFT.balanceOf(address(2)), 1);
        assertEq(volcanoNFT.ownerOf(0), address(2));
    }
}
