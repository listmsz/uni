import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.io.File;
import java.util.Scanner;
 
class TranslationStrings {
  public static String WELCOME = "Would you mind providing a file path to an image you'd like to optimise, please?";
  public static String INCORRECT_FILE_NAME_TRY_AGAIN = "incorrect file name or size (max 10MiB), please try again";
}

public class Client {
  public final static int SOCKET_PORT = 5000; 
  public final static String HOST_NAME = "127.0.0.1";

  public final static int MAX_FILE_SIZE = 10485760; // 10MiB 

  public static String promptInputFile() {
    System.out.println(TranslationStrings.WELCOME);
    Scanner s = new Scanner(System.in);
    String path = s.next();
    File f = new File(path);
    while(!f.exists() && !f.isFile() && f.length() > MAX_FILE_SIZE) {
      System.out.println(TranslationStrings.INCORRECT_FILE_NAME_TRY_AGAIN);
      path = s.next();
      f = new File(path);
    }
    
    return path;
  }

  public static void main (String [] args ) throws IOException {
    String FileToOptimize = promptInputFile(); 
    Socket socket = new Socket(HOST_NAME, SOCKET_PORT);

    InputStream in = new FileInputStream(FileToOptimize);
    OutputStream out = socket.getOutputStream();

    int count;
    byte[] bytes = new byte[16 * 1024];
    while ((count = in.read(bytes)) > 0) {
        out.write(bytes, 0, count);
    }

    out.close();
    in.close();
    socket.close();
  }
}