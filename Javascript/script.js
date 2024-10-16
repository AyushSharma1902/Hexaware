let students = [];
let id = 1;

document.getElementById('add-btn').addEventListener('click', addStudent);
document.getElementById('view-btn').addEventListener('click', viewStudents);
document.getElementById('sort-btn').addEventListener('click', sortStudents);
document.getElementById('delete-btn').addEventListener('click', deleteStudent);

function addStudent() {
    const name = prompt("Enter student's name:");
    const age = parseInt(prompt("Enter student's age:"));
    const grade = parseFloat(prompt("Enter student's grade:"));

    students.push({ id, name, age, grade });
    id++;

    viewStudents();
}

function viewStudents() {
    const studentTbody = document.getElementById('student-tbody');
    studentTbody.innerHTML = '';

    students.forEach((student) => {
        const row = document.createElement('tr');

        row.innerHTML = `
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.grade}</td>
        `;
        row.addEventListener('mouseover', () => {
            row.style.backgroundColor = 'blue'; 
        });

        
        row.addEventListener('mouseout', () => {
            row.style.backgroundColor = ''; // Revert to original background
        });


        studentTbody.appendChild(row);
    });
}

function sortStudents() {
    students.sort((a, b) => b.grade - a.grade);

    viewStudents();
}

function deleteStudent() {
    const studentId = parseInt(prompt("Enter the student ID to delete:"));

    const index = students.findIndex((student) => student.id === studentId);

    if (index !== -1) {
        if (confirm(`Are you sure you want to delete student ${students[index].name}?`)) {
            students.splice(index, 1);

            viewStudents();
        }
    } else {
        alert("Student not found!");
    }
}
