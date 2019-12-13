import java.io.FileInputStream;
import java.io.DataOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.net.Socket;
import java.io.File;
import java.util.Scanner;

class TranslationStrings {
  public static String WELCOME = "Would you mind providing a file path to an image you'd like to optimise, please?";
  public static String INCORRECT_FILE_NAME_TRY_AGAIN = "incorrect file name or size (max 10MiB), please try again";
  public static String DESTINATION_PATH = "Enter destination path on your REMOTE machine";
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
    while ((!f.exists() && !f.isFile()) || f.length() > MAX_FILE_SIZE) {
      System.out.println(TranslationStrings.INCORRECT_FILE_NAME_TRY_AGAIN);
      path = s.next();
      f = new File(path);
    }

    return path;
  }

  public static String propmtDestinationPath() {
    System.out.println(TranslationStrings.DESTINATION_PATH);
    Scanner d = new Scanner(System.in);
    return d.next();
  }

  public static void main(String[] args) throws IOException {
    String fileToOptimize = promptInputFile();
    String destinationPath = propmtDestinationPath();

    Socket socket = new Socket(HOST_NAME, SOCKET_PORT);
    
    DataInputStream dis = new DataInputStream(socket.getInputStream());
    DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
    DataInputStream difs = new DataInputStream(new FileInputStream(fileToOptimize));

    dos.writeUTF(destinationPath);

    byte[] buffer = new byte[1024];

    while (difs.read(buffer) > 0) {
    dos.write(buffer);
    }

    System.out.println("Finished uploading");

    dis.close();
    dos.close();
    difs.close();
    socket.close();
  }
}