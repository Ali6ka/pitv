package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.dao.BlockDAO;
import kg.edu.iaau.pitv.model.Block;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("blockService")
public class BlockServiceImpl implements BlockService
{
    @Autowired
    BlockDAO blockDAO;

    @Autowired
    RoleService roleService;

    @Autowired
    UserService userService;

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
       return blockDAO.findAllByOrderByName();
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
    public void save(Block block, List<String> roleIds)
    {
        Set<Role> roles = new HashSet<>();

        for(String id : roleIds){
            roles.add(roleService.getById(Integer.parseInt(id)));
        }

        block.setRoles(roles);
        blockDAO.saveAndFlush(block);

    }

    @Override
    @Transactional
    public void delete(Block block)
    {
        blockDAO.delete(block);
    }

    @Override
    @Transactional
    public List<Block> getUserAvailableBlocks(int id)
    {
        List<Block> result = new ArrayList();

        User user = userService.getById(id);
        List<Block> blocks = getAll();
        Set<Role> roles = user.getRoles();

        for(Block block : blocks){
            for (Role role : roles){
                if (role.getBlocks().contains(block))
                {
                    result.add(block);
                    break;
                }
            }
        }

        return result;
    }
}
