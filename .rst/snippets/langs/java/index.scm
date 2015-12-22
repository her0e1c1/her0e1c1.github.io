public class foreach {
    public static void main (String[] args) {
        for (int i: new int[] {1, 2, 3, 4, 5})
            System.out.println(i);
    }


}// 実行方法
// pkg install openjdk8
// javac HelloWorld.java
// java HelloWorld 

// WARN: ファイル名は、HelloWorld.javaにしないとコンパイルできない

public class HelloWorld {
    public static void main (String[] args) {
        System.out.println("Hello World !!");
    }
}

======
Sample
======

interface
 * privateとprotectedは指定出来ない
 * メソッドには自動的にpublicとabstractが付加される

::

 
 UserList.java:
 class UserList {
      private String[] users;
      void setUsers(String[] args) {
           // 配列の参照の値の代入
           users = args;
      }
      String[] getUsers() throws NullUsersException {
           if (users.equals(null)) {
                throw new NullUsersException();
           }
           return users;
      }
      String getUser(int uid) throws UsersException {
           if (users.equals(null)) {
                throw new NullUsersException();
           } else if (uid < 0 || uid >= users.length) {
                UidOutOfBoundException excep
                    = new UidOutOfBoundException(users.length - 1);
                throw excep;
           }
           return users[uid];
      }
      int getUser(String user) throws UsersException {
           int uid = 0;
           if (users.length == 0) {
                throw new NullUsersException();
           } else {
                for (int i = 0; i < users.length; i++) {
                     if (user.equals(users[i])) {
                          uid = i;
                          break;
                     } else if (i == users.length - 1) {
                          UserNotAuthorizedException excep
                              = new UserNotAuthorizedException();
                          excep.setName(user);
                          throw excep;
                     }
                }
           }
           return uid;
      }
 }


UsersList クラスの private ではないインタフェース部分を編集したので、このクラスをインスタンス化するコントロールクラスの方も編集します。

::

 class UserTest {
      public static void main(String[] args) {
           UserList obj = new UserList();
           obj.setUsers(args);
           try {
                System.out.print("sugai -> ");
                System.out.println(obj.getUser("sugai"));
                System.out.print("10 -> ");
                System.out.println(obj.getUser(10));
           } catch (UsersException e) {
                System.out.println("");
                System.out.println(e);
                return;
           }
      }
 }

StateFactory ::

 class Member {

     State current_state;
     StateFactory SF;


     public Member(int tm){
 SF = new StateFactory();
 current_state = SF.setStatus(tm);
     }


     publicint getPrice(int p) {
 return current_state.getPrice(p);
     } 
     public String toString(){
 return current_state.toString();
     }
 }


 abstractclass State{
     abstractint getPrice(int p);
     abstractpublic String toString();
 }


 class Normal extends State{
     int getPrice(int p){
 return p;
     }
     public String toString(){
 return"nomal";
     }
 }
 class Silver extends State{
     int getPrice(int p){
 double ret = p * 0.97;
 return (int)ret;
     }
     public String toString(){
 return"silver";
     }
 }
 class Gold extends State{
     int getPrice(int p){
 double ret = p * 0.95;
 return (int)ret;
     }
     public String toString(){
 return"gold";
     }
 }


 class Platinum extends State{
     int getPrice(int p){
 double ret = p * 0.9;
 return (int)ret;
     }
     public String toString(){
 return"platinum";
     }
 }


 publicclass StateFactory{
     State setStatus(int tm){
 State s;

 if( tm < 25000) s = new Normal();
 elseif( tm < 50000 ) s = new Silver();
 elseif( tm < 75000 ) s = new Gold();
 else s = new Platinum();

 return s;
 }

 staticpublicvoid main(String[] argv){
 Member m1 = new Member(20000);
 Member[]m = new Member[10];
 for(int i = 0; i < m.length ;i++){
     m[i] = new Member(i*6000);
 }

 for(int i = 0; i < m.length ; i++){
     System.out.println("state:" + m[i].toString());
     System.out.println("price:" + m[i].getPrice(100));
 }
     }

 }

ファイル操作 ::

 File file = new File(file_name);
 PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(file)));

 pw.println("文字列");
 pw.println(10);


::

 オブジェクトのシリアライズを行う際、そのオブジェクトのクラスはSerializableインタフェースを実装する必要があります。Serializableインタフェース自体には何の定義もされていません。そのため、Serializableインタフェースを実装したクラスでは、何のメソッドも再定義する必要はありません。Serializableインタフェースは単に実装したクラスがオブジェクトのシリアライズが可能であることを示すものです。

 だってさ、インターフェイスには何も定義されていない
 ただの、直列化の印だって

::

 import java.util.*;
 class Stack {

  ArrayList<Integer> al = new ArrayList<Integer>();
  int index = 0;
  publicvoid push (int o ){
   al.add(o);
   index++;
  }

 public int pop (){
 index--;
 return al.get(index);
     }

     publicstaticvoid main(String[] args)   {
 Stack s = new Stack();
 for(int i = 0; i < 10 ; i++){
     s.push(i);
 }

 System.out.println("result is:");
 for(int i = 0; i < 10 ; i++){
     System.out.println(s.pop());
 }
     }
 }


::

 class Client {

 void work(){
 LunchSet ls = new LadiesSet();
 Drink d = ls.cookDrink();
 MainDish md = ls.cookMainDish();
 bring(d,md);


 ls = new BussinessSet();
 d = ls.cookDrink();
 md = ls.cookMainDish();
 bring(d,md);


 }

 void bring(Drink d,MainDish md ){
 System.out.println("Here is your order");
 d.order();
 md.order();
 System.out.println("");
 }


 publicstaticvoid main(String[] agv){
 Client c = new Client();
 c.work();
 }

 }


 abstractclass LunchSet{


 abstract Drink cookDrink();
 abstract MainDish cookMainDish();
 }


 class LadiesSet extends LunchSet{


 Drink cookDrink(){
 returnnew OrangeJuice();
 } 


 MainDish cookMainDish(){
 returnnew VegitableCurry();
 }
 }
 class BussinessSet extends LunchSet{
 Drink cookDrink(){
 returnnew Coffee();
 }
 MainDish cookMainDish(){
 returnnew ChichenCurry();
 }
 }

 abstractclass Drink{
 abstractvoid order();
 }


 class OrangeJuice extends Drink{
 void order(){
 System.out.println("this is OrangeJuice");
 }
 }

 class Coffee extends Drink{
     void order(){
 System.out.println("this is Coffee");
 }
 }

 abstractclass MainDish {
 abstractvoid order();
 }

 class VegitableCurry extends MainDish{
 void order(){
 System.out.println("this is VegitableCurry");
 }
 }

 class ChichenCurry extends MainDish{
 void order(){
 System.out.println("this is ChickenCurry");
 }  
 }

::



 package Figure;
 publicclass Region {

 Figure[] f = new Figure[50];

 publicdouble sum_of_Area() {
 double sum = 0.0 ;

 for(int i = 0 ; f[i] != null ;i++){
 sum += f[i].calc_Area();
 }
 return sum ;
 }

 publicstaticvoid main(String[] args) {
 Region r = new Region();
 r.f[0] = new Triangle( 5, 10 );
 r.f[1] = new Triangle( 10, 10 );
 System.out.println ( "result :" + r.sum_of_Area() );
 }
 }

