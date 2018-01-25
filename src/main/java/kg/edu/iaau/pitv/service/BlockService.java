package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.Block;

import java.util.List;

public interface BlockService
{
    public Block getById(int id);

    public List<Block> getAll();

    public List<Block> getAllByRole (int roleId);

    Block getByName(String name);

    void save(Block block);

    void save(Block Block, List<String> deviceIds);

    void delete(Block block);

}
