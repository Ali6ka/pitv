package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Status;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StatusDAO extends JpaRepository<Status, Integer>
{
    Status findByTitle(String title);
}
