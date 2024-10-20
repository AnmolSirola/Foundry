// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error public error;

    function setUp() public {
        error = new Error();
    }

    function testFail() public {
        error.throwError();
    }

    // expect Revert
    function testRevertMessage() public {
        vm.expectRevert();
        error.throwError();
    }
    // Require message
    function testRequireMessage() public {
        vm.expectRevert(bytes("not authorized"));
        error.throwError();
    }
    // Custom Error
    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        error.throwCustomError();
    }
}
 