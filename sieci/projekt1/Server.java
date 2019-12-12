import java.io.IOException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
  public final static int SOCKET_PORT = 5000;

  public static void main (String [] args ) throws IOException {
    ServerSocket serverSocket = null;
    serverSocket = new ServerSocket(SOCKET_PORT);
    Socket socket = null;
    InputStream in = null;
    OutputStream out = null;

    socket = serverSocket.accept();
    in = socket.getInputStream();
    // TODO pass to image panda API
    out = new FileOutputStream("/Users/q/p/testing.jpeg");

    byte[] bytes = new byte[16*1024];

    int count;
    while ((count = in.read(bytes)) > 0) {
        out.write(bytes, 0, count);
    }

    out.close();
    in.close();
    socket.close();
    serverSocket.close();
  }
}