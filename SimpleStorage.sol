//SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

contract SimpleStorage {

    //This will initialize to 0
    //public vars includes a view function
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //View functions only reads a state of the chain, meaning it's free to do so
    //Not making a state change means you don't have to make a transaction
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    //pure functions only does math, not storing it anywhere
    function pureRetrieve(uint256 _favoriteNumber) public pure {
        _favoriteNumber + _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}