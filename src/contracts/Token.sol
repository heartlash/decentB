// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

  address public minter;

  //add minter changed event

  constructor() public payable ERC20("NeonTimes", "NTC") {
    minter = msg.sender;
  }

  function passMinterRole(address dbank) public onlyMinter returns (bool){
    minter = dbank;
    return true;
  }

  function mint(address account, uint256 amount) public onlyMinter{
    //check if msg.sender have minter role
		_mint(account, amount);
	}

  modifier onlyMinter(){
    require(minter == msg.sender, 'Error!!!! You need minter privilege to perform ');
    _;
  } 
}