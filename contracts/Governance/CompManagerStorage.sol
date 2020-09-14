pragma solidity ^0.7.1;


contract CompManagerUnitrollerAdminStorage {
    /**
    * @notice Administrator for this contract
    */
    address public admin;

    /**
    * @notice Pending administrator for this contract
    */
    address public pendingAdmin;

    /**
    * @notice Active brains of CompMangerUnitroller
    */
    address public compManagerImplementation;

    /**
    * @notice Pending brains of CompMangerUnitroller
    */
    address public pendingCompManagerImplementation;
}

contract CompManagerStorage is CompManagerUnitrollerAdminStorage {
    // Storage here
}