::


 package exp4todo;


 import java.util.ArrayList;
 import java.util.List;
 import java.util.Enumeration;
 import java.util.Map;
 import java.util.HashMap;




 public class Attribute {

     Login login;
      Map<String,String> attr = new HashMap<String,String>();
      boolean next = false;
      boolean previous = false;
      String mode = "showAll";
      String post = "";
      int page = 0;
      int limit = 10;//how many tasks show?
      int offset = 0;
      int taskId = 0;
      int edit_done = 0;
      int id = 0;
      int done = 0;
      String content ="";
      String time ="";
      String json = "false";

      Attribute(Login l){
           login = l;
           if(login.map.containsKey("delete"))
                post = "delete";
           else if (login.map.containsKey("done"))
                post = "done";
           else if (login.map.containsKey("content"))
                post = "content";
           if  (login.map.containsKey("edit")){
                if(login.map.get("edit")[0].equals("true"))
                     post = "edit";
           }


           if(login.map.containsKey("edit_done")){
                try{
                     edit_done = Integer.parseInt(login.map.get("edit_done")[0]);
                }catch( NumberFormatException e){ }
           }

           if(login.map.containsKey("json"))
                json = login.map.get("json")[0];



           if(login.map.containsKey("mode")){
                mode = login.map.get("mode")[0];
                if(mode.equals("showAll")){
                     mode = "showAll";
                }
                else if (mode.equals("undone")){
                     mode = "undone";
                }
           }
           if(login.map.containsKey("id")){
                try{
                     id = Integer.parseInt(login.map.get("id")[0]);
                }catch( NumberFormatException e){ }
           }

           if(login.map.containsKey("taskId")) {
                try{
                   taskId = Integer.parseInt(login.map.get("taskId")[0]);
                }catch( NumberFormatException e){
                     taskId = 0;
                }
                   if( taskId < 0 ) taskId = 0;
                mode = "taskId";
           }
           if(login.map.containsKey("page")) {
                try{
                     page = Integer.parseInt(login.map.get("page")[0]);
                }catch( NumberFormatException e){
                     page = 0;
                }
                   if( page < 0 ) page = 0;
                offset = limit * page;
           }
      }

      public boolean login(){
           boolean ret = false;
           DoTask dt = new DoTask(login);
           if( dt.login() )ret = true;
           return ret;
      }

      public void getStart(){

           SendHtml sh = new SendHtml(mode,page);
           DoTask dt = new DoTask(login);
           TaskList tl = null ;

           if (mode.equals("showAll")){
                tl = dt.getTaskList();              
           }
           else if(mode.equals("undone")){
                tl = dt.getUndoneTaskList();
           }
           else if(mode.equals("taskId")){
                Task t = dt.getTask();
                attr.put("content",t.getContent());
                attr.put("taskId",String.valueOf(taskId));
                attr.put("done",String.valueOf(t.getDone()));

                return;
           }

           if ( page == 0){
                previous = false;
           }else{
                previous = true;
           }
           if( dt.isNextPage() ){
                next = true;
           }else{
                next = false;
           }

           attr.put("previous",String.valueOf(previous));
           attr.put("next",String.valueOf(next));
           if (tl != null){
                String taskList = sh.taskListToString(tl);
                attr.put("taskList",taskList);
           }
      }    

      public void  postStart(){
           DoTask dt = new DoTask(login);
           if(post.equals("content") ){
                if(login.map.containsKey("content") && ! login.map.get("content")[0].equals("") )
                     dt.setTask();
                else
                     attr.put("warnning","task is empty");
           }
           else if(post.equals("delete")){
                dt.deleteTask();
           }
           else if (post.equals("done")){
                dt.doneTask();
           }
           else if (post.equals("edit")){
                dt.editTask();
           }

      }
      public Map<String,String> sessionLogin(){
           attr.put("login","true");
           attr.put("user",login.map.get("user")[0]);
           return attr;
      }
 }


::

 import java.util.Random;
 public class Ran{
     public static void main(String[] args){

         //Randomクラスのインスタンス化
         Random rnd = new Random();

         int ran = rnd.nextInt(10);
         System.out.println(ran);
     }
 }

::



 package exp4server;


 import java.security.NoSuchAlgorithmException;
 import java.security.SecureRandom;
 import java.util.Date;
 import java.util.Random;


 publicclass SampleRandom {


     privatestatic Random RANDOM;
     static {
         try {
             RANDOM = SecureRandom.getInstance("SHA1PRNG");
             RANDOM.setSeed(new Date().getTime());
         }
         catch (final NoSuchAlgorithmException e) {
             e.printStackTrace();
             RANDOM = new Random(new Date().getTime());
         }
     }


      static String generateRandomId() {
         finalbyte b[] = newbyte[16];
         RANDOM.nextBytes(b);
         return bytesToHexString(b);
     }


     publicstatic String bytesToHexString(byte[] bytes) {
         final StringBuffer sb = new StringBuffer();
         for (finalbyte b: bytes) {
             final String s = Integer.toHexString(0xff & b);
             sb.append(s.length() == 1 ? "0" + s : s);
         }
         return sb.toString();
     }


     publicstaticvoid main(String[] args) {
         for (int i = 0; i < 100; i++) {
             System.out.println(generateRandomId());
         }
     }
 }


::



 package exp4todo;


 import java.util.ArrayList;
 import java.util.List;
 import java.util.Enumeration;
 import java.util.Map;
 import java.util.HashMap;




 publicclass DoTask {

 private Database d;
 private Login login;
 DoTask(Login l){
 login = l;
 d = new Database(l,l.root +  "/WEB-INF/todo.db");
 }
 publicboolean login(){
 boolean ret = false;
 if( login.map.containsKey("user") && 
 d.login( login.map.get("user")[0],login.map.get("pass")[0] ) ){
 ret = true;
 }
 return ret;
 }


 publicboolean isNextPage (){
 boolean ret = false;
 int last = login.at.limit * (login.at.page + 1);
 int max = d.getNumberOfTasks(login.user);
 if( last < max  ) ret = true;

 return ret;
 }


 public TaskList getTaskList(){
 d.setOffset(login.at.offset);
 TaskList tl = d.getTaskList(login.user);
 return tl;
 }


 public TaskList getUndoneTaskList(){
 d.setOffset(login.at.offset);
 TaskList tl = d.getUndoneTaskList(login.user);
 return tl;
 }


 publicvoid doneTask(){
 int intId = Integer.valueOf(login.map.get("id")[0]);
 int intDone = Integer.valueOf(login.map.get("done")[0]);
 if(intDone == 1){
 intDone = 0;
 }else {
 intDone = 1;
 }
 d.doneTask(intId, intDone);
 login.at.attr.put("done",String.valueOf(intDone));
 }

 publicvoid deleteTask(){
 int intDel = Integer.valueOf(login.map.get("delete")[0]);
 d.deleteTask(intDel);
 }


 publicvoid setTask(){
 Task t = new Task(login.user);
   t.setContent(login.map.get("content")[0]);
 d.taskRegister(t);
 }
 publicvoid editTask(){
 Task t =  new Task(login.user);
 t.setContent(login.map.get("edit_content")[0]);
 t.setDone(login.at.edit_done);
 t.setID(login.at.id);
 d.editTask(t);
 }


 public Task getTask(){
 Task t = d.getTask();
 if(t.getUser() != login.user)t = null;
 return t;
 }


 }


