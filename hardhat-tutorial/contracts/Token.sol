pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract Token {
	string public name = "My Hardhat Token";
	string public symbol = "MHT";

	uint256 public totalSupply = 1000000;

	address public owner;

	// a mapping is a key/value map. Here we store each account's balance
	mapping(address => uint256) balances;

	// The Transfer event helps off-chain applications understand
	// what happens within your contract.
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	/**
	 * Contract initialization.
	 */
	constructor() {
		// The totalSupply is assigned to the transaction sender, which
		// is the account that is deploying the contract.
		balances[msg.sender] = totalSupply;
		owner = msg.sender;
	}

	// A function to transfer tokens.
	// The `external` modifier makes a function *only* callable form *outside*
	// the contract.
	function transfer(address to, uint256 amount) external {
		require(balances[msg.sender] >= amount, "Not enough tokens");

		console.log(
			"Transferring from %s to %s %s tokens",
			msg.sender,
			to,
			amount
		);

		balances[msg.sender] -= amount;
		balances[to] += amount;

		emit Transfer(msg.sender, to, amount);
	}

	// Read only function to retrieve the token balance of a given account.
	// The `view` modifier indicates that it doesn't modify the contract's
	// state, which allows us to call it without executing a transaction.
	function balanceOf(address account) external view returns (uint256) {
		return balances[account];
	}
}
