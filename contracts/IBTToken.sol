pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IBTToken is ERC20, Ownable {
    constructor() ERC20("IBT", "IBT") Ownable(msg.sender) {
        _mint(msg.sender, 5 * 10 ** decimals());
    }

    // Mint function - only callable by the owner (deployer)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn function - only callable by the owner (deployer)
    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }
}
