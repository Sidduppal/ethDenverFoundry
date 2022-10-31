// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/volcanoCoin.sol";

contract volcanoCoin is Test {
    VolcanoCoin public volcanoCoin;

    function setUp() public {
        volcanoCoin = new VolcanoCoin();
    }

    function testInitialSupply() public {
        assertEq(volcanoCoin.getTotalSupply(), 10000);
    }
}
