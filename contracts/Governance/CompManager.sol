pragma solidity ^0.7.1;

import "./CompManagerStorage.sol";
import "../EIP20Interface.sol";

contract CompManager is CompManagerStorage {

	function transfer(address dst, uint amount) {
		require(msg.sender == admin);
		EIP20Interface comp = EIP20Interface(getCompAddress());
		comp.transfer(dst, amount);
	}


	function getCompAddress() public view returns (address) {
        return 0xc00e94Cb662C3520282E6f5717214004A7f26888;
    }
}