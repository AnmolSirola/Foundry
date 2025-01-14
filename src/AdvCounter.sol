// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract AdvCounter {
    uint256 public count;

    function get() public view returns (uint256) {
        return count;
    }

    function inc() public {
        count += 1;
    }

    function dec() public {
        count -= 1;
    }
}
