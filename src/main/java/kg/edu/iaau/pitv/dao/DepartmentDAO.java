package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface DepartmentDAO extends JpaRepository<Department, Integer>
{
    @Query("SELECT d  FROM Department d  " +
            "LEFT JOIN FETCH d.faculty f " +
            "WHERE f.id=:faculty_id")
    List<Department> findAllByFaculty(@Param("faculty_id") int id);
}
