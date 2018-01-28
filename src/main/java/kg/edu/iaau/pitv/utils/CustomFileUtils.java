package kg.edu.iaau.pitv.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

public class CustomFileUtils
{
    private CustomFileUtils() {}

    public static String uploadFile(MultipartFile multipartFile, String resource)
    {
        String destinationPath = null;
        if (!multipartFile.getOriginalFilename().isEmpty()) {
            String[] tokens = multipartFile.getOriginalFilename().split("\\.(?=[^\\.]+$)");
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

}
