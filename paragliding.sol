// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Paragliding {

    uint public viewerWeight;

    function register(uint _weight) public {
        viewerWeight = _weight;
    }

    // Function that uses assert to ensure the weight is below 80 kg
    function checkAssert() public view {
        // Assert that the weight is below 80 kg
        assert(viewerWeight < 80);
    }

    // Function that uses require to enforce weight conditions
    function checkRequire() public view {
        require(viewerWeight < 80, "You must weigh less than 80 kg to do paragliding.");
    }

    // Function that uses revert to enforce weight conditions
    function checkRevert() public view {
        if (viewerWeight >= 80) {
            revert("You must weigh less than 80 kg to do paragliding.");
        }
    }
}
