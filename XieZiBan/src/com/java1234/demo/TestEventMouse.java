package com.java1234.demo;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionAdapter;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JRadioButton;

//####################################
//������ʱ��������к�ʲôҲû�У�����Ҫ�������Ļ���ƶ��²��ܳ��ְ�ť��
//����Ϊʲô�����񲻶������Ժ��д��о�
//######################################
public class TestEventMouse extends JFrame{  //���࣬�̳�JFrame�࣬��ΪҪ�õ�paint()����������
	//����̳�һ��Frame�࣬�����������ѧ�߻�ûѧ���������Ե���paint()�ķ���
	Container contentPanel; //���ݸ�����
	JButton b1,b2,b3,b4,b5;//���������ť
	JRadioButton backGroundRadio,foreGroundRadio;  //����������ѡ��
	ButtonGroup radioGroup;  //��ѡ��ť��
	int xValue,yValue;  //�������λ�ã�x,y��
	JFrame jf=this;//�ѵ�ǰ����ֵ��jf����Ϊ�Һ����������ʱ���֣�����ɫ�����ݸ����˵���������
	//������ģ�Frame������ǲ�������ɫ�ģ�������֮����Ҫ��ȡJFrame�Ķ�������Ϊǰ��ɫֻ�п����
	//�ܹ��������������û���ʸ��������������¼�����Ļ�����ᷢ��
	
	public TestEventMouse(){ //���캯��
		super("08�Ʊ� �ܷ�--ģ��д�ְ�");
		b1=new JButton("Black");//ʵ�������ť
		b2=new JButton("Blue");
		b3=new JButton("Red");
		b4=new JButton("White");
		b5=new JButton("Yellow");
		contentPanel=this.getContentPane();//��ȡ���ݸ�
		contentPanel.setLayout(new FlowLayout());//�������ݸ�Ĳ��ֹ�����
		
		backGroundRadio=new JRadioButton("backGround"); //ʵ������ѡ��
		foreGroundRadio=new JRadioButton("foreGround");
		
		contentPanel.add(backGroundRadio);//��ӵ����ݸ�����ȥ
		contentPanel.add(foreGroundRadio);
		
		contentPanel.add(b1);//��Ӱ�ť
		contentPanel.add(b2);
		contentPanel.add(b3);
		contentPanel.add(b4);
		contentPanel.add(b5);
		
		MouseListenerHandler mou=new MouseListenerHandler(); //ʵ��һ���¼�������
		b1.addMouseListener(mou); //ע��Ϊ�����ť�ļ�����
		b2.addMouseListener(mou);
		b3.addMouseListener(mou);
		b4.addMouseListener(mou);
		b5.addMouseListener(mou);
		
		radioGroup=new ButtonGroup(); //ʵ����ѡ��ť��
		radioGroup.add(backGroundRadio);//������radio��ť����һ����
		radioGroup.add(foreGroundRadio);
		
		
		addMouseMotionListener(  //������
				new MouseMotionAdapter(){  //��Ϊ�ǵ�ǰһ��������ã����Ը��˸�����������
					public void mouseDragged(MouseEvent e){
						xValue=e.getX();
						yValue=e.getY();
						repaint();  //����paint()����
					}
				}
				);
		setSize(1000,500);  //Ҫ���Ҫ����
		setVisible(true);  //���ÿɼ�
	}
	
	public class MouseListenerHandler implements MouseListener{  //����¼�������
		public void mousePressed(MouseEvent e){  //��ʵֻ��һ�����õģ�����������¼�
			                                     //��ΪҪ�����Ķ���Ƚ϶࣬����������������
			if(e.getSource()==b1){   //��getSouce()��ȡ����
				if(backGroundRadio.isSelected())
					contentPanel.setBackground(Color.BLACK);//�ص����ˣ������ݸ������ñ���ɫ
				else                                 //#####################
					jf.setForeground(Color.BLACK);   //��Frame���������ǰ��ɫ
			}
			if(e.getSource()==b2){
				if(backGroundRadio.isSelected())
					contentPanel.setBackground(Color.BLUE);
				else
					jf.setForeground(Color.BLUE);
			}
			if(e.getSource()==b3){
				if(backGroundRadio.isSelected())
					contentPanel.setBackground(Color.RED);
				else
					jf.setForeground(Color.RED);
			}
			if(e.getSource()==b4){
				if(backGroundRadio.isSelected())
					contentPanel.setBackground(Color.WHITE);
				else
					jf.setForeground(Color.WHITE);
			}
			if(e.getSource()==b5){
				if(backGroundRadio.isSelected())
					contentPanel.setBackground(Color.YELLOW);
				else
					jf.setForeground(Color.YELLOW);
			}	
		}
		public void mouseClicked(MouseEvent e) {	//���涫��û�ã�������Ϊ�ӿڷ�������ʵ����	
		}
		public void mouseEntered(MouseEvent e) {		
		}
		public void mouseExited(MouseEvent e) {		
		}
		public void mouseReleased(MouseEvent e) {		
		}
}
	
	
	public void paint(Graphics g){  //��ЩСԲ�����Ի��˵����ۣ��Ǻ�
		g.fillOval(xValue, yValue, 4, 4); //��Բ
	}
	
	public static void main(String args[]){
		new TestEventMouse(); //������
	}
}