::



 package exp4server;


 import java.io.BufferedReader;
 import java.io.IOException;
 import java.io.InputStreamReader;
 import java.io.OutputStream;
 import java.net.Socket;
 import java.util.Map;
 import java.util.StringTokenizer;
 import java.util.NoSuchElementException;


 /**
  * Webクライアントと通信を行うクラス
  */
 publicabstractclass ClientHandler {
     /**
      * Webクライアントと通信するためのソケット
      */
     privatefinal Socket client;


     /**
      * Webクライアントからの読み込みに使うストリーム
      */
     privatefinal BufferedReader in;


     /**
      * Webクライアントへの出力に使うストリーム
      */
     privatefinal OutputStream out;


     /**
      * コンストラクタ
      * @param socket クライアントとの間で保持されているソケット．
      */
     public ClientHandler(Socket socket) throws IOException {
         this.client = socket;
         this.in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
         this.out = socket.getOutputStream();
     }


     /**
      * 1行分の文字列をクライアントへ送信する．行末コードも同時に出力される．
      * @param line CRLFを含まない文字列
      */
     protectedvoid sendln(String line) throws IOException {
         send(line + "\r\n");
     }


     /**
      * 文字列をクライアントへ送信する．
      * @param s 文字列
      */
     protectedvoid send(String s) throws IOException {
         out.write(s.getBytes());
     }


     /**
      * ステータスコードとエラーページを送信する．
      */
     privatevoid sendStatusCode(String message) throws IOException {
         sendln("HTTP/1.0 " + message);
         sendln("Content-Type: text/plain");
         sendln(message);
     }


     private Request parseHeader() throws IOException {
         final String line = in.readLine();
         if (line == null) {
             returnnull;
         }


         // リクエスト行を空白" "で区切り解析する
         final StringTokenizer st = new StringTokenizer(line, " ");
         String method = null; // メソッド
         String path = null; // パス
         String version = null; // HTTPのバージョン


         try {
             method = st.nextToken();
             path = st.nextToken();
             version = st.nextToken();
         }
         catch (final NoSuchElementException e) {
             // リクエスト行が「メソッドパス HTTPのバージョン」の形式ではなかった
             returnnull;
         }


         final Request req = new Request(method, path, version);
         req.readHeader(in);
         req.readBody(in);
         return req;
     }


     /**
      * クライアントとの通信を行う.
      */
     publicvoid doService() {
         try {
             try {
                 final Request req = parseHeader();
                 if (req == null) {
                     sendStatusCode("400 Bad Request");
                     return;
                 }
                 perform(req);
             }
             finally {
                 out.close();
                 client.close();
             }
         }
         catch (final Exception e) {
             e.printStackTrace();
         }
     }


     protectedabstractvoid perform(Request req) throws IOException;


     /**
      * 標準出力にメソッド，ヘッダ，ボディを出力する．
      */
     protectedvoid outputRawLog(Request req) {
         System.out.println("[Method] " + req.getMethod());
         System.out.println("[Request-URI] " + req.getRequestURI());
         System.out.println("[HTTP-Version] " + req.getVersion());
         System.out.println("[Headers]");
         for (final Map.Entry<String, String> e: req.getHeaders().entrySet()) {
             System.out.println(e.getKey() + ": " + e.getValue());
         }
         System.out.println("[Body]");
         System.out.println(req.getBody());
         System.out.println("-----------------------------");
     }
 }


::



 package exp4server;


 import java.net.Socket;
 import java.net.ServerSocket;


 /**
  * 簡単なWebサーバ
  */
 publicclass HTTPServer {
     /**
      * サーバソケット
      */
     privatefinal ServerSocket server;


     /**
      * コンストラクタ．
      * @param port このサーバが受け付けるポート番号
      */
     private HTTPServer(int port) throws java.io.IOException {
         server = new ServerSocket(port);
     }


     /**
      *  インスタンス作成後にサーバのサービスを行うメソッド
      */
     privatevoid doService() {
         System.out.println("Starting Server Service!!");
         for (;;) {
             try {
                 final Socket client = server.accept();
                 final ClientHandler clientHandler = new MyClientHandler(client);
                 clientHandler.doService();
             }
             catch (final Exception e) {
                 e.printStackTrace();
             }
         }
     }


     /**
      * サーバ起動のための主メソッド.
      * 起動方法：
      *  <pre>
      *  java exp4server.HTTPServer
      *  </pre>
      */
     publicstaticvoid main(String[] args) {
         try {
             // サーバを起動
             final HTTPServer server = new HTTPServer(8081);
             server.doService();
         }
         catch (final Exception e) {
             e.printStackTrace();
         }
     }
 }


::



 import java.security.MessageDigest;
 import java.security.NoSuchAlgorithmException;


 publicclass HashSample {
     /**
      * データの salt 付きハッシュ化のサンプル
      */
     publicstaticvoid main(String[] args) {
         for (final String data: args) {
             final String salt = "secretstring";
             System.out.println(getMD5(data + salt));
         }
     }


     /**
      * バイト列を16進の文字列に変換する
      */
     publicstatic String bytesToHexString(byte[] bytes) {
         final StringBuffer sb = new StringBuffer();
         for (finalbyte b: bytes) {
             final String s = Integer.toHexString(0xff & b);
             sb.append(s.length() == 1 ? "0" + s : s);
         }
         return sb.toString();
     }


     /**
      * 文字列をバイト列とみなし，そのMD5値を計算する
      */
     publicstatic String getMD5(String s) {
         try {
             final MessageDigest digest = MessageDigest.getInstance("MD5");
             finalbyte[] bytes = s.getBytes();
             digest.update(bytes, 0, bytes.length);


             return bytesToHexString(digest.digest());
         }
         catch (final NoSuchAlgorithmException e) {
             e.printStackTrace();
         }


         returnnull;
     }
 }

::



 package exp4server;
 import java.util.*;
 import java.io.File;
 import java.io.IOException;
 import java.io.UnsupportedEncodingException;
 import java.net.Socket;
 import java.net.URLDecoder;
 import java.io.Serializable;


 /**
  * Webクライアントと通信を行うクラス
  */


 // <> &amp; うまくいくか？


 publicclass MyClientHandler extends ClientHandler {
 private String session="";
     private String impression="";
 private String name="";
 privateint sex=0;
 private String cookie;
 private Request req;
 private String URI;
 //final SampleSerializer s;

 public MyClientHandler(Socket socket) throws IOException {
         super(socket);
     }


 privatevoid paser() throws UnsupportedEncodingException {
 // リクエスト行を空白"="で区切り解析する
         String r = req.getBody();

         //cookieの処理
         for (final Map.Entry<String, String> e: req.getHeaders().entrySet()) {
         if( e.getKey().equals("Cookie") ){
        String [] cookie = e.getValue().split("=");
         this.session = cookie[1];
        }
         }  

         //nullも空列もはじく nullはオブジェクト自体が未定義
         if ( ! (r == null || r.equals("")) ){
             //配列を動的に確保できる
        String [] key_value = r.split("&");       
         for (int i = 0; i < key_value.length ; i += 2){


        String name =key_value[i].split("=")[0];
        String value = key_value[i].split("=")[1];    

 if( name.equals("sex") ){
 if( value.equals("male") ){
 this.sex = 1;
 }
 else{
 this.sex = 2;
 }
 }
 elseif( name.equals("name") ){
 this.name = URLDecoder.decode( value, "UTF-8" );
 }
 elseif ( name.equals("impression")){
 String t =URLDecoder.decode( value, "UTF-8" );
 t = t.replaceAll("&","&amp;");
 t = t.replaceAll("<","&lt;");
 t = t.replaceAll(">","&gt;");
 t = t.replaceAll("\n","<br/>");
 this.impression = t;
 }
        }
 } 


 }

 privatevoid form_start() throws IOException{
 //header
         sendln("HTTP/1.0 200 OK");
         sendln("Content-Type: text/html; charset=utf-8");
         //sessionID 発行
 SampleRandom sm = new SampleRandom();
         this.session = sm.generateRandomId();
         sendln("Set-Cookie:sessionID="+this.session);
         sendln("");//header end

         sendln("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\">");
         sendln("<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"ja-JP\" xml:lang=\"ja-JP\">");
         sendln("<head><title>It works!</title></head>");
         sendln("<body>");
 sendln("<p>アンケートにようこそ</p>");
 sendln("<form action=\"sex.html\" method=\"post\">");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");
 }


     @Override
     protectedvoid perform(Request req) throws IOException {
         // 標準出力にメソッド，ヘッダ，ボディを出力
 outputRawLog(req);
 this.req = req;
         this.URI = req.getRequestURI();

         //回避
         if(URI.equals("/favicon.ico")){
         return;
         }
         paser();  
         //始めのフォーム、セッション開始させ終わり

         if ( session.equals("") ){
        form_start();//セッション代入している
         final Clientdata cd = new Clientdata(impression,name, sex);
        SampleSerializer.save(this.session, cd );
         return;
         }

        final Clientdata cd1 = (Clientdata)SampleSerializer.load(this.session); 

        if(sex != 0){
        cd1.sex = this.sex;
        }
        if( !name.equals("")){
            cd1.name = this.name;       
        }
        if( ! impression.equals("")){
       cd1.impression = this.impression;
        }
        SampleSerializer.save(this.session, cd1);


         //header
         sendln("HTTP/1.0 200 OK");
         sendln("Content-Type: text/html; charset=utf-8");    
         sendln(""); // ヘッダの終り

 //start html header
         sendln("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\">");
         sendln("<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"ja-JP\" xml:lang=\"ja-JP\">");
         sendln("<head><title>It works!</title></head>");

 //start html body
 if( URI.equals( "/sex.html") ){
 sendln("<body>");
 sendln("<p>性別</p>");
 sendln("<form action=\"name.html\" method=\"post\">");
 sendln("<INPUT type=\"radio\" name=\"sex\" value=\"male\"> 男性<BR>");
 sendln("<INPUT type=\"radio\" name=\"sex\" value=\"female\"> 女性<BR>");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");


 }
 elseif( URI.equals("/name.html") ){
 sendln("<body>");
 sendln("<p>名前</p>");
 sendln("<form action=\"impression.html\" method=\"post\">");
 sendln("<input type=\"text\" name=\"name\" ><BR>");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");
 }
 elseif( URI.equals("/impression.html") ){
 sendln("<body>");
 sendln("<p>感想</p>");
 sendln("<form action=\"confirm.html\" method=\"post\">");
 sendln("<textarea name=\"impression\" rows=\"20\" cols=\"80\"></textarea>");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");
 }
 elseif( URI.equals("/confirm.html")){
 final Clientdata cd2 = (Clientdata)SampleSerializer.load(this.session); 
 sendln("<body>");
 sendln("<p>感想</p>");
 sendln("<form action=\"thanks.html\" method=\"post\">");
             sendln("<p>名前　：");
             sendln(cd2.name);
             sendln("</br>");            
             sendln("性別　：");
             String sex="男";
             if (cd2.sex == 2){
             sex ="女";
             }
             sendln(sex);
             sendln("</br>");
             sendln("感想　：</br>");
             sendln(cd2.impression);
             sendln("</p></br>");


             sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");


 sendln("</form>");
 sendln("</body></html>");


 }
         elseif (URI.equals("/thanks.html")){
             sendln("どうもありがとうございました！！"); 
             new File(this.session).delete();
         }
     }
 }


 class Clientdata implements Serializable {
 public String impression;
 public String name;
 publicint sex;
 Clientdata (String i, String n, int s){
 impression = i;
 name = n;
 sex = s;
 }

 }

::



 package exp4todo;


 import java.io.IOException;
 import java.util.HashMap;
 import java.util.Map;


 import javax.servlet.ServletException;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;


 import net.arnx.jsonic.JSON;


 publicclass JsonSampleServlet extends HttpServlet {
     privatestaticfinallong serialVersionUID = 1L;


     @Override
     protectedvoid doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");


         /* データベース等の処理を行い，データを登録/取得…… */


         final Map<String, Object> result = new HashMap<String, Object>();
         result.put("num", 5);
         result.put("array", new Object[] { 2, 4, 6, 8, 10 });
         result.put("message", "ほげほげ");


         // Map データを JSON に変換し，クライアントに返す
         response.setContentType("application/json; charset=utf-8"); // text/plain でも問題ないが application/json が好ましい
         response.getWriter().println(JSON.encode(result));
     }
 }

::



 package exp4server;


 import java.io.BufferedReader;
 import java.io.IOException;
 import java.util.HashMap;
 import java.util.Map;


 publicclass Request {
     privatefinal String method;


     privatefinal String requestURI;


     privatefinal String version;


     private String body = null;


     privatefinal Map<String, String> headers = new HashMap<String, String>();


     public Request(String method, String path, String version) {
         this.method = method;
         this.requestURI = path;
         this.version = version;
     }


     publicvoid readHeader(BufferedReader in) throws IOException {
         for (;;) {
             final String line = in.readLine();
             if ("".equals(line)) {
                 return;
             }


             // ヘッダは１行であることを仮定している．
             final String[] s = line.split(":\\s*");
             if (s.length > 1) {
                 headers.put(s[0], s[1]);
             }
         }
     }


     publicvoid readBody(BufferedReader in) throws IOException {
         final String contentLength = headers.get("Content-Length");
         if (contentLength != null) {
             finalint length = Integer.parseInt(contentLength);
             finalchar[] buf = newchar[length];
             if (in.read(buf) != -1) {
                 this.body = String.valueOf(buf);
             }
         }
     }


     /**
      * リクエストの HTTP メソッドを返す．
      */
     public String getMethod() {
         return method;
     }


     /**
      * リクエストに含まれる URI を返す．
      */
     public String getRequestURI() {
         return requestURI;
     }


     /**
      * リクエストの HTTP バージョンを返す．
      */
     public String getVersion() {
         return version;
     }


     /**
      * リクエストヘッダを返す．
      */
     public Map<String, String> getHeaders() {
         return headers;
     }


     /**
      * リクエストの本文を返す．無い場合は null が返る．
      */
     public String getBody() {
         return body;
     }
 }

::



 package exp4server;


 import java.io.File;
 import java.io.FileInputStream;
 import java.io.FileNotFoundException;
 import java.io.FileOutputStream;
 import java.io.IOException;
 import java.io.ObjectInputStream;
 import java.io.ObjectOutputStream;
 import java.io.Serializable;


 publicclass SampleSerializer implements Serializable {


     privatefinal String s;


     privatefinalint n;


     public SampleSerializer(String s, int n) {
         this.s = s;
         this.n = n;
     }


     @Override
     public String toString() {
         return s + ":" + n;
     }


     publicstaticvoid save(String filename, Object object) {
         try {
             final ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(filename));
             oos.writeObject(object);
             oos.close();
         }
         catch (final FileNotFoundException e) {
             e.printStackTrace();
         }
         catch (final IOException e) {
             e.printStackTrace();
         }
     }


     publicstatic Object load(String filename) {
         try {
             final ObjectInputStream ois = new ObjectInputStream(new FileInputStream(filename));
             final Object result = ois.readObject();
             ois.close();
             return result;
         }
         catch (final FileNotFoundException e) {
             e.printStackTrace();
         }
         catch (final IOException e) {
             e.printStackTrace();
         }
         catch (final ClassNotFoundException e) {
             e.printStackTrace();
         }
         returnnull;
     }


     publicstaticvoid main(String[] args) {
         final SampleSerializer s1 = new SampleSerializer("foo", 1);
         System.out.println(s1);
         SampleSerializer.save("test.bin", s1);


         final SampleSerializer s2 = (SampleSerializer) SampleSerializer.load("test.bin");
         System.out.println(s2);


         System.out.println(new File("test.bin").delete());
     }
 }

::



 package exp4todo;


 /**
  * ユーザのデータを格納するモデル
  */
 publicclass User {
     private String name;


     private String pass;

 User(String n, String p){
 name = n;
 pass = p;
 }
     public String getName() {
         return name;
     }


     publicvoid setName(String name) {
         this.name = name;
     }


     public String getPass() {
         return pass;
     }


     publicvoid setPass(String pass) {
         this.pass = pass;
     }
 }

::



 package exp4server;
 import java.util.*;
 import java.io.IOException;
 import java.net.Socket;
 import java.net.URLDecoder;
 /**
  * Webクライアントと通信を行うクラス
  */
 publicclass MyClientHandler extends ClientHandler {


 //client data
 int sex=0;
 String name ="";
 String impression="";



 public MyClientHandler(Socket socket) throws IOException {
         super(socket);
     }

     @Override
     protectedvoid perform(Request req) throws IOException {
         // 標準出力にメソッド，ヘッダ，ボディを出力
 outputRawLog(req);
         String URI = req.getRequestURI();

 //header
         sendln("HTTP/1.0 200 OK");
         sendln("Content-Type: text/html; charset=utf-8");

 // リクエスト行を空白"="で区切り解析する
         String req_body = req.getBody();


         //nullも空列もはじく nullはオブジェクト自体が未定義
         if ( ! (req_body == null || req_body.equals("")) ){
             //配列を動的に確保できる
 String [] andPased = req_body.split("&");
 //            String [] key_value = andPased.split("=");


             for(int i=0; i < andPased.length; i++ ){
 //System.out.println(andPased[i]);
 String [] key_value = andPased[i].split("=");
 String name = key_value[0];
 String value = key_value[1]; 

 //System.out.println(name +" "+value);

 if( name.equals("sex") ){
 if(value.equals("1") ){
 this.sex = 1;
 }
 else{
 this.sex = 2;
 }
 }
 elseif(name.equals("name")){
 this.name = URLDecoder.decode(value,"UTF-8");
 //System.out.println(this.name);

 }
 elseif(name.equals("impression")){
 this.impression = URLDecoder.decode(value,"UTF-8");
 }
 }
 }


         sendln(""); // ヘッダの終り
 //System.out.println(">>>>>>>>>>>>>>>>>>>>>>"+this.name);

 //start html header
         sendln("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\">");
         sendln("<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"ja-JP\" xml:lang=\"ja-JP\">");
         sendln("<head><title>It works!</title></head>");

 //start html body
 if( URI.equals( "/sex.html") ){
 sendln("<body>");
 sendln("<p>性別</p>");
 sendln("<form action=\"name.html\" method=\"post\">");
 sendln("<INPUT type=\"radio\" name=\"sex\" value=\"1\"> 男性<BR>");
 sendln("<INPUT type=\"radio\" name=\"sex\" value=\"2\"> 女性<BR>");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");

 }
 elseif( URI.equals("/name.html") ){
 sendln("<body>");
 sendln("<p>名前</p>");
 sendln("<form action=\"impression.html\" method=\"post\">");
 sendln("<input type=\"text\" name=\"name\" ><BR>");
 //keep inputed imformation
 sendln("<input type=\"hidden\" name=\"sex\" value=\""+this.sex+"\" >");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");
 }
 elseif( URI.equals("/impression.html") ){
 sendln("<body>");
 sendln("<p>感想</p>");
 sendln("<form action=\"confirm.html\" method=\"post\">");
 sendln("<textarea name=\"impression\" rows=\"20\" cols=\"80\"></textarea>");
 sendln("<input type=\"hidden\" name=\"sex\" value=\""+this.sex+"\" >");
 sendln("<input type=\"hidden\" name=\"name\" value=\""+this.name+"\" >");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");
 }
 elseif( URI.equals("/confirm.html")){


             //send a body 
 sendln("<body>");
 sendln("<p>確認</p>");
 sendln("<form action=\"thanks.html\" method=\"post\">");    


             //結果送信
             sendln("<p>名前　：");
             sendln(this.name);
             sendln("</br>");

             sendln("性別　：");
 if(this.sex==1)sendln("男");
 else sendln("女");
             sendln("</br>");

             sendln("感想　：</br>");
             sendln(this.impression.replaceAll("\n","</br>"));
             sendln("</p></br>");

 sendln("<input type=\"hidden\" name=\"sex\" value=\""+this.sex+"\" >");
 sendln("<input type=\"hidden\" name=\"name\" value=\""+this.name+"\" >");
 sendln("<input type=\"hidden\" name=\"impression\" value=\""+this.impression+"\" >");

             sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");

 }
         elseif (URI.equals("/thanks.html")){
             sendln("どうもありがとうございました！！");            
 System.out.println("output data:");
 System.out.println(this.sex);
 System.out.println(this.name);
 System.out.println(this.impression);

         }
 else{
 // レスポンスを返す
 sendln("<body>");
 sendln("<p>アンケートにようこそ</p>");
 sendln("<form action=\"sex.html\" method=\"post\">");
 sendln("<input type=\"submit\" value=\"送信する\">");
 sendln("</form>");
 sendln("</body></html>");
 }
     }
 }

::


 package exp4todo;


 import java.security.MessageDigest;
 import java.security.NoSuchAlgorithmException;


 publicclass HashSample {
     /**
      * データの salt 付きハッシュ化のサンプル
      */
 finalstatic String salt = "secretstring";


     publicstaticvoid main(String[] args) {
         for (final String data: args) {
             final String salt = "secretstring";
             System.out.println(getMD5(data + salt));
         }
     }


     /**
      * バイト列を16進の文字列に変換する
      */
     publicstatic String bytesToHexString(byte[] bytes) {
         final StringBuffer sb = new StringBuffer();
         for (finalbyte b: bytes) {
             final String s = Integer.toHexString(0xff & b);
             sb.append(s.length() == 1 ? "0" + s : s);
         }
         return sb.toString();
     }


     /**
      * 文字列をバイト列とみなし，そのMD5値を計算する
      */
     publicstatic String getMD5(String s) {
         try {
             final MessageDigest digest = MessageDigest.getInstance("MD5");
             finalbyte[] bytes = s.getBytes();
             digest.update(bytes, 0, bytes.length);


             return bytesToHexString(digest.digest());
         }
         catch (final NoSuchAlgorithmException e) {
             e.printStackTrace();
         }


         returnnull;
     }
 }


