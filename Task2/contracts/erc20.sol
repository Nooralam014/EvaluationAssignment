pragma solidity ^0.8.17;

contract Token{

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 public totalSupply;

    string public name;
    
    string public symbol;
    
    uint8 public decimals;

    address public owner;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        owner = msg.sender;
    }

//events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

//modifiers
modifier onlyOwner{
    require(msg.sender == owner, "Only owner can call this function");
    _;
}
modifier validAccount(address inputAddress){
    require(inputAddress != address(0),"Insert valid account");
    _;
}    

//read methods

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

//write methods
    

    function approve(address spender, uint256 value) external validAccount(spender) {
        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
     }

    function transfer(address to, uint256 value) external validAccount(to) {
        _balances[msg.sender] -= value;
        _balances[to] += value;
        emit Transfer(msg.sender, to, value);
    }


    function transferFrom(address from, address to, uint256 value) external validAccount(from) validAccount(to){
        _allowed[from][msg.sender] -= value;
        _balances[from] -= value;
        _balances[to] += value;
        emit Transfer(from, to, value);
        emit Approval(from, msg.sender, _allowed[from][msg.sender]);
    }

// below functions are important for any ERC20 token but not defined in what i have to do
function mint(address to, uint256 value) external onlyOwner validAccount(to){                                        
        totalSupply += value;
        _balances[to] += value;
        emit Transfer(address(0), to, value);

    }
    
function burn(address account, uint256 value) public onlyOwner validAccount(account){
        require(_balances[account] >= value, "Invalid Value");
        totalSupply -= value; 
        _balances[account] -= value;
        emit Transfer(account, address(0), value);
    }

}