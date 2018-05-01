package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Device;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeviceDAO extends JpaRepository<Device, Integer>
{
    Device findDeviceByIp(String ip);

    List<Device> findAllByBlock(int blockId);
}
