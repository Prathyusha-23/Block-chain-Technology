pragma solidity ^0.8.0;

contract CD {
    // Structure to store student data
    struct College {
        string fullName;
        string rollNo;
        string branch;
        string section;  // Changed to string to match input type
        string phNo;
        string email;
        uint age;
        string gender;
    }
    struct Faculty{
        string fullName;
        string email;
        string phNo;
        string gender;
        string subject;
    }

    // Mapping to store student data
    mapping (address => College) college;
    mapping (address => Faculty) faculty;

    // Function to add student data
    function addCollege(string memory _fullName, string memory _rollNo,
                            string memory _branch, string memory _section, 
                            string memory _phNo, string memory _email, uint _age, 
                            string memory _gender) 
                            public {
        // Store the student data
        college[msg.sender].fullName = _fullName;
        college[msg.sender].rollNo = _rollNo;
        college[msg.sender].branch = _branch;
        college[msg.sender].section = _section;
        college[msg.sender].phNo = _phNo;
        college[msg.sender].email = _email;
        college[msg.sender].age = _age;
        college[msg.sender].gender = _gender;
    }
function addFaculty(string memory _fullName, string memory _email,
                            string memory _phNo, string memory _gender, 
                            string memory _subject)
                            public{
        faculty[msg.sender].fullName = _fullName;
        faculty[msg.sender].email = _email;
        faculty[msg.sender].phNo = _phNo;
        faculty[msg.sender].gender = _gender;
        faculty[msg.sender].subject = _subject;
                            }
    // Function to retrieve student data
    function retrieveCollege() public view returns (string memory,  string memory, 
                                                        string memory, string memory, 
                                                        string memory, string memory, uint,
                                                        string memory) {
        // Return the student data
        return (college[msg.sender].fullName, college[msg.sender].rollNo, 
                college[msg.sender].branch, college[msg.sender].section, 
                college[msg.sender].phNo, college[msg.sender].email, 
                college[msg.sender].age, college[msg.sender].gender);
    }
    function retrieveFaculty() public view returns (string memory,  string memory, 
                                                        string memory, string memory, 
                                                        string memory) {
        // Return the student data
        return (faculty[msg.sender].fullName, faculty[msg.sender].email, 
                faculty[msg.sender].phNo, faculty[msg.sender].gender, 
                faculty[msg.sender].subject);
    }
}
