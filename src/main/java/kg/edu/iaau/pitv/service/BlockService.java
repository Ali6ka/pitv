package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.Block;

import java.util.List;

public interface BlockService
{
    public Block getById(int id);

    public List<Block> getAll();

    Block getByName(String name);

    void save(Block block);

    void save(Block Block, List<String> roleIds);

    void delete(Block block);

    List<Block> getUserAvailableBlocks(int id);

}
