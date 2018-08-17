package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Block;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlockDAO extends JpaRepository<Block, Integer>
{
    List<Block> findAllByOrderByName();

    Block findByName(String name);

}
