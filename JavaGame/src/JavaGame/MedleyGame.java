package JavaGame;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;

public class MedleyGame extends JFrame {
	private JLabel modelLabel;
	private JPanel centerPanel;
	private JButton emptyButton;
	int num = 0;
	public static void main(String[] args) {
		try {
			MedleyGame frame = new MedleyGame();
			frame.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//�������ڹ��췽��
	public MedleyGame() {
		super();
		setResizable(false);
		setTitle("ƴͼ��Ϸ");
		setBounds(100, 100, 370, 525);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//���������󣬲����ӱ߿򡢲���
		final JPanel topPanel = new JPanel();
		topPanel.setBorder(new TitledBorder(null, "", TitledBorder.DEFAULT_JUSTIFICATION,
				TitledBorder.DEFAULT_POSITION, null, null));
		topPanel.setLayout(new BorderLayout());
		getContentPane().add(topPanel, BorderLayout.NORTH);//�����Ϸ�
		//������ǩ��ԭͼ
		modelLabel = new JLabel();
		modelLabel.setIcon(new ImageIcon("image/"+ num+ "model.jpg"));
		topPanel.add(modelLabel, BorderLayout.WEST);
		//���Ҳ�Ӹ���壬����������ť
		JPanel eastPanel = new JPanel();
		topPanel.add(eastPanel,BorderLayout.CENTER);
		eastPanel.setLayout(new BorderLayout());
		JButton nextButton = new JButton();
		nextButton.setText("��һ��");
		nextButton.addActionListener(new NextButtonAction());
		eastPanel.add(nextButton,BorderLayout.NORTH);
		//������ť�������Ӽ���
		final JButton startButton = new JButton();
		startButton.setText("����");
		startButton.addActionListener(new StartButtonAction());
		eastPanel.add(startButton, BorderLayout.CENTER);
		//��ʼ��������壬���ñ߿����Ӱ�ť
		centerPanel = new JPanel();
		centerPanel.setBorder(new TitledBorder(null, "", TitledBorder.DEFAULT_JUSTIFICATION,
				TitledBorder.DEFAULT_POSITION, null, null));
		centerPanel.setLayout(new GridLayout(4, 0));
		getContentPane().add(centerPanel, BorderLayout.CENTER);
		//��ʼ��ͼƬ
		String[][] exactnessOrder = order();
		//���������Ӱ�ť������ͼƬ
		for (int row=0; row<4; row++) {
			for (int col=0; col<4; col++) {
				final JButton button = new JButton();
				button.setName(row+""+col);
				button.setIcon(new ImageIcon(exactnessOrder[row][col]));
				if (exactnessOrder[row][col].equals("image/"+ num+"00.jpg"))
					emptyButton = button;
				button.addActionListener(new ImgButtonAction());
				centerPanel.add(button);
			}
		}
	}
	//��ʼ��ͼƬ
	private String[][] order() {
		String[][] exactnessOrder = new String[4][4];
		for (int row=0; row<4; row++) {
			for (int col=0; col<4; col++) {
				exactnessOrder[row][col] = "image/"+ num+ row+ col+ ".jpg"; 
			}
		}
		return exactnessOrder;
	}
	//�������ͼƬ
	private String[][] reorder() {
		String[][] exactnessOrder = new String[4][4];
		for (int row=0; row<4; row++) {
			for (int col=0; col<4; col++) {
				exactnessOrder[row][col] = "image/"+ num+ row+ col+ ".jpg"; 
			}
		}
		String[][] stochasticOrder = new String[4][4];
		for (int row=0; row<4; row++) {
			for (int col=0; col<4; col++) {
				while (stochasticOrder[row][col]==null) {
					int r = (int) (Math.random()*4);
					int c = (int) (Math.random()*4);
					if (exactnessOrder[r][c] != null) {
						stochasticOrder[row][col] = exactnessOrder[r][c];
						exactnessOrder[r][c] = null;
					}
				}
			}
		}
		return stochasticOrder;
	}
	//��Ϸʱ����ͼƬ
	class ImgButtonAction implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			String emptyName= emptyButton.getName();
			char emptyRow = emptyName.charAt(0);
			char emptyCol = emptyName.charAt(1);
			JButton clickButton = (JButton) e.getSource();
			String clickName = clickButton.getName();
			char clickRow = clickName.charAt(0);
			char clickCol = clickName.charAt(1);
			if (Math.abs(clickRow - emptyRow) + Math.abs(clickCol - emptyCol) == 1) {
				emptyButton.setIcon(clickButton.getIcon());
				clickButton.setIcon(new ImageIcon("image/"+ num+ "00.jpg"));
				emptyButton = clickButton;
			}
		}
	}
	//����һ��ͼƬ
	class NextButtonAction implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if (num==5) {
				num=0;
			} else {
				++num;
			}
			modelLabel.setIcon(new ImageIcon("image/"+num+"model.jpg"));
			String[][] exactnessOrder = order();
			int i= 0;
			for (int row=0; row<4; row++) {
				for (int col=0; col<4; col++) {
					JButton button = (JButton) centerPanel.getComponent(i++);
					button.setIcon(new ImageIcon(exactnessOrder[row][col]));
					if(exactnessOrder[row][col].equals("image/"+ num+ "00.jpg"))
						emptyButton=button;
				}
			}
		}
	}
	//��������ͼƬ
	class StartButtonAction implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			String[][] stochasticOrder = reorder();
			int i= 0;
			for (int row=0; row<4; row++) {
				for (int col=0; col<4; col++) {
					JButton button = (JButton) centerPanel.getComponent(i++);
					button.setIcon(new ImageIcon(stochasticOrder[row][col]));
					if(stochasticOrder[row][col].equals("image/"+ num+ "00.jpg"))
						emptyButton=button;
				}
			}
		}
	}
}