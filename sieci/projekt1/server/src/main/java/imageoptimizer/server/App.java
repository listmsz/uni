package imageoptimizer.server;

import java.io.IOException;
import java.io.FileOutputStream;
import java.io.DataOutputStream;
import java.io.DataInputStream;
import java.net.ServerSocket;
import java.net.Socket;
import com.tinify.*;

public class App {
  public final static int SOCKET_PORT = 5000;

  public static void main(String[] args) throws IOException {

    ServerSocket serverSocket = null;
    serverSocket = new ServerSocket(SOCKET_PORT);
    Socket socket = null;
    socket = serverSocket.accept();
    String API_KEY = "WLFTW3thm5c7xQrvsXjNmMFqM1bWmSGD";
    Tinify.setKey(API_KEY);

    DataInputStream dis = new DataInputStream(socket.getInputStream());
    DataOutputStream dos = new DataOutputStream(socket.getOutputStream());

    String targetPath = "/";
    int count = dis.readInt();
    byte[] bs = new byte[count];
    dis.read(bs);

    for (int i = 0; i < count; i++) {
      char c = (char) bs[i];
      targetPath += c;
    }

    System.out.println(targetPath);
    targetPath = targetPath.substring(0, count);

    FileOutputStream fos = new FileOutputStream(targetPath);
    DataOutputStream ftos = new DataOutputStream(fos);

    byte[] buffer = new byte[count];
    int i = 0;
    while (dis.read(buffer) > 0) {
      i++;
      // skip first buffer item, so image path is not attached to the file 
      if(i > 1) {
        ftos.write(buffer);
      }
    }

    Source source = Tinify.fromFile(targetPath);
    source.toFile(targetPath);

    System.out.println("IMAGE SAVED SUCCESSFULLY");

    dis.close();
    dos.close();
    ftos.close();

    socket.close();
    serverSocket.close();
  }
}
