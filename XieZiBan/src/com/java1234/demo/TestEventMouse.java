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
//可能有时候程序运行后什么也没有，你需要鼠标在屏幕上移动下才能出现按钮，
//至于为什么，本鸟不懂～～以后有待研究
//######################################
public class TestEventMouse extends JFrame{  //主类，继承JFrame类，因为要用到paint()方法，所以
	//必须继承一个Frame类，否则我这个初学者还没学到其他可以调用paint()的方法
	Container contentPanel; //内容格引用
	JButton b1,b2,b3,b4,b5;//这是五个按钮
	JRadioButton backGroundRadio,foreGroundRadio;  //定义两个单选框
	ButtonGroup radioGroup;  //单选按钮组
	int xValue,yValue;  //保留鼠标位置（x,y）
	JFrame jf=this;//把当前对象赋值给jf，因为我后来调代码的时候发现，背景色是内容格或者说是其它组件
	//来管理的，Frame框架类是不管理背景色的；但是我之所以要获取JFrame的对象，是因为前景色只有框架类
	//能够管理，其它的组件没有资格来管理；后面做事件处理的话，你会发现
	
	public TestEventMouse(){ //构造函数
		super("08计本 曹锋--模拟写字板");
		b1=new JButton("Black");//实现五个按钮
		b2=new JButton("Blue");
		b3=new JButton("Red");
		b4=new JButton("White");
		b5=new JButton("Yellow");
		contentPanel=this.getContentPane();//获取内容格
		contentPanel.setLayout(new FlowLayout());//设置内容格的布局管理器
		
		backGroundRadio=new JRadioButton("backGround"); //实例化复选框
		foreGroundRadio=new JRadioButton("foreGround");
		
		contentPanel.add(backGroundRadio);//添加到内容格里面去
		contentPanel.add(foreGroundRadio);
		
		contentPanel.add(b1);//添加按钮
		contentPanel.add(b2);
		contentPanel.add(b3);
		contentPanel.add(b4);
		contentPanel.add(b5);
		
		MouseListenerHandler mou=new MouseListenerHandler(); //实现一个事件监听类
		b1.addMouseListener(mou); //注册为五个按钮的监听者
		b2.addMouseListener(mou);
		b3.addMouseListener(mou);
		b4.addMouseListener(mou);
		b5.addMouseListener(mou);
		
		radioGroup=new ButtonGroup(); //实例单选按钮组
		radioGroup.add(backGroundRadio);//将两个radio按钮构成一个组
		radioGroup.add(foreGroundRadio);
		
		
		addMouseMotionListener(  //匿名类
				new MouseMotionAdapter(){  //因为是当前一个对象调用，所以搞了个适配器玩玩
					public void mouseDragged(MouseEvent e){
						xValue=e.getX();
						yValue=e.getY();
						repaint();  //调用paint()方法
					}
				}
				);
		setSize(1000,500);  //要搞就要搞大的
		setVisible(true);  //设置可见
	}
	
	public class MouseListenerHandler implements MouseListener{  //鼠标事件监听类
		public void mousePressed(MouseEvent e){  //其实只有一个有用的，就是鼠标点击事件
			                                     //因为要监听的对象比较多，所以用适配器不好
			if(e.getSource()==b1){   //用getSouce()获取对象
				if(backGroundRadio.isSelected())
					contentPanel.setBackground(Color.BLACK);//重点来了，用内容格来设置背景色
				else                                 //#####################
					jf.setForeground(Color.BLACK);   //用Frame框架来设置前景色
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
		public void mouseClicked(MouseEvent e) {	//下面东西没用，但是作为接口方法，空实现下	
		}
		public void mouseEntered(MouseEvent e) {		
		}
		public void mouseExited(MouseEvent e) {		
		}
		public void mouseReleased(MouseEvent e) {		
		}
}
	
	
	public void paint(Graphics g){  //画些小圆，来迷惑人的肉眼，呵呵
		g.fillOval(xValue, yValue, 4, 4); //画圆
	}
	
	public static void main(String args[]){
		new TestEventMouse(); //匿名类
	}
}
