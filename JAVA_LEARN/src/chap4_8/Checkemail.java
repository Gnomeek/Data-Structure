package chap4_8;
import java.io.*;

public class Checkemail 
{ 
 public static boolean checkEmail(String email)
  {// ��֤�����������ʽ 
   String format = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
   //p{Alpha}:�����Ǳ�ѡ�ģ�����ĸ�ַ�[\p{Lower}\p{Upper}]�ȼۡ��磺200896@163.com���ǺϷ��ġ�
   //w{2,15}: 2~15��[a-zA-Z_0-9]�ַ���w{}�����Ǳ�ѡ�ġ� �磺dyh@152.com�ǺϷ��ġ�
   //[a-z0-9]{3,}����������[a-z0-9]�ַ�,[]�ڵ��Ǳ�ѡ�ģ��磺dyh200896@16.com�ǲ��Ϸ��ġ�
   //[.]:'.'��ʱ��ѡ�ģ� �磺dyh200896@163com�ǲ��Ϸ��ġ�
   //p{Lower}{2,}Сд��ĸ���������ϡ��磺dyh200896@163.c�ǲ��Ϸ��ġ�
   if (email.matches(format))
    { 
     return true;// �������Ϸ�������true 
    }
   else
    {
     return false;// ���������Ϸ�������false
    }
  } 
 public static void main(String[] args) throws Exception
 {
  String email = "cc**365@163.com"; // ��Ҫ������֤������
   while(true)
  {
    email = new BufferedReader(new InputStreamReader(System.in)).readLine();
   if (Checkemail.checkEmail(email))// ��֤����
   {   
    System.out.println(email+" is legal");
   }
   else
   {
    System.out.println(email+" is not legal");
   }
  }
 }
}