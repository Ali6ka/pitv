package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.dao.PostDAO;
import kg.edu.iaau.pitv.model.Block;
import kg.edu.iaau.pitv.model.Device;
import kg.edu.iaau.pitv.model.Post;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.utils.CustomFileUtils;
import kg.edu.iaau.pitv.utils.FTPUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
                    ftpUploader.uploadFile(externalResource + fileName, fileName, "/files/");
                }
            }

        }catch (Exception ex){
            return;
        }

        post.setBlocks(blocks);
        postDAO.saveAndFlush(post);
    }

    @Override
    @Transactional
    public void delete(Post post)
    {
        postDAO.delete(post);
    }
}
