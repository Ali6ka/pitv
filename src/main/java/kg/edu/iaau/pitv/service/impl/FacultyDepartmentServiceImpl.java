package kg.edu.iaau.pitv.service.impl;

import kg.edu.iaau.pitv.dao.DepartmentDAO;
import kg.edu.iaau.pitv.dao.FacultyDAO;
import kg.edu.iaau.pitv.model.Department;
import kg.edu.iaau.pitv.model.Faculty;
import kg.edu.iaau.pitv.service.FacultyDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("facultyDepartmentService")
@Transactional
public class FacultyDepartmentServiceImpl implements FacultyDepartmentService
{
    @Autowired
    FacultyDAO facultyDAO;

    @Autowired
    DepartmentDAO departmentDAO;

    @Override
    public Faculty getFacultyById(int id)
    {
        return facultyDAO.findOne(id);
    }

    @Override
    public List<Faculty> getAllFaculties()
    {
        return facultyDAO.findAll();
    }

    @Override
    public void save(Faculty faculty)
    {
        facultyDAO.saveAndFlush(faculty);
    }

    @Override
    public void delete(Faculty faculty)
    {
        facultyDAO.delete(faculty);
    }

    @Override
    public Department getDepartmentById(int id)
    {
        return departmentDAO.findOne(id);
    }

    @Override
    public List<Department> getAllDepartments()
    {
        return departmentDAO.findAll();
    }

    @Override
    public List<Department> getAllDepartmentsByFaculty(int faculty_id)
    {
        return departmentDAO.findAllByFaculty(faculty_id);
    }

    @Override
    public void save(Department department)
    {
        departmentDAO.saveAndFlush(department);
    }

    @Override
    public void delete(Department department)
    {
        departmentDAO.delete(department);
    }
}
