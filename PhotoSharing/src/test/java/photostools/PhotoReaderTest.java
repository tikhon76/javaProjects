package photostools;

import org.junit.*;

import java.io.File;

public class PhotoReaderTest {
    @Test
    public void listDirectoriesTest() {
        File[] files = PhotoReader.listDirectories("C:\\");
        Assert.assertTrue(files.length > 0);
    }
}
