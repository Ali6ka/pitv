package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Faculty;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacultyDAO extends JpaRepository<Faculty, Integer>
{
}
