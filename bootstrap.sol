// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

contract Bootstrap {
  
     function generateRandomIndex(uint256 seed, uint length) internal view returns (uint) {
        uint randomNumber = uint(
            uint256(keccak256(abi.encodePacked(block.timestamp, seed))) % length
        );
        return randomNumber;
    }
    
    function shuffle(uint[] memory dataSeries,uint256 seed) public view returns(uint[] memory) {
        uint256 dataLength = uint256(dataSeries.length);
        uint bootstrapIndex = generateRandomIndex(seed, dataLength);
        uint[] memory sample = new uint[](dataLength);

        for(uint j=0; j < dataLength; j++){
            sample[j] = dataSeries[bootstrapIndex];
            bootstrapIndex = generateRandomIndex(seed+j, dataLength);
        }
        return   sample;
    }
}