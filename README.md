---

# Paragliding Smart Contract

This Solidity smart contract is designed to manage the registration and eligibility verification of individuals for paragliding based on their weight. The contract enforces a strict condition that only individuals weighing less than 80 kg are eligible to participate.

## Contract Overview

- **Contract Name:** `Paragliding`
- **Compiler Version:** `0.8.18`
- **License:** MIT

### State Variables

- `uint public viewerWeight`: Stores the weight of the individual registering for paragliding.

### Functions

1. **`register(uint _weight) public`:**
   - Registers the weight of the individual.
   - Input: `_weight` (weight in kilograms).

2. **`checkAssert() public view`:**
   - Checks that the weight of the individual is below 80 kg using the `assert` statement.
   - If the condition fails (i.e., weight is 80 kg or more), the transaction will revert, consuming all gas.

3. **`checkRequire() public view`:**
   - Enforces that the weight is below 80 kg using the `require` statement.
   - If the condition fails, the transaction will revert, providing the message "You must weigh less than 80 kg to do paragliding."

4. **`checkRevert() public view`:**
   - Uses the `revert` statement to enforce that the weight is below 80 kg.
   - If the weight is 80 kg or more, the transaction will revert with the message "You must weigh less than 80 kg to do paragliding."

## How to Use

1. **Registering a Weight:**
   - Call the `register(uint _weight)` function with the individual’s weight in kilograms.

2. **Checking Eligibility:**
   - Call `checkAssert()` to ensure the weight is below 80 kg. This will use `assert`, which is typically used for internal error detection.
   - Call `checkRequire()` to enforce the weight condition, ensuring that the weight is below 80 kg. This will provide an error message if the condition is not met.
   - Call `checkRevert()` to enforce the weight condition similarly to `checkRequire()`, but using a `revert` statement.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---



### Notes

- The `assert` statement is used to check for conditions that should never occur in the contract's logic. If `assert` fails, it indicates a serious error.
- The `require` and `revert` statements are used to enforce conditions and provide informative error messages if those conditions are not met.

---
