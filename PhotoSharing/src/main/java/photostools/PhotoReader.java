package photostools;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletResponse;

public class PhotoReader {
    public static File[] listDirectories(String directoryName)
    {
        File directory = new File(directoryName);
        return directory.listFiles();
    }

    public static void sendFile(String fileName, HttpServletResponse response)
    {
        try {
            OutputStream outStream = response.getOutputStream();
            byte[] buf = new byte[4096];
            int len = -1;

            InputStream inStream = new FileInputStream(fileName);

            //Write the file contents to the servlet response
            //Using a buffer of 4kb (configurable). This can be
            //optimized based on web server and app server
            //properties
            while ((len = inStream.read(buf)) != -1) {
                outStream.write(buf, 0, len);
            }

            outStream.flush();
            outStream.close();
        } catch (Exception ex) {
            //
        }
    }
}
