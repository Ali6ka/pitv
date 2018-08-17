package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Device;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeviceDAO extends JpaRepository<Device, Integer>
{
    Device findDeviceByIp(String ip);

    List<Device> findAllByBlock(int blockId);
}
