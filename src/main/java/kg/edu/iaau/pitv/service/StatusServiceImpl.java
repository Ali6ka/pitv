package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.dao.StatusDAO;
import kg.edu.iaau.pitv.model.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("statusService")
@Transactional
public class StatusServiceImpl implements StatusService
{
    @Autowired
    StatusDAO statusDAO;

    @Override
    public Status getByTitle(String title)
    {
        return statusDAO.findByTitle(title);
    }
}
