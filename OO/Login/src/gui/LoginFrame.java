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
		usernameTF.setBounds(192, 35, 250, 30);
		usernameTF.setVisible(false);
		loginPanel.add(usernameTF);
		
		JPasswordField passwordTF = new RoundJPasswordField(new Color(0x771007));
		passwordTF.setText("Inserisci la password");
		passwordTF.setEchoChar((char) 0);
		passwordTF.setBounds(192, 80, 250, 30);
		passwordTF.setVisible(false);
		loginPanel.add(passwordTF);
		
		JLabel usernameImage = new JLabel();
		usernameImage.setIcon(new ImageIcon("src/images/usernameIcon.png"));
		usernameImage.setBounds(156, 36, 25, 25);
		usernameImage.setVisible(false);
		loginPanel.add(usernameImage);
		
		JLabel passwordImage = new JLabel();
		passwordImage.setIcon(new ImageIcon("src/images/passwordIcon.png"));
		passwordImage.setBounds(156, 81, 25, 25);
		passwordImage.setVisible(false);
		loginPanel.add(passwordImage);
		
		JButton adminButton = new JButton();
		adminButton.setIcon(new ImageIcon("src/images/adminButtonInactive.png"));
		adminButton.setBackground(null);
		adminButton.setBorder(null);
		adminButton.setBounds(322, 50, 150, 150);
		adminButton.setFocusable(false);
		adminButton.setContentAreaFilled(false);
		loginPanel.add(adminButton);
		
		JButton shopButton = new JButton();
		shopButton.setIcon(new ImageIcon("src/images/shopButtonInactive.png"));
		shopButton.setBackground(null);
		shopButton.setBorder(null);
		shopButton.setBounds(112 , 50, 150, 150);
		shopButton.setFocusable(false);
		shopButton.setContentAreaFilled(false);
		loginPanel.add(shopButton);
		
		JButton loginButton = new JButton("Login");
		loginButton.setBounds(248, 177, 89, 23);
		loginPanel.add(loginButton);
		loginButton.setVisible(false);
		
		adminButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				adminButton.setIcon(new ImageIcon("src/images/shopButtonInactive.png"));
				
				try {
					
					Thread.sleep(350);
					
				} catch (InterruptedException e1) {
					
					Thread.currentThread().interrupt();
					
				}
				
				adminButton.setVisible(false);
				shopButton.setVisible(false);
				usernameTF.setVisible(true);
				passwordTF.setVisible(true);
				usernameImage.setVisible(true);
				passwordImage.setVisible(true);
				loginButton.setVisible(true);
				
			}
		});
		
		shopButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				try {
					
					Thread.sleep(350);
					
				} catch (InterruptedException e1) {
					
					e1.printStackTrace();
					
				}
				
				adminButton.setVisible(false);
				shopButton.setVisible(false);
				usernameTF.setVisible(true);
				passwordTF.setVisible(true);
				usernameImage.setVisible(true);
				passwordImage.setVisible(true);
				loginButton.setVisible(true);
				
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