::



 package exp4todo;


 import java.util.ArrayList;
 import java.util.List;
 import java.util.Enumeration;
 import java.util.Map;
 import java.util.HashMap;




 publicclass Attribute {

     Login login;
 Map<String,String> attr = new HashMap<String,String>();
 boolean next = false;
 boolean previous = false;
 String mode = "showAll";
 String post = "";
 int page = 0;
 int limit = 10;//how many tasks show?
 int offset = 0;
 int taskId = 0;
 int edit_done = 0;
 int id = 0;
 int done = 0;
 String content ="";
 String time ="";
 String json = "false";




 Attribute(Login l){
 login = l;
 if(login.map.containsKey("delete"))
 post = "delete";
 elseif (login.map.containsKey("done"))
 post = "done";
 elseif (login.map.containsKey("content"))
 post = "content";
 if  (login.map.containsKey("edit")){
 if(login.map.get("edit")[0].equals("true"))
 post = "edit";
 }


 if(login.map.containsKey("edit_done")){
 try{
 edit_done = Integer.parseInt(login.map.get("edit_done")[0]);
 }catch( NumberFormatException e){ }
 }

 if(login.map.containsKey("json"))
 json = login.map.get("json")[0];



 if(login.map.containsKey("mode")){
 mode = login.map.get("mode")[0];
 if(mode.equals("showAll")){
 mode = "showAll";
 }
 elseif (mode.equals("undone")){
 mode = "undone";
 }
 }
 if(login.map.containsKey("id")){
 try{
 id = Integer.parseInt(login.map.get("id")[0]);
 }catch( NumberFormatException e){ }
 }


 if(login.map.containsKey("taskId")) {
 try{
   taskId = Integer.parseInt(login.map.get("taskId")[0]);
 }catch( NumberFormatException e){
 taskId = 0;
 }
   if( taskId < 0 ) taskId = 0; 
 mode = "taskId";
 }
 if(login.map.containsKey("page")) {
 try{
 page = Integer.parseInt(login.map.get("page")[0]);
 }catch( NumberFormatException e){
 page = 0;
 }
   if( page < 0 ) page = 0;
 offset = limit * page;
 }
 }


 publicboolean login(){
 boolean ret = false;
 DoTask dt = new DoTask(login);
 if( dt.login() )ret = true;
 return ret;
 }




 publicvoid getStart(){

 SendHtml sh = new SendHtml(mode,page);
 DoTask dt = new DoTask(login);
 TaskList tl = null ;

 if (mode.equals("showAll")){
 tl = dt.getTaskList();
 }
 elseif(mode.equals("undone")){
 tl = dt.getUndoneTaskList();
 }
 elseif(mode.equals("taskId")){
 Task t = dt.getTask();
 attr.put("content",t.getContent());
 attr.put("taskId",String.valueOf(taskId)); 
 attr.put("done",String.valueOf(t.getDone()));

 return;
 }




 if ( page == 0){
 previous = false;
 }else{
 previous = true;
 }
 if( dt.isNextPage() ){
 next = true;
 }else{
 next = false;
 }

 attr.put("previous",String.valueOf(previous));
 attr.put("next",String.valueOf(next));
 if (tl != null){
 String taskList = sh.taskListToString(tl);
 attr.put("taskList",taskList);
 }
 }




 publicvoid  postStart(){
 DoTask dt = new DoTask(login);
 if(post.equals("content") ){
 if(login.map.containsKey("content") && ! login.map.get("content")[0].equals("") )
 dt.setTask();
 else
 attr.put("warnning","task is empty");
 }
 elseif(post.equals("delete")){
 dt.deleteTask();
 }
 elseif (post.equals("done")){
 dt.doneTask();
 }
 elseif (post.equals("edit")){
 dt.editTask();


 }



 }


 public Map<String,String> sessionLogin(){
 attr.put("login","true");
 attr.put("user",login.map.get("user")[0]);
 return attr;
 }



 }


::



 package exp4todo;


 import java.io.IOException;
 import java.util.HashMap;
 import java.util.Map;


 import javax.servlet.ServletException;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;


 import net.arnx.jsonic.JSON;


 publicclass JsonSampleServlet extends HttpServlet {
     privatestaticfinallong serialVersionUID = 1L;


     @Override
     protectedvoid doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");


         /* データベース等の処理を行い，データを登録/取得…… */


         final Map<String, Object> result = new HashMap<String, Object>();
         result.put("num", 5);
         result.put("array", new Object[] { 2, 4, 6, 8, 10 });
         result.put("message", "ほげほげ");


         // Map データを JSON に変換し，クライアントに返す
         response.setContentType("application/json; charset=utf-8"); // text/plain でも問題ないが application/json が好ましい
         response.getWriter().println(JSON.encode(result));
     }
 }


::



 package exp4todo;


 import java.io.IOException;
 import java.sql.Connection;
 import java.sql.DriverManager;
 import java.sql.PreparedStatement;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.sql.Statement;
 import java.util.ArrayList;
 import java.util.List;
 import java.util.Date;


 publicclass Database{

 private Connection conn = null;
 privateint limit = 10;
 privateint offset = 0;
 private Login login;
 Database( Login l,  String dbname ){
 login = l;
 try{
 Class.forName("org.sqlite.JDBC");
 Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbname);
 this.conn = conn;
 }catch (final ClassNotFoundException e) {
 e.printStackTrace();
 }
 catch (final SQLException e) {
 e.printStackTrace();
 }

 }
 publicvoid setLimit (int l){
 limit = l;
 }


 publicvoid setOffset (int o){
 offset = o;
 }


 publicint getNumberOfTasks(String user){
 int ret = 0;
 try{
 String mode = login.at.mode;
 String sql = null;
 if(mode.equals("undone"))
 sql = "select count(*) from tasks where done = 0 and del = 0 and  user = ?";
 else
 sql = "select count(*) from tasks where del = 0 and  user = ?";

 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setString(1,user);
 ResultSet rs = prep.executeQuery();
 if(rs.next()){
 ret = rs.getInt(1);
 }
 rs.close();
 }catch(SQLException e){}


 return ret;


 }

 publicboolean login (String user, String pass){
 boolean ret = false;

 try {
 // prepared statement: SQL
 String sql  = "select pass from users where user = ? ;";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setString(1, user);
 ResultSet rs = prep.executeQuery();
 if( rs.next() ){
 String hashPass = rs.getString("pass");
 pass = HashSample.getMD5(HashSample.salt + pass);
 //login success
 if( pass.equals( hashPass ) ){
 ret = true;
 }
 }else{
 ret = false;
 }
 //close
 rs.close();
 //conn.close();
 }catch (SQLException e) {

 }

 return ret;
 }

 publicvoid deleteTask( int ID ){
 try {
 String sql  = "update tasks set del = 1 where id = ? ;";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setInt(1, ID);
 prep.execute();
 } catch ( SQLException e){


 }
 //conn.close();
 }




 publicvoid doneTask( int ID ,int done ){
 try{
 String sql = "update tasks set done = ? where id = ? ;";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setInt(1, done);
 prep.setInt(2, ID);
 prep.execute();
 }catch(SQLException e){


 }
 //conn.close();
 }


 public Task getTask(){
 Task t = new Task(login.user);
 try{
 String sql = "select * from tasks  where del = 0 and id = ? ;";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setInt(1,login.at.taskId);
 ResultSet rs = prep.executeQuery();
 if( rs.next()){
 t.setTime(rs.getLong("time"));
 t.setContent(rs.getString("content"));
 t.setID(rs.getInt("id"));
 t.setDone(rs.getInt("done"));
 t.setDelete(rs.getInt("del"));
 }
 rs.close();
 }catch(SQLException e){}
 return t;

 }


 public TaskList getTaskList(String user){
 TaskList tl = new TaskList();
 try{
 String sql = "select * from tasks where del = 0 and user = ? order by time desc  limit ? offset ?  ;";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setString(1,user);
 prep.setInt(2,limit);
 prep.setInt(3,offset);
 final ResultSet rs = prep.executeQuery();
    while(rs.next()){
 Task t = new Task(rs.getString("user"));
 t.setTime(rs.getLong("time"));
 t.setContent(rs.getString("content"));
 t.setID(rs.getInt("id"));
 t.setDone(rs.getInt("done"));
 t.setDelete(rs.getInt("del"));
 tl.add(t);
 }
 rs.close();
 }catch( SQLException e ){


 }
  return tl;
 }


 publicvoid editTask(Task t){
 Date d = new Date();
 long time = d.getTime();
 try {
 String sql = "update tasks set content = ? , done = ? , time = ? where user = ? and id = ? ;";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setString(1,t.getContent());
 prep.setInt(2,t.getDone());
 prep.setLong(3,time);
 prep.setString(4,t.getUser());
 prep.setInt(5,t.getID());
 prep.execute();
 }catch( SQLException e){}


 }




 public TaskList getUndoneTaskList(String user){
 TaskList tl = new TaskList();
 try{
 String sql = "select * from tasks where del = 0 and done = 0  and user = ? order by time desc  limit ? offset ? ;";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setString(1,user);
 prep.setInt(2,limit);
 prep.setInt(3,offset);
 final ResultSet rs = prep.executeQuery();
    while(rs.next()){
 Task t = new Task(rs.getString("user"));
 t.setTime(rs.getLong("time"));
 t.setContent(rs.getString("content"));
 t.setID(rs.getInt("id"));
 t.setDone(rs.getInt("done"));
 t.setDelete(rs.getInt("del"));
 tl.add(t);
 }
 rs.close();
 }catch( SQLException e ){


 }
  return tl;
 }


 publicvoid updateTask(Task t){


 try {
 final Statement stat = conn.createStatement();
 Date d = new Date();
 long time = d.getTime();
 String sql = "update tasks set del = 1 where id = 10 ;";
 stat.executeUpdate(sql);
 }catch( SQLException e){


 }
 }


 publicvoid taskRegister(Task t){

 String user = t.getUser();
 Date d = new Date();
 long time = d.getTime();
 String content = t.getContent();
 try{
 // prepared statement: SQL
 String sql  = "insert into tasks (user, time, content, del, done ) values (?, ?, ?, ?, ?)";
 final PreparedStatement prep = conn.prepareStatement(sql);
 prep.setString(1, user);
 prep.setLong(2, time);
 prep.setString(3, content); 
 prep.setInt(4, 0); 
 prep.setInt(5, 0); 
         prep.execute();
  }catch( SQLException e  ){


 }
 }

 }

