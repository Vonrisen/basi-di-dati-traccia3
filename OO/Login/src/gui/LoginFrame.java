package gui;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;

import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.ActionEvent;

public class LoginFrame {

	public JFrame frame;
	private final String username = "admin"; 
	private final String password = "admin";
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
		ImageIcon imageLogo = new ImageIcon("src/images/Logo.png");
		
		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
		
		frame = new JFrame();
		frame.setResizable(false);
//		frame.setBounds(100, 100, 600, 800);
		frame.setSize(600,800);
		frame.setLocation(dim.width/2-frame.getSize().width/2, dim.height/2-frame.getSize().height/2); //Setta il frame a centro monitor
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
		usernameTF.setText("Inserisci l'username");
		usernameTF.setBounds(177, 65, 250, 30);
		usernameTF.setVisible(false);
		loginPanel.add(usernameTF);
		
		JPasswordField passwordTF = new RoundJPasswordField(new Color(0x771007));
		passwordTF.setText("Inserisci la password");
		passwordTF.setEchoChar((char) 0);
		passwordTF.setBounds(177, 110, 250, 30);
		passwordTF.setVisible(false);
		loginPanel.add(passwordTF);
		
		JLabel usernameImage = new JLabel();
		usernameImage.setIcon(new ImageIcon("src/images/usernameIcon.png"));
		usernameImage.setBounds(141, 66, 25, 25);
		usernameImage.setVisible(false);
		loginPanel.add(usernameImage);
		
		JLabel passwordImage = new JLabel();
		passwordImage.setIcon(new ImageIcon("src/images/passwordIcon.png"));
		passwordImage.setBounds(141, 111, 25, 25);
		passwordImage.setVisible(false);
		loginPanel.add(passwordImage);
		
		JButton adminButton = new JButton();
		adminButton.setIcon(new ImageIcon("src/images/adminButtonInactive.png"));
		adminButton.setBorder(null);
		adminButton.setBounds(322, 50, 150, 150);
		adminButton.setFocusable(false);
		adminButton.setContentAreaFilled(false);
		loginPanel.add(adminButton);
		
		JButton shopButton = new JButton();
		shopButton.setIcon(new ImageIcon("src/images/shopButtonInactive.png"));
		shopButton.setBorder(null);
		shopButton.setBounds(112 , 50, 150, 150);
		shopButton.setFocusable(false);
		shopButton.setContentAreaFilled(false);
		loginPanel.add(shopButton);
		
		JButton loginButton = new JButton();
		loginButton.setIcon(new ImageIcon("src/images/loginButtonInactive.png"));
		loginButton.setBounds(167, 170, 250, 30);
		loginButton.setBorder(null);
		loginButton.setFocusable(false);
		loginButton.setContentAreaFilled(false);
		loginButton.setVisible(false);
		loginPanel.add(loginButton);
		
		JButton homeButton = new JButton();
		homeButton.setIcon(new ImageIcon("src/images/homeButtonInactive.png"));
		homeButton.setBounds(267, 270, 50, 50);
		homeButton.setBorder(null);
		homeButton.setFocusable(false);
		homeButton.setContentAreaFilled(false);
		homeButton.setVisible(false);
		loginPanel.add(homeButton);
//		
//		JLabel lblNewLabel = new JLabel("Admin Login");
//		lblNewLabel.setForeground(new Color(0x77120b));
//		lblNewLabel.setBounds(177, 40, 119, 14);
//		loginPanel.add(lblNewLabel);
		
		//ACTIONS
		adminButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				setVisible(homeButton, adminButton, shopButton, usernameTF, passwordTF, usernameImage, passwordImage, loginButton);
				
			}
			@Override
			public void mouseEntered(MouseEvent arg0) {
				
				adminButton.setIcon(new ImageIcon("src/images/adminButtonActive.png"));
				
			}
			@Override
			public void mouseExited(MouseEvent arg0) {
				
				adminButton.setIcon(new ImageIcon("src/images/adminButtonInactive.png"));
				
			}
		});
		
		shopButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				setVisible(homeButton, adminButton, shopButton, usernameTF, passwordTF, usernameImage, passwordImage, loginButton);
				
			}
			@Override
			public void mouseEntered(MouseEvent arg0) {
				
				shopButton.setIcon(new ImageIcon("src/images/shopButtonActive.png"));
				
			}
			@Override
			public void mouseExited(MouseEvent arg0) {
				
				shopButton.setIcon(new ImageIcon("src/images/shopButtonInactive.png"));
				
			}
		});
		
		homeButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {

				setVisible(homeButton, adminButton, shopButton, usernameTF, passwordTF, usernameImage, passwordImage, loginButton);
				
			}
		});
		
		homeButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent arg0) {
				
				homeButton.setIcon(new ImageIcon("src/images/homeButtonActive.png"));
				
			}
			@Override
			public void mouseExited(MouseEvent arg0) {
				
				homeButton.setIcon(new ImageIcon("src/images/homeButtonInactive.png"));
				
			}
		});
		
		usernameTF.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent e) {
				
				if(usernameTF.getText().equals("Inserisci l'username")) {
					
					usernameTF.setText("");
					
				} else usernameTF.selectAll();
				
			}
			@Override
			public void focusLost(FocusEvent e) {
				
				if(usernameTF.getText().equals("")) {
					
					usernameTF.setText("Inserisci l'username");
					
				}
				
			}
		});
		
		passwordTF.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent e) {
				
				if(passwordTF.getText().equals("Inserisci la password")) {
					
					passwordTF.setEchoChar('•');
					passwordTF.setText("");
					
				} else passwordTF.selectAll();
				
			}
			@Override
			public void focusLost(FocusEvent e) {
				
				if(passwordTF.getText().equals("")) {
					
					passwordTF.setText("Inserisci la password");
					passwordTF.setEchoChar((char) 0);
					
				}
				
			}
		});
		
		loginButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent arg0) {
				
				loginButton.setIcon(new ImageIcon("src/images/loginButtonActive.png"));
				
			}
			@Override
			public void mouseExited(MouseEvent arg0) {
				
				loginButton.setIcon(new ImageIcon("src/images/loginButtonInactive.png"));
				
			}
		});
		
		loginButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if(!usernameTF.getText().equals(username)||!passwordTF.toString().equals(password))
					System.out.println("Username o password sbagliati, riprovare");
				else
				System.out.println("Login avvenuto con successo");
			}
		});
		
	}
	
	public void setVisible(JButton homeButton, JButton adminButton, JButton shopButton, JTextField usernameTF,
						  JPasswordField passwordTF, JLabel usernameImage, JLabel passwordImage, JButton loginButton) {
		
		if(loginButton.isShowing()) {
			homeButton.setVisible(false);
			usernameTF.setVisible(false);
			passwordTF.setVisible(false);
			loginButton.setVisible(false);
			usernameImage.setVisible(false);
			passwordImage.setVisible(false);
			adminButton.setVisible(true);
			shopButton.setVisible(true);
			
		} else {
			homeButton.setVisible(true);
			adminButton.setVisible(false);
			shopButton.setVisible(false);
			usernameTF.setVisible(true);
			passwordTF.setVisible(true);
			usernameImage.setVisible(true);
			passwordImage.setVisible(true);
			loginButton.setVisible(true);
			
		}
	}
}
