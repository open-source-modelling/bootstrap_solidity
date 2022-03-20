// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

contract Bootstrap {
    // Bootstrap is a contract that returns a bootstrapped sequence 
    // (Same elements as the original array but randomly sampled with replacement)
    
     function generateRandomIndex(uint256 seed, uint length) internal view returns (uint) {
         // Function used to generate the next random index. It does this by running a seed
         // through the built-in keccak256 algorithm and taking the modulo of the result.
        uint randomNumber = uint(
            uint256(keccak256(abi.encodePacked(block.timestamp, seed))) % length
        );
        return randomNumber;
    }
    
    function shuffle(uint[] memory dataSeries,uint256 seed) public view returns(uint[] memory) {
        // Calling this function with an array as an input and a randomly choosen seed, generates as output
        // an array of same length with randomly sampled elements.
        // Arguments:
        //    dataSeries = array with a sequence of elements which we want to include in the bootstrapped sequence
        //    seed =       integer that will become the seed for the first index
        //
        // Returns:
        //    array =  array of the same size as dataSeries but with randomly sampled elements (with replacement)

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