pointer
-------

javaにもポインタはある
object a = new object();
func(a);
このとき、関数にインスタンスを丸ごと渡している
funcでの書き換えは、そのままインスタンスを書き換えることになる
ポインタを渡す＞書き換え起こる
コピーして渡す＞caller,callee同士別々になる

型ごと戻り値にできる
cだと、構造体みたいなもの、ポインタを渡しているんだね
int foo;
    ...
    if ( someCondition ) {
        foo = 42;
        ...
    } else
        return;
    foo += 1;
初期化したくない、場合はこうすれば、コンパイルエラーでない
初期化のし忘れが一番多いエラー


staticメソッドは、インスタンスを必要としない
他のstatiな method memberにアクセス可能
例えば、squrtの計算なんて、一通りしかないから、staticにするとか
Math.squartとすれば、よい！！（クラス自体が参照できることが条件）

this.member でインスタンスのメンバ変数を参照する
ローカルのmemberと区別する
特に、 this.a = a;みたいな書き方が多い

定数の作り方
static final float EARTH_G = 9.80;

アクセス指示（一応、メンバとメソッドで分けて考えた方がいいと思う）
private 自分自身のクラスからしか、参照できない
publicにして、memberの値を読み取る形式が一般的

open -a TextEdit java.txtでアプリケーションを開ける

oppについて
振る舞い　method
状態     member
区別     ID
オブジェクトの要素はこの３点

Pendulum p;
    p = new Pendulum( );
クラスの型宣言
オブジェクト作成
以下のようにして、アクセスが可能になる
p.member;
p.method();

クラスには二種類の変数が宣言できる
static 各インスタンスobjectsに共通
instance それぞれ異なる

初期値はnull zero falseになってる





c はjarファイルを新規作成する
v は詳細な情報を画面に出力する
f はjarファイル名を指定する

ディレクトリを指定できるので、importするファイルに合わせておく
パッケージ化されていれば、階層をあがってくれる


privatefinal Map<String, String> headers = new HashMap<String, String>();
インタフェイスがMapで、それを実装したのが、hashmapだって、
Mapの機能だけを使いたいから、型を宣言してるんだね

::

 javacコマンドにはオプション「-J-Dfile.encoding=UTF-8」、javaコマンドにはオプション「 -Dfile.encoding=UTF-8無題ノートwgetはこれは、指定したurlからダウンロードを開始するもの
 でもbrowserよりも使いにくいと思うのは気のせい？
 Opera からクリップした無題ノートjar cvf JarTest.jar *.class


 javacでコンパイルしたファイルがclassになり
 それを一つにまとめられる



::



 package exp4todo;


 import java.util.ArrayList;
 import java.util.List;
 import java.util.Enumeration;
 import java.util.Map;
 import java.util.HashMap;
 import java.util.Iterator;


 import net.arnx.jsonic.JSON;


 import javax.servlet.ServletException;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import javax.servlet.http.HttpSession;
 import java.io.UnsupportedEncodingException;
 import java.io.IOException;
 /**
  * Session sample
  */




 publicclass Login extends HttpServlet {
 privatestaticfinallong serialVersionUID = 1L;


 private String login;
 Attribute at;
 public String forward = "/index.jsp";
 public String user;
 public Map<String,String[]> map;
 public String root;


 @Override
 protectedvoid doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException { 


 start(request,response);
 if( login != null  && login.equals("true")){
 at.getStart();
 for(final Map.Entry<String, String> e: at.attr.entrySet()){
 request.setAttribute(e.getKey(),e.getValue());
 }
 }
 if(user == null || user.equals("null")){
 forward = "/index.jsp";
 }


 if(at.json.equals("true")){
 response.setContentType("application/json; charset=utf-8");
 response.getWriter().println(JSON.encode(at.attr));
 }
 else
 request.getRequestDispatcher( forward ).forward(request, response);


 }


 privatevoid start(HttpServletRequest request, HttpServletResponse response){


 try{
 request.setCharacterEncoding("UTF-8");
 }catch(UnsupportedEncodingException e){}
     login = (String)request.getSession().getAttribute("login");
 user = (String)request.getSession().getAttribute("user");
 map = request.getParameterMap();
 root = getServletContext().getRealPath("/");
     at = new Attribute(this);


 }


 @Override
 protectedvoid doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

 start(request,response);
 HttpSession hs = request.getSession();

 //login start
 if( login == null  ){
 //login success
 if( at.login() ){
 forward = "/userIndex.jsp";
 //session 
 Map<String,String> attr = at.sessionLogin();
 for(final Map.Entry<String, String> e: attr.entrySet()){
 hs.setAttribute(e.getKey(),e.getValue());
 } 
 }
 }
 // after login 
 elseif (login.equals("true") ){
 //sa.afterLogin();
 forward = "userIndex.jsp";
 at.postStart();
     at.getStart();
 for(final Map.Entry<String, String> e: at.attr.entrySet()){
 request.setAttribute(e.getKey(),e.getValue());
 }
 }
 //XMLの区別が必要?
 if(at.json.equals("true")){
 response.setContentType("application/json; charset=utf-8");
 response.getWriter().println(JSON.encode(at.attr));
 }else
 request.getRequestDispatcher( forward ).forward(request, response);

 }
 }


