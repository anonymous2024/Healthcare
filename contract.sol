pragma solidity ^0.5.10;

// authorization smart contract
contract Authorization 
{
    struct Person {
        string firstName;
        string lastName;
        uint id;
        address ethaddress;
    }
    
    bool isAuthorised = false;
    Person set;
    
    mapping (address => uint) list;
    constructor() public {
        
        // read from the database
         set.ethaddress = msg.sender;
    }
    
    // functionn to authorized patients for doctors
    
    // fucntion to cancel patients for doctors
    
    function add() public payable {
        list[msg.sender] += msg.value;
         isAuthorised = true;
    }
    
}


// contract to register patient
contract Data_Owner is Authorization{
    struct Owner {
        string firstName;
        string lastName;
        uint age;
        address ethaddress;
        uint id;
    }
    
    // initializartion
    bool isAuthorised = false;
    uint dataset;
    
    mapping( address => uint) authorised_list;
    uint [] authorized_operations = new uint[](2);
    bool open = true;
    Owner owner;
    
    //save the address 
    constructor() public {
        
        // read from the database
        
         owner.ethaddress = msg.sender;
    }
     
    // add in authorised list
    
    function add_authorization() public payable {
        authorised_list[msg.sender] += msg.value;
         isAuthorised = true;
    }
    
    // handling database request

    function requestDataUse() public returns ( string memory){
        require( (isAuthorised) , "Permission not granted");
        return "Permission is granted";
            
    }
    
    // verifying the computation is complete
    
    function Computation_Complete() public pure{
    /*{
        receive hash_outcome_ confirmation from data owner
        save hash_outcome from data owner 
    }*/
    }
}

contract Request_Data is Data_Owner{
  struct Request {
    string description;
    uint value;
    bool used;
  }
    Request[] public requests;
 
  function request(string memory idea, uint value) public {
    require(msg.sender == owner.ethaddress, "only the owner can make requests to use the data");
    Request memory r = Request({
      description: idea,
      value: value,
      used: false
    });
    
    requests.push(r);
  }
}


// contract to register doctor
contract Doctor_Registration is Authorization
{
    struct Owner {
        string firstName;
        string lastName;
        uint age;
        address ethaddress;
    }
    
    Owner doctor;
    mapping( address => uint) doctor_list;
    uint [] authorized_operations = new uint[](2);
    bool isAuthorised = false;
    
    
    constructor() public {
        
        // read from the database
         doctor.ethaddress = msg.sender;
    }
    
    
    function add() public payable {
        doctor_list[msg.sender] += msg.value;
         isAuthorised = true;
    }
    
    
}

// monitoring patient smart contract
contract Monitoring_Patient 
{
    struct Owner {
        string firstName;
        string lastName;
        uint id;
        address ethaddress;
    }
    
    bool isAuthorised = false;
    Owner set;
    
    mapping (address => uint) list;
    constructor() public {
        
        // read from the database
         set.ethaddress = msg.sender;
    }
    
    // function to set parameters
    
    // function to get parameters
    
    function add() public payable {
        list[msg.sender] += msg.value;
         isAuthorised = true;
    }
    
    
}

