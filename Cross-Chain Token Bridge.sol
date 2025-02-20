// Minor update: Comment added for GitHub contributions
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CrossChainTokenBridge {
    mapping(address => mapping(address => uint256)) public balances;

    event TokenTransferred(address indexed from, address indexed to, uint256 amount, address indexed token);

    function transferTokens(address to, uint256 amount, address token) external {
        require(amount > 0, "Amount must be greater than zero");
        balances[token][msg.sender] -= amount;
        balances[token][to] += amount;
        emit TokenTransferred(msg.sender, to, amount, token);
    }

    function balanceOf(address user, address token) external view returns (uint256) {
        return balances[token][user];
    }
}
