pragma solidity ^0.8.0;

contract EHR {
    // Structure to store patient data
    struct PatientData {
        string fullName;
        uint age;
        string gender;
        string bloodType;
        string allergies;
        string medications;
        string conditions;
        string immunizations;
        string testResults;
        string hospitalVisits;
        string surgeries;
    }

    // Mapping to store patient data
    mapping (address => PatientData) patientData;

    // Function to add patient data
    function addPatientData(string memory _fullName, uint _age, string memory _gender, 
                            string memory _bloodType, string memory _allergies, 
                            string memory _medications, string memory _conditions, 
                            string memory _immunizations, string memory _testResults, 
                            string memory _hospitalVisits, string memory _surgeries) 
                            public {
        // Store the patient data
        patientData[msg.sender].fullName = _fullName;
        patientData[msg.sender].age = _age;
        patientData[msg.sender].gender = _gender;
        patientData[msg.sender].bloodType = _bloodType;
        patientData[msg.sender].allergies = _allergies;
        patientData[msg.sender].medications = _medications;
        patientData[msg.sender].conditions = _conditions;
        patientData[msg.sender].immunizations = _immunizations;
        patientData[msg.sender].testResults = _testResults;
        patientData[msg.sender].hospitalVisits = _hospitalVisits;
        patientData[msg.sender].surgeries = _surgeries;
    }

    // Function to retrieve patient data
    function retrievePatientData() public view returns (string memory, uint, string memory, 
                                                        string memory, string memory, 
                                                        string memory, string memory, 
                                                        string memory, string memory, 
                                                        string memory, string memory) {
        // Return the patient data
        return (patientData[msg.sender].fullName, patientData[msg.sender].age, 
                patientData[msg.sender].gender, patientData[msg.sender].bloodType, 
                patientData[msg.sender].allergies, patientData[msg.sender].medications, 
                patientData[msg.sender].conditions, patientData[msg.sender].immunizations, 
                patientData[msg.sender].testResults, patientData[msg.sender].hospitalVisits, 
                patientData[msg.sender].surgeries);
}
}