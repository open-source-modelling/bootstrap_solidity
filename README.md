# Smart contract with a simple bootstrap algorithm 
</br>

## Problem
When looking at for example time-series data, the user might want to test their algorithm with a different combination of elements. For example a counter-factural.

## Solution
One of the simplest algorithms avalible is bootstrapping.  LINK The idea is simply to randomly choose elements from the time-series and stack them in a new output series. This requires almost no additional assumptions on the behaviour and distribution of the data. The one key assumption is that each element is independent from others. If this is not the case, other methods might be more suitable. For example, if you observe a week dependance inside the time-series, look at the stationary bootstrap algorithm implemented in Python or Matlab.

## Input
Once the user deploys the smart contract on a virtual machine and deploys the Bootstrap contract, everybody can use the "shuffle" function to calculate a new bootstrapped sample. The inputs are:

    - dataSeries... array with a sequence of elements which we want to include in the bootstrapped sequence
    - seed unsigned 256 integer that will become the seed for the random selection of elements.

## Output
    - array of the same length as the dataSeries, with randomly selected indices

# Getting started
Assume the user wants to test the performance of their investment strategy for Bitcoin trading. For this they have to generate multiple different performance scenarios for the asset. They know that for years 2018-2021 the return was -72.6%, 87.2%, 402.8%, and 57.6%. Because Solidity makes it easier to work with integers, the return can also be expressed in basis points as -7260, 8720, 40280, and 5760. The user wants to generate an alternative time-series starting with a seed of 42. 

``` solidity
// 1) Compile bootstrap.sol file
// 2) Deploy the Bootstrap contract on a chain
// 3) For the shuffle function, insert: 
//     In the dataSeries field:
       [-7260, 8720, 40280, 5760]
//     In the seed field:
       42
    Example output:
    [-7260,-7260,8720,5760]
```
