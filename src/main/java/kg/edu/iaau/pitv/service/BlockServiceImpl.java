package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.dao.BlockDAO;
import kg.edu.iaau.pitv.model.Block;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("blockService")
public class BlockServiceImpl implements BlockService
{
    @Autowired
    BlockDAO blockDAO;

    @Override
    @Transactional(readOnly = true)
    public Block getById(int id)
    {
       return blockDAO.findOne(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Block> getAll()
    {
       return blockDAO.findAll();
    }

    @Override
    public List<Block> getAllByRole(int roleId)
    {
        return blockDAO.findAllByRole(roleId);
    }

    @Override
    @Transactional(readOnly = true)
    public Block getByName(String name)
    {
        return blockDAO.findByName(name);
    }

    @Override
    @Transactional
    public void save(Block block)
    {
        blockDAO.saveAndFlush(block);
    }

    @Override
    @Transactional
    public void save(Block Block, List<String> deviceIds)
    {
        return;
    }

    @Override
    @Transactional
    public void delete(Block block)
    {
        blockDAO.delete(block);
    }
}
