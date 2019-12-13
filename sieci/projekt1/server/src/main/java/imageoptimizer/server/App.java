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
    
        String targetPath = dis.readUTF();
        FileOutputStream fos = new FileOutputStream(targetPath);
        DataOutputStream ftos = new DataOutputStream(fos);
    
        byte[] buffer = new byte[1024];
    
        while (dis.read(buffer) > 0) {
          ftos.write(buffer);
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
