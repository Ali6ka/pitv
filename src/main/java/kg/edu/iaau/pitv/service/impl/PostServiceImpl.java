package kg.edu.iaau.pitv.service.impl;

import kg.edu.iaau.pitv.dao.PostDAO;
import kg.edu.iaau.pitv.model.*;
import kg.edu.iaau.pitv.service.BlockService;
import kg.edu.iaau.pitv.service.PostService;
import kg.edu.iaau.pitv.service.StatusService;
import kg.edu.iaau.pitv.utils.CustomFileUtils;
import kg.edu.iaau.pitv.utils.FTPUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("postService")
public class PostServiceImpl implements PostService
{

    @Value("${system.app.external.resource.location}")
    private String externalResource;

    @Autowired
    PostDAO postDAO;

    @Autowired
    BlockService blockService;

    @Autowired
    StatusService statusService;

    @Override
    @Transactional(readOnly = true)
    public Post getById(int id)
    {
        return postDAO.findOne(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Post> getAll()
    {
        return postDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Post> getAllByAuthor(String author)
    {
        return postDAO.findAllByAuthor(author);
    }

    @Override
    @Transactional
    public void save(Post post)
    {
        postDAO.saveAndFlush(post);
    }

    @Override
    @Transactional
    public void save(Post post, List<String> blockIds, String fileName)
    {
        Set<Block> blocks = new HashSet<>();

        try
        {
            for (String id : blockIds)
            {
                Block block = blockService.getById(Integer.parseInt(id));
                blocks.add(block);

                for (Device device : block.getDevices())
                {
                    FTPUploader ftpUploader = new FTPUploader(device.getIp(),
                            device.getLogin(), device.getPassword());
                    ftpUploader.uploadFile(externalResource + fileName, fileName, "/uploads/");
                }
            }

        }catch (Exception ex){
            return;
        }

        post.setBlocks(blocks);
        post.setFilePath(fileName);
        post.setStatus(statusService.getByTitle("ACTIVE"));
        postDAO.saveAndFlush(post);
    }

    @Override
    @Transactional
    public void delete(Post post)
    {
        try
        {
            post.setStatus(statusService.getByTitle("INACTIVE"));
            for(Block block : post.getBlocks()){
                for (Device device : block.getDevices())
                {
                    FTPUploader ftpUploader = new FTPUploader(device.getIp(),
                            device.getLogin(), device.getPassword());
                    ftpUploader.deleteFile(post.getFilePath());
                }
            }
        }catch (Exception ex){
            return;
        }
    }
}
