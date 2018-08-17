package kg.edu.iaau.pitv.service.impl;

import kg.edu.iaau.pitv.dao.DeviceDAO;
import kg.edu.iaau.pitv.model.Device;
import kg.edu.iaau.pitv.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("deviceService")
public class DeviceServiceimpl implements DeviceService
{
    @Autowired
    DeviceDAO deviceDAO;

    @Override
    @Transactional(readOnly = true)
    public Device getById(int id)
    {
        return deviceDAO.findOne(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Device> getAll()
    {
        return deviceDAO.findAll();
    }

    @Override
    public List<Device> getAllByBlock(int blockId)
    {
        return deviceDAO.findAllByBlock(blockId);
    }

    @Override
    @Transactional
    public Device getByIp(String ip)
    {
        return deviceDAO.findDeviceByIp(ip);
    }

    @Override
    @Transactional
    public void save(Device device)
    {
        deviceDAO.saveAndFlush(device);
    }

    @Override
    @Transactional
    public void save(Device device, List<String> deviceIds)
    {

    }

    @Override
    @Transactional
    public void delete(Device device)
    {
        deviceDAO.delete(device);
    }
}
