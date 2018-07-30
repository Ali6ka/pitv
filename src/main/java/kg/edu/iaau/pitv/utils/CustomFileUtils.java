package kg.edu.iaau.pitv.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class CustomFileUtils
{
    private CustomFileUtils() {}

    public static String uploadFile(MultipartFile multipartFile, String resource)
    {
        String destinationPath = null;
        if (!multipartFile.getOriginalFilename().isEmpty()) {
            String[] tokens = multipartFile.getOriginalFilename().replaceAll("\\s+", "").split("\\.(?=[^\\.]+$)");
            String imageUniqueName = tokens[0] + UUID.randomUUID() + "." + tokens[1];
            File dir = new File(resource);

            try {
                if (!dir.exists() && !dir.mkdirs()) {
                    return null;
                }

                File transferFile = new File(resource + "/" + imageUniqueName);
                multipartFile.transferTo(transferFile);
            } catch (Exception ex) {
                ex.printStackTrace();
                return null;
            }

            destinationPath =  imageUniqueName;
        }

        return destinationPath;
    }

    public static String uploadFile(BufferedImage img, String resource)
    {
        String imageUniqueName = "message" + UUID.randomUUID() + ".png";

        try {
            ImageIO.write(img, "png", new File(resource + "/" + imageUniqueName));
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
        return imageUniqueName;
    }

}
