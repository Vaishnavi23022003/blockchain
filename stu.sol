// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StudentManagement {
    struct Student {
        int stud_id;
        string Name;
        string Department;
    }

    Student[] Students;

    function addStudent(int stud_id, string memory Name, string memory Department) public {
        // Check if the student with the given ID already exists
        for (uint i = 0; i < Students.length; i++) {
            if (Students[i].stud_id == stud_id) {
                revert("Student with the same ID already exists");
            }
        }

        Student memory stud = Student(stud_id, Name, Department);
        Students.push(stud);
    }

    function getStudent(int stud_id) public view returns (string memory, string memory) {
        for (uint i = 0; i < Students.length; i++) {
            Student memory stud = Students[i];
            if (stud.stud_id == stud_id) {
                return (stud.Name, stud.Department);
            }
        }
        return ("Name Not Found", "Department Not Found");
    }

    // Fallback function to receive Ether (if needed)
    receive() external payable {}
}

