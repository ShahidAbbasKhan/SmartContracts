// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract BloodBank {
    // admin of the Blood Bank
    address admin;
    constructor() {
        admin = msg.sender;
    }

    // PatientType
    enum PatientType {
        Donor,
        Receiver
    }

    // Blood Transaction
    struct BloodTransaction {
        PatientType patientType;
        uint256 time;
        address from;
        address to;
    }

    // Patient Record
    struct Patient {
        uint256 cnic;
        string name;
        uint256 age;
        string bloodGroup;
        uint256 contact;
        string homeAddress;
        BloodTransaction[] bloodTransac;
    }

    // Strore All Patients Record
    Patient[] PatientRecord;

    // index against cnic
    mapping(uint256 => uint256) PatientRecordIndex;
    mapping(uint => bool) isRegistered;

    // function Execution
    event Successfull(string message);

    // Register a new patient
    function newPatient(
        string memory _name,
        uint256 _age,
        string memory _bloodGroup,
        uint256 _contact,
        string memory _homeAddress,
        uint256 _cnic
    ) external {
        
        require(msg.sender == admin, "only admin can register new patient");
        require(!isRegistered[_cnic],"Already Registered");

        // get the legth of array
        uint256 index = PatientRecord.length;

        // insert records
        PatientRecord.push();
        PatientRecord[index].name = _name;
        PatientRecord[index].age = _age;
        PatientRecord[index].bloodGroup = _bloodGroup;
        PatientRecord[index].contact = _contact;
        PatientRecord[index].homeAddress = _homeAddress;
        PatientRecord[index].cnic = _cnic;
        isRegistered[_cnic]=true;
        // store the aaray index in the map against the user addhar number
        PatientRecordIndex[_cnic] = index;

        emit Successfull("Patient added successfully");
    }

    // function to get specific user data
    function getPatientRecord(uint256 _cnic)
        external
        view
        returns (Patient memory)
    {
        uint256 index = PatientRecordIndex[_cnic];
        return PatientRecord[index];
    }

    // function to get all the records
    function getAllRecord() external view returns (Patient[] memory) {
        return PatientRecord;
    }

    // store the blood txn
    function bloodTransaction(
        uint256 _cnic,
        PatientType _type,
        address _from,
        address _to
    ) external {
        // check if sender is hospital or not
        require(
            msg.sender == admin,
            "only admin can make Blood Transsaction"
        );

        // get at which index the patient registartion details are saved
        uint256 index = PatientRecordIndex[_cnic];

        //insert the BloodTransaction in the record
        BloodTransaction memory txObj = BloodTransaction({
            patientType: _type,
            time: block.timestamp,
            from: _from,
            to: _to
        });

        PatientRecord[index].bloodTransac.push(txObj);

      
        emit Successfull(
            "Patient blood transaction data is updated successfully"
        );
    }
}