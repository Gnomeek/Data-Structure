package com.game.view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Window extends JFrame {

    private static int score = 0; //����
    final Font[] fonts = {new Font("Helvetica Neue", Font.BOLD, 33)
            , new Font("Helvetica Neue", Font.BOLD, 27)
            , new Font("Helvetica Neue", Font.BOLD, 21)
            , new Font("Helvetica Neue", Font.BOLD, 15)
            , new Font("Helvetica Neue", Font.BOLD, 10)
    };

    private GameBoard gameBoard;
    private JLabel ltitle;
    private JLabel lsctip;
    private JLabel lscore;
    private JLabel lgatip;

    public Window() {
        this.setLayout(null);
    }

    public void initView() {
        //logo
    	ltitle = new JLabel("PhD", JLabel.CENTER);
        ltitle.setFont(new Font("", Font.BOLD, 50));
        ltitle.setForeground(new Color(0x776e65));
        ltitle.setBounds(0, 0, 120, 60);
        //�Ʒְ�
        lsctip = new JLabel("Hair Loss", JLabel.CENTER);
        lsctip.setFont(new Font("", Font.BOLD, 16));
        lsctip.setForeground(new Color(0xeee4da));
        lsctip.setOpaque(true);//ֻ������Ϊtrue����ɫ����Ч
        lsctip.setBackground(new Color(0xbbada0));
        lsctip.setBounds(290, 5, 100, 25);

        lscore = new JLabel("0", JLabel.CENTER);
        lscore.setFont(new Font("Helvetica Neue", Font.BOLD, 22));
        lscore.setForeground(Color.WHITE);
        lscore.setOpaque(true);
        lscore.setBackground(new Color(0xbbada0));
        lscore.setBounds(290, 30, 100, 25);
        //����
        lgatip = new JLabel("Use���� �� �� ���� to control movement ,��Esc�� for restart", JLabel.CENTER);
        lgatip.setFont(new Font("Helvetica Neue", Font.BOLD, 13));
        lgatip.setForeground(new Color(0x776e65));
        lgatip.setBounds(10, 60, 390, 30);
        //��Ϸ������
        gameBoard = new GameBoard();
        gameBoard.setPreferredSize(new Dimension(400, 400));
        gameBoard.setBackground(new Color(0xbbada0));
        gameBoard.setBounds(0, 100, 400, 400);
        gameBoard.setFocusable(true);
        //��������봰��
        this.add(ltitle);
        this.add(lsctip);
        this.add(lscore);
        this.add(lgatip);
        this.add(gameBoard);
    }

    class GameBoard extends JPanel implements KeyListener {
        private static final int GAP_TILE = 16; //��Ƭ֮���϶
        private static final int ARC_TILE = 0; //��ƬԲ�ǻ���
        private static final int SIZE_TILE = 80;//��Ƭ�Ĵ�С

        private Tile[][] tiles = new Tile[4][4];
        private boolean isOver;
        private boolean isMove;

        public GameBoard() {
            initGame();
            addKeyListener(this);
        }

        @Override
        public void keyPressed(KeyEvent e) {
            boolean moved = false;
            switch (e.getKeyCode()) {
                case KeyEvent.VK_ESCAPE:
                    initGame();
                    break;
                case KeyEvent.VK_LEFT:
                    moved = moveLeft();
                    inovkeCreateTile();
                    checkGameOver(moved);
                    break;
                case KeyEvent.VK_RIGHT:
                    moved = moveRight();
                    inovkeCreateTile();
                    checkGameOver(moved);
                    break;
                case KeyEvent.VK_UP:
                    moved = moveUp();
                    inovkeCreateTile();
                    checkGameOver(moved);
                    break;
                case KeyEvent.VK_DOWN:
                    moved = moveDown();
                    inovkeCreateTile();
                    checkGameOver(moved);
                    break;
            }
            repaint();
        }

        private void initGame() {
            //��ʼ����ͼ
            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4; j++) {
                    tiles[i][j] = new Tile();
                }
            }
            //����������Ƭ
            createTile();
            createTile();

            isMove = false;
            isOver = false;
        }

        private void createTile() {
            //��ȡ��ǰ�հ׵���Ƭ���������б�
            List<Tile> list = getBlankTiles();
            if (!list.isEmpty()) {
                Random random = new Random();
                int index = random.nextInt(list.size());
                Tile tile = list.get(index);
                //��ʼ������Ƭ��ֵΪ2��4
                tile.value = random.nextInt(100) > 50 ? 4 : 2;
            }
        }

        /**
         * ��ȡ��ǰ�հ׵���Ƭ�������б���
         *
         * @return
         */
        private List<Tile> getBlankTiles() {
            List<Tile> list = new ArrayList<Tile>();
            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4; j++) {
                    if (tiles[i][j].value == 0) {
                        list.add(tiles[i][j]);
                    }
                }
            }
            return list;
        }

        private void inovkeCreateTile(){
            if(isMove){
                createTile();
                isMove = false;
            }
        }

        private void checkGameOver(boolean moved) {
            lscore.setText(score + "");
            if (!getBlankTiles().isEmpty()) {
                return;
            }
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    //�ж��Ƿ���ڿɺϲ���������Ƭ
                    if (tiles[i][j].value == tiles[i][j + 1].value || tiles[i][j].value == tiles[i + 1][j].value) {
                        isOver = false;
                        return;
                    }
                }
            }
            isOver = true;
        }

        private boolean moveLeft() {
            isMove = false;
            for (int i = 0; i < 4; i++) {
                for (int j = 1; j < 4; j++) {
                    int k = j;
                    //��ǰ�ƶ���Ƭ���ܵ���߽磬����Ϊ�հ���Ƭ��ǰ����Ƭ�����Ǻϳ���Ƭ
                    while (k > 0 && tiles[i][k].value != 0 && !tiles[i][k - 1].ismerge) {
                        if (tiles[i][k - 1].value == 0) {
                            doMove(tiles[i][k], tiles[i][k - 1]);
                        } else if (tiles[i][k - 1].value == tiles[i][k].value) {
                            doMerge(tiles[i][k], tiles[i][k - 1]);
                            break;
                        } else {
                            break;
                        }
                        k--;
                    }
                }
            }
            return isMove;
        }

        private boolean moveRight() {
            isMove = false;
            for (int i = 0; i < 4; i++) {
                for (int j = 2; j > -1; j--) {
                    int k = j;
                    //��ǰ�ƶ���Ƭ���ܵ���߽磬����Ϊ�հ���Ƭ��ǰ����Ƭ�����Ǻϳ���Ƭ
                    while (k < 3 && tiles[i][k].value != 0 && !tiles[i][k + 1].ismerge) {
                        if (tiles[i][k + 1].value == 0) {
                            doMove(tiles[i][k], tiles[i][k + 1]);
                        } else if (tiles[i][k + 1].value == tiles[i][k].value) {
                            doMerge(tiles[i][k], tiles[i][k + 1]);
                            break;
                        } else {
                            break;
                        }
                        k++;
                    }
                }
            }
            return isMove;
        }

        private boolean moveUp() {
            isMove = false;
            for (int j = 0; j < 4; j++) {
                for (int i = 1; i < 4; i++) {
                    int k = i;
                    //��ǰ�ƶ���Ƭ���ܵ���߽磬����Ϊ�հ���Ƭ��ǰ����Ƭ�����Ǻϳ���Ƭ
                    while (k > 0 && tiles[k][j].value != 0 && !tiles[k - 1][j].ismerge) {
                        if (tiles[k - 1][j].value == 0) {
                            doMove(tiles[k][j], tiles[k - 1][j]);
                        } else if (tiles[k - 1][j].value == tiles[k][j].value) {
                            doMerge(tiles[k][j], tiles[k - 1][j]);
                            break;
                        } else {
                            break;
                        }
                        k--;
                    }
                }
            }
            return isMove;
        }

        private boolean moveDown() {
            isMove = false;
            for (int j = 0; j < 4; j++) {
                for (int i = 2; i > -1; i--) {
                    int k = i;
                    //��ǰ�ƶ���Ƭ���ܵ���߽磬����Ϊ�հ���Ƭ��ǰ����Ƭ�����Ǻϳ���Ƭ
                    while (k < 3 && tiles[k][j].value != 0 && !tiles[k + 1][j].ismerge) {
                        if (tiles[k + 1][j].value == 0) {
                            doMove(tiles[k][j], tiles[k + 1][j]);
                        } else if (tiles[k + 1][j].value == tiles[k][j].value) {
                            doMerge(tiles[k][j], tiles[k + 1][j]);
                            break;
                        } else {
                            break;
                        }
                        k++;
                    }
                }
            }
            return isMove;
        }

        private void doMove(Tile src, Tile dst) {
            dst.swap(src);
            src.clear();
            isMove = true;
        }

        private void doMerge(Tile src, Tile dst) {
            dst.value = dst.value << 1;
            dst.ismerge = true;
            src.clear();
            score += dst.value;
            isMove = true;
        }

        @Override
        public void paint(Graphics g) {
            super.paint(g);
            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4; j++) {
                    drawTile(g, i, j);
                }
            }
            if (isOver) {
                g.setColor(new Color(255, 255, 255, 180));
                g.fillRect(0, 0, getWidth(), getHeight());
                g.setColor(new Color(0x3d79ca));
                g.setFont(fonts[0]);
                FontMetrics fms = getFontMetrics(fonts[0]);
                String value = "Game Over";
                g.drawString(value, (getWidth() - fms.stringWidth(value)) / 2, getHeight() / 2);
            }

        }

        private void drawTile(Graphics gg, int i, int j) {
            Graphics2D g = (Graphics2D) gg;
            g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);
            g.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL,
                    RenderingHints.VALUE_STROKE_NORMALIZE);
            Tile tile = tiles[i][j];
            //������Ƭ����
            g.setColor(tile.getBackground());
            //ע�⣺��������j����,��������i����
            g.fillRoundRect(GAP_TILE + (GAP_TILE + SIZE_TILE) * j ,
                    GAP_TILE + (GAP_TILE + SIZE_TILE) * i ,
                    SIZE_TILE , SIZE_TILE , ARC_TILE, ARC_TILE);
            //������Ƭ����
            g.setColor(tile.getForeground());
            Font font = tile.getTileFont();
            g.setFont(font);
            FontMetrics fms = getFontMetrics(font);
            String value = changeName(tile.value);
            //ע�⣺��������j����,��������i����
            g.drawString(value, GAP_TILE + (GAP_TILE + SIZE_TILE) * j
                    + (SIZE_TILE - fms.stringWidth(value)) / 2
                    , GAP_TILE + (GAP_TILE + SIZE_TILE) * i
                    + (SIZE_TILE - fms.getAscent() - fms.getDescent()) / 2
                    + fms.getAscent());
            tiles[i][j].ismerge = false;
        }

        @Override
        public void keyTyped(KeyEvent e) {

        }

        @Override
        public void keyReleased(KeyEvent e) {

        }
    }

    class Tile {
        public int value;//��ʾ������
        public boolean ismerge;//�Ƿ��Ǻϲ���

        public Tile() {
            clear();
        }

        public void clear() {
            value = 0;
            ismerge = false;
        }

        public void swap(Tile tile) {
            this.value = tile.value;
            this.ismerge = tile.ismerge;
        }

        public Color getForeground() {
            switch (value) {
                case 0:
                    return new Color(0xcdc1b4);
                case 2:
                case 4:
                    return new Color(0x776e65);
                default:
                    return new Color(0xf9f6f2);
            }
        }

        public Color getBackground() {
            switch (value) {
                case 0:
                    return new Color(0xcdc1b4);
                case 2:
                    return new Color(0xeee4da);
                case 4:
                    return new Color(0xede0c8);
                case 8:
                    return new Color(0xf2b179);
                case 16:
                    return new Color(0xf59563);
                case 32:
                    return new Color(0xf67c5f);
                case 64:
                    return new Color(0xf65e3b);
                case 128:
                    return new Color(0xedcf72);
                case 256:
                    return new Color(0xedcc61);
                case 512:
                    return new Color(0xedc850);
                case 1024:
                    return new Color(0xedc53f);
                case 2048:
                    return new Color(0xedc22e);
                case 4096:
                    return new Color(0x65da92);
                case 8192:
                    return new Color(0x5abc65);
                case 16384:
                    return new Color(0x248c51);
                default:
                    return new Color(0x248c51);
            }
        }
        
        public Font getTileFont() {
            int index = 0;
            if(value==2||value==4)
            	index=2;
            else if(value==32||value==64||value==2||value==2)
            	index=4;
            else if(value==128||value==512)
            	index=3;
            else if(value==8||value==16||value==256||value==1024||value==2048||value==4096)
            	index=1;
            return fonts[index];
        }
    }
	public String changeName(int string){
		String change = null;
		switch(string){
		case 2:change="Coffee";break;
		case 4:change="Panini";break;
		case 8:change="Idea";break;
		case 16:change="Code";break;
		case 32:change="Deep Learning";break;
		case 64:change="Meet Supervisor";break;
		case 128:change="Experiment";break;
		case 256:change="Paper";break;
		case 512:change="Conference";break;
		case 1024:change="Viva";break;
		case 2048:change="Phd";break;
		case 4096:change="Die";break;
		case 0:change="";break;
	//	default: change=null;break;
		}return change;
	}
}
