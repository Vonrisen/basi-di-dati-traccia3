package gui;
import java.awt.EventQueue;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.Color;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;


public class LoginFrame {

	public JFrame frame;
	private final String username = "admin456"; 
	private final String password = "passwordadmin123";
	/**
	 * Create the application.
	 */
	public LoginFrame() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		
		ImageIcon imageLogo = new ImageIcon("src/Logo.png");
		ImageIcon adminButtonImage = new ImageIcon("src/adminButtonInactive.png");
		ImageIcon shopButtonImage = new ImageIcon("src/shopButtonInactive.png");
		
		frame = new JFrame();
		frame.setResizable(false);
		frame.setBounds(100, 100, 600, 800);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		frame.getContentPane().setBackground(new Color(0xf3ecd7));
		
		JPanel topPanel = new JPanel();
		topPanel.setBounds(0, 0, 584, 400);
		topPanel.setBackground(null);
		topPanel.setLayout(new BorderLayout());
		frame.getContentPane().add(topPanel);
		
		JLabel logoLabel = new JLabel();
		logoLabel.setIcon(imageLogo);
		logoLabel.setHorizontalAlignment(JLabel.CENTER);
		topPanel.add(logoLabel);
		
		JPanel loginPanel = new JPanel();
		loginPanel.setBounds(0, 401, 584, 512);
		loginPanel.setBackground(null);
		frame.getContentPane().add(loginPanel);
		loginPanel.setLayout(null);
		
		JTextField usernameTF = new RoundJTextField(new Color(0x771007));
		JTextField passwordTF = new RoundJTextField(new Color(0x771007));
	
		usernameTF.setBounds(167, 35, 250, 30);
		passwordTF.setBounds(167, 103, 250, 30);
		loginPanel.add(usernameTF);
		loginPanel.add(passwordTF);
		usernameTF.setVisible(false);
		passwordTF.setVisible(false);
		
		JButton adminButton = new JButton();
		JButton shopButton = new JButton();
		JButton loginButton = new JButton("Login");
		
		adminButton.setIcon(adminButtonImage);
		adminButton.setBackground(null);
		adminButton.setBorder(null);
		adminButton.setBounds(102 , 50, 150, 150);
		adminButton.setFocusable(false);
		adminButton.setContentAreaFilled(false);
		loginPanel.add(adminButton);
		
		
		shopButton.setIcon(shopButtonImage);
		shopButton.setBackground(null);
		shopButton.setBorder(null);
		shopButton.setBounds(322, 50, 150, 150);
		shopButton.setFocusable(false);
		shopButton.setContentAreaFilled(false);
		loginPanel.add(shopButton);
	
		loginButton.setBounds(248, 177, 89, 23);
		loginPanel.add(loginButton);
		loginButton.setVisible(false);
		
		adminButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				adminButton.setVisible(false);
				shopButton.setVisible(false);
				usernameTF.setVisible(true);
				passwordTF.setVisible(true);
				loginButton.setVisible(true);
			}
		});
		loginButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if(!usernameTF.getText().equals(username)||!passwordTF.getText().equals(password))
					System.out.println("Username o password sbagliati, riprovare");
				else
				System.out.println("Login avvenuto con successo");
			}
		});

		
	}
}
