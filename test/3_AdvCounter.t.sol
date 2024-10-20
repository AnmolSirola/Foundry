// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {AdvCounter} from "../src/AdvCounter.sol";

contract AdvCounterTest is Test {
    AdvCounter public advCounter;

    function setUp() public {
        advCounter = new AdvCounter();
    }

    function testInc() public {
        advCounter.inc();
        assertEq(advCounter.count(), 1);
    }

    function testFailDec() public {
        advCounter.dec();
    }

    function testDecUnderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        advCounter.dec();
    }

    function testDec() public {
        advCounter.inc();
        advCounter.inc();
        advCounter.dec();
        assertEq(advCounter.count(), 1);
    }
}
