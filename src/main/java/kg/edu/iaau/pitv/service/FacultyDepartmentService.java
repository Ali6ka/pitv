package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.Department;
import kg.edu.iaau.pitv.model.Faculty;

import java.util.List;

public interface FacultyDepartmentService
{
    Faculty getFacultyById(int id);

    List<Faculty> getAllFaculties();

    void save(Faculty faculty);

    void delete(Faculty faculty);

    Department getDepartmentById(int id);

    List<Department> getAllDepartments();

    List<Department> getAllDepartmentsByFaculty(int faculty_id);

    void save(Department department);

    void delete(Department department);
}
