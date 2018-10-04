pragma solidity ^0.4.2;
contract Data {
    
    struct prevOwner{
        string prevName;
        string buyDate;
        string sellDate;
        
    }

    struct Car {
        
        string carName;
	    string ownerName;
        string plateNumber;
        bool initialized;
        uint VIN;
        prevOwner prev;
        /*mapping(uint =>prevOwner ) id;*/
        
    }
	address public manufacturer;
	mapping(uint => Car) members;
	Car[] public cars;
	
	
	
	constructor () public {
        manufacturer = msg.sender;
    }
	
	
	function start() public  {
        manufacturer = msg.sender;}
	
	/*function addCar(string _carName, string _ownerName, string _plateNumber, uint _VIN) public returns(uint, uint) {*/
	function addCar(string _carName, string _ownerName, uint _VIN) public returns(string, string) {
	   
	    /*/cars.length++;*/
	   /* cars[cars.length-1].prev.length++; */
        members[_VIN].carName = _carName;
        members[_VIN].prev.prevName = _ownerName;
        return (members[_VIN].carName,members[_VIN].prev.prevName);
        /*cars[cars.length-1].ownerName = _ownerName;
        cars[cars.length-1].plateNumber = _plateNumber;
        cars[cars.length-1].initialized = true;
        cars[cars.length-1].VIN = _VIN;
        cars[cars.length-1].prev[cars.length-1].prevName = "null";
        
        return (cars.length, cars[cars.length-1].prev.length);*/
        
        
        
        
    }
    
    /*function getUsersCount() public constant returns(uint) {
        return cars.length;
    }
	
   function getUser(uint index) public constant returns(string, string, string, bool, uint, string) {
        return (cars[index].carName, cars[index].ownerName, cars[index].plateNumber, cars[index].initialized, cars[index].VIN, cars[index].prev[index].prevName);
    }

   function transferCar(uint _VIN, string newOwner) public
    {for (uint prop = 0; prop < cars.length; prop++)
        { if (cars[prop].VIN == _VIN)
            { cars[prop].prev[prop].prevName = cars[prop].ownerName;
            cars[prop].ownerName = newOwner;
            }
            }
        
    }
    */
     function getUser(uint VIN) public constant returns(string, string) {
        return (members[VIN].carName, members[VIN].prev.prevName);
    }
   
    
}
