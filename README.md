
<h1 align="center" style="border-botom: none">
  <b>
   🔥 Smart contract with a simple bootstrap algorithm  🔥 
  </b>
</h1>

</br>

Popular bootstraping algorithm to generate alternative sequences of existing data.

## Problem

When working with time-series data, the user might want to test their algorithms on counterfactuals (different combination and sequence of data points).

## Solution

One of the simplest techniques avalible is bootstrapping [Wiki link](en.wikipedia.org/wiki/Bootstrapping_(statistics)). The idea is to randomly choose elements from the time-series and stack them in a new sequence. This requires almost no additional assumptions on the behaviour or distribution of the data. The one key assumption is that each element is independent of others. If this is not the case, other methods might be more suitable. For example, if a week dependance is observed, the stationary bootstrap algorithm implemented in [Python] or in [Matlab].

 [Python]:github.com/qnity/insurance_python/tree/main/stationary-bootstrap
 [Matlab]:github.com/qnity/insurance_matlab/tree/main/stationary-bootstrap

## Input

Once the user deploys the smart contract on a virtual machine and deploys the Bootstrap contract, the contract can use the public "shuffle" function to calculate a new bootstrapped sample. The inputs are:

    - `dataSeries`... array with a sequence of elements which we want to include in the bootstrapped sequence.
    - `seed` unsigned 256 integer that will become the seed for the random selection of elements.

## Output

    - array of the same length as "dataSeries", with randomly selected elements.

# Getting started

Assuming the user wants to test the performance of their investment strategy for Bitcoin trading. For this they have to generate multiple different performance scenarios. The user knows that for years 2018, 2019, 2020 and 2021 the return was -72.6%, 87.2%, 402.8%, and 57.6%. Because Solidity makes it easier to work with integers, the return can also be expressed in basis points as -7260, 8720, 40280, and 5760. The user wants to generate an alternative time-series starting with a seed of 42.

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