::

 Test a[];
 a[0] = new Test();
 エラー

 Test a[];
 a = new Test[10];

 a[0] = new Test();


::

 class Sake extends Alcohol{
     final String name = "日本酒";
     Sake(){
      super(name);
     }
 }
 コンパイルえらーでるので注意
 参照できないので、getNameの上書きを考える

::

 <?xml version="1.0"?>
 <project name="SampleProj" default="default">
   <target name="default">
     <javac srcdir="." destdir="." />
     <mkdir dir="../jar" />
     <jar destfile="../jar/Sample.jar"
       basedir="." manifest="manifest.mf" />
   </target>
 </project>

::

 5.3.3. Static and Nonstatic Initializer Blocks
 わからない

 匿名クラス
 インナークラス
 無名クラス

 オブジェクトは言っていない＞null
 Figure[] f = new Figure[50];は領域の確保だけ
 r.f[0] = new Rectangle(10,5);実際に代入

 super a = (sub)b;
 親の型へ子供はキャストしてもよい！
 ってか、キャストしなくても自動的になる
 インターフェイスが親で動くのかな

 main関数をもった、クラス名をファイル名にすれば、コンパイルできる
 複数のクラスは、同一ファイルに記述できる、publicとかはとっておく？
 publicの時は、外部から参照可能な状態でないといけない
 だから、無修飾にして、パッケージ内だけにとどめる

 完全なランダムな文字列は作れない
 パソコンは、決まった処理しかしない
 決定論っていうみたい
 つまり、ランダムな文字列は逆算可能だって
 いやでも、ハッシュ関数って、逆変換不可能なんじゃなかった？

 リテラル 0xFF は int型なので、桁数が分かりやすいように表記すると 0x000000FF
 これを説明するのは結構ムズカシイかもしれないなあ。

 b & 0xFF
 (1) b は byte型、リテラル 0xFF は int型なので、論理積を計算する前に b が暗黙のキャストにより int型になります。
 (2) b に格納されている値 0xC7 (-57) が 0xFFFFFFC7 (-57) になります。-57 という値は変化しませんが、byte から int に変換されたことによりビットパターンが変化します。負数の場合は、増えた桁数を 2進数の 1 で埋めなければならないので。
 (3) リテラル 0xFF は int型なので、桁数が分かりやすいように表記すると 0x000000FF となります。
 (4) 0xFFFFFFC7 & 0x000000FF の論理積を取るので結果が 0x000000C7 になります。
 0x000000C7 は最上位ビットが立っていないことからも明らかなように正の数ですね。
 キャストされるときに、自動的に符号拡張されるんだ！
 それで、正の数なら、0000…を加えて負なら1111….を加えて、
 どちらにしても、0x000000FFと論理積をとれば、正の数が得られるじゃん


 string の文字列はかきかえが出来ない
 文字列の変数は書き換えられる
 つまら,"aaa aaaa aa"ってデータの4番目をbに書き換えることができない
 Stringbuffer　クラスを利用することで可能になる

 for(String s : str){
 }
 foreachのように配列をループで使用してよい

 プリミティブタイプは、コピーして渡す
 配列、オブジェクトは、アドレスを渡す（書き変わる）
 変数ではない！つまり、一度newしたものになる

 クラス名　大文字で始める

 println(object)>String.valueOf(object)>return obj != null ? obj.toString():"null";
 objectのメンバを書き出したい時は、toString 内部でめんば変数呼び出して、戻す！

 System.out.println(object)
 このときは、メンバ変数を出す？
 toStringが呼び出される

 オブジェクトのストリーム
 ファイルストリーム
 javaはオブジェクト自体の入出力もできる！
 これはソケットとかで必要になりそう

 obj instanceof String オブジェクトの型を判定する

 パッケージは同一なものは、同一ディレクトリに格納する
 階層を下げると、dir.dir
 コンパイルされていれば、.javaはいらない
 くらすの名前　＝　ファイル名

 型を親にかえても、子供のメソッドにアクセスできる（親になければ）
 Cat simon = new Cat( );
     Animal creature = simon;
     creature.sleep( );       // accesses Cat sleep( );

 overload at compile
 override at runtime

 override
 子供は、親のメソッドを全て使える
 もしも、動きを変更したかったら、子供で再定義できる

 型が親のクラスになったから、参照も親になる
 DecimalCalculator dc = new DecimalCalculator( );
     IntegerCalculator ic = dc;
     int s = ic.sum;       // accesses IntegerCalculator sum

 子供は親の型を使える
 superは親を参照できる
 super();コンストラクタ
 super.member (これがprotectなんだね)

 inner
 interface
 inheritance
 package

 this(a,b)はコンストラクタ
 引数を揃えるのに使える　ただし、一行目に書く必要がある
 コンストラクタの間は、オブジェクトのメソッド、メンバにはアクセスできない
 というよりも、まだ、生成されていない
 ただし、staticなものには、アクセス可能！

 オブジェクトはヒープに割り当てられる＞だから、いいのか！
 newで明示する必要あり
 objects are removed by garbage collection when they're no longer referenced

 引数を無限にする
 void a (object … list){
 //object [ ]という配列をここで使える
 }

 wrappers for primitive types
 これは便利で、Double d = new Double("2.14");
 d.intValue()で値にアクセス可能になる

 object-oriented
 隠蔽：内部動作を隠す
 When you change or refine the behavior of an object (by subclassing), you are using inheritance
 Minimize relationships between objects and try to organize related objects in packages

 finalは変数の時は、書き換えが不可のサイン
 関数はオーバーライドが不可

 thisはそれ自体が、オブジェクトを表す
 呼ばれたところで、参照しているオブジェクト
 インスタンスがあって、どのインスタンスか、その値を保持している
 てかオブジェクトでのリスト構造ってできるんだね

 static
 メンバは、オブジェクトに共通
 関数は、インスタンスを作る必要がない

 ポインタを渡すのか、コピーしているのかの違い

 javaはオブジェクトを配列の要素にできる
 try-catch構文が苦手よ（）

 String [] a = string.split(" ");
 空白で、文字列を分解して、順に配列に代入する
 すごいのは、配列の数が決まっていなくてもいいので、動的確保可能

 javaのローカル変数は、
 {int a;}
 {int a;}
 可能
 int a
 {int a}
 不可
 {int a}
 int a
 可能
 つまり、極力一時的な変数は使わないですませる
 for(int i;;){for(int j;;){}}
 このように、同じ名前を区別しないと行けないi=>jと順番にいく
 スコープ内で一番内側にあるものが、参照されるわけではない

 配列の定義の仕方：
 int [] a;
 これは、宣言しただけで、一体いくつの配列が必要かは、宣言していない
 実際にインスタンスを作った訳ではない
 a = new int[20];
 こうして配列が実際に出来上がる
 a[19]のようにして、アクセス
 a.lengthで配列の要素数を得られる

 例外
 ArrayIndexOutOfBoundsException　配列の数が足りません


Settings
--------

alias javac="javac -j-dfile.encoding=utf-8"
alias java="java -dfile.encoding=utf-8"
export svn_editor=vim
alias emacs="/applications/emacs.app/contents/macos/emacs"
alias text="open -a textedit"
alias jython="~/jython/jython"
