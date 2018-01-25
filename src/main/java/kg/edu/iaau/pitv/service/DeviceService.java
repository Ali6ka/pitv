package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.Device;

import java.util.List;

public interface DeviceService
{
    public Device getById(int id);

    public List<Device> getAll();

    public List<Device> getAllByBlock(int blockId);
    
    public Device getByIp(String ip);

    public void save(Device device);

    public void save(Device device, List<String> deviceIds);

    public void delete(Device device);
}
