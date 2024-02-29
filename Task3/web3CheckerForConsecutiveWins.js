require('dotenv').config();
var Web3 = require('web3');
var web3 = new Web3(new Web3.providers.HttpProvider(`https://eth-goerli.g.alchemy.com/v2/${process.env.projectId}`));

var contractAddress = "0x847b63dECb567161f0C53be219680b69690564d0";
const ABI = [{"inputs":[],"name":"consecutiveWins","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"}]

const contract = new web3.eth.Contract(ABI, contractAddress);
async function test(){
  await contract.methods.consecutiveWins().call({}, (error, result) => {
    if (error) {
      console.log("error", error.message);
    }
    console.log("ConsecutiveWins: ", result);
  });
}
test()