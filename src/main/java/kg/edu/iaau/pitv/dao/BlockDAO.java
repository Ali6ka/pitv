package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Block;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BlockDAO extends JpaRepository<Block, Integer>
{
    public List<Block> findAllByOrderByName();
    
    public Block findByName(String name);

}
