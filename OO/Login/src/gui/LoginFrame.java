package gui;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;

import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;

import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JLabel;
import javax.swing.JTextField;

import controllers.LoginController;

import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.SQLException;
import java.awt.event.ActionListener;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.ActionEvent;

public class LoginFrame extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Connection connection;
	public JFrame frame;
	JPanel topPanel;
	JLabel logoLabel;
	JPanel loginPanel;
	JTextField usernameTF;
	JPasswordField passwordTF;
	JLabel usernameImage;
	JLabel passwordImage;
	JButton loginButton;
	JButton adminButton;
	JButton shopButton;
	JButton homeButton;
	ImageIcon logoImage;
	ImageIcon homeButtonActive;
	ImageIcon adminButtonActive;
	ImageIcon shopButtonActive;
	ImageIcon usernameIcon;
	ImageIcon passwordIcon;
	ImageIcon adminButtonInactive;
	ImageIcon shopButtonInactive;
	ImageIcon homeButtonInactive;
	ImageIcon loginButtonActive;
	ImageIcon loginButtonInactive;
	Dimension dim;
	JTable table;
	JScrollPane scrollPane;
	private final String username = "admin";
	private final String password = "admin";

	/**
	 * Create the application.
	 */
	public LoginFrame(Connection connection) {
		this.connection=connection;
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {

		// IMAGES INITIALIZER


		logoImage = new ImageIcon("src/images/logo.png");
		adminButtonActive = new ImageIcon("src/images/adminButtonActive.png");
		adminButtonInactive = new ImageIcon("src/images/adminButtonInactive.png");
		homeButtonActive = new ImageIcon("src/images/homeButtonActive.png");
		homeButtonInactive = new ImageIcon("src/images/homeButtonInactive.png");
		shopButtonActive = new ImageIcon("src/images/shopButtonActive.png");
		shopButtonInactive = new ImageIcon("src/images/shopButtonInactive.png");
		loginButtonActive = new ImageIcon("src/images/loginButtonActive.png");
		loginButtonInactive = new ImageIcon("src/images/loginButtonInactive.png");
		usernameIcon = new ImageIcon("src/images/usernameIcon.png");
		passwordIcon = new ImageIcon("src/images/passwordIcon.png");
		dim = Toolkit.getDefaultToolkit().getScreenSize();

		// FRAME INITIALIZER
		frame = new JFrame();
		frame.setResizable(false);
		frame.setBounds(100, 100, 600, 800);
		frame.setSize(600, 800);
		frame.setLocation(dim.width / 2 - frame.getSize().width / 2, dim.height / 2 - frame.getSize().height / 2); // Setta
																													// il
																													// frame
																													// a
																													// centro
																												// monitor
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.getContentPane().setBackground(new Color(0xf3ecd7));

		// PANELS INITIALIZER
		topPanel = new JPanel();
		topPanel.setBounds(0, 0, 584, 400);
		topPanel.setBackground(null);
		topPanel.setLayout(new BorderLayout());
		frame.getContentPane().add(topPanel);

		loginPanel = new JPanel();
		loginPanel.setBounds(0, 401, 584, 512);
		loginPanel.setBackground(null);
		frame.getContentPane().add(loginPanel);
		loginPanel.setLayout(null);
		loginPanel.setBounds(0, 401, 584, 512);
		loginPanel.setBackground(null);
		frame.getContentPane().add(loginPanel);
		loginPanel.setLayout(null);

		// LABELS INITIALIZER
		logoLabel = new JLabel();
		logoLabel.setIcon(logoImage);
		logoLabel.setHorizontalAlignment(JLabel.CENTER);
		topPanel.add(logoLabel);

		usernameImage = new JLabel();
		usernameImage.setIcon(usernameIcon);
		usernameImage.setBounds(141, 66, 25, 25);
		usernameImage.setVisible(false);
		loginPanel.add(usernameImage);

		passwordImage = new JLabel();
		passwordImage.setIcon(passwordIcon);
		passwordImage.setBounds(141, 111, 25, 25);
		passwordImage.setVisible(false);
		loginPanel.add(passwordImage);

		// USERNAME TEXF FIELD INITIALIZER
		usernameTF = new RoundJTextField(new Color(0x771007));
		usernameTF.setText("Username");
		usernameTF.setBounds(177, 65, 250, 30);
		usernameTF.setVisible(false);
		loginPanel.add(usernameTF);

		// PASSWORD TEXT FIELD INITIALIZER
		passwordTF = new RoundJPasswordField(new Color(0x771007));
		passwordTF.setText("Password");
		passwordTF.setEchoChar((char) 0);
		passwordTF.setBounds(177, 110, 250, 30);
		passwordTF.setVisible(false);
		loginPanel.add(passwordTF);

		// BUTTONS INITIALIZER
		adminButton = new JButton();
		adminButton.setIcon(adminButtonInactive);
		adminButton.setBorder(null);
		adminButton.setBounds(322, 50, 150, 150);
		adminButton.setFocusable(false);
		adminButton.setContentAreaFilled(false);
		loginPanel.add(adminButton);

		shopButton = new JButton();
		shopButton.setIcon(shopButtonInactive);
		shopButton.setBorder(null);
		shopButton.setBounds(112, 50, 150, 150);
		shopButton.setFocusable(false);
		shopButton.setContentAreaFilled(false);
		loginPanel.add(shopButton);

		loginButton = new JButton();
		loginButton.setIcon(loginButtonInactive);
		loginButton.setBounds(167, 170, 250, 30);
		loginButton.setBorder(null);
		loginButton.setFocusable(false);
		loginButton.setContentAreaFilled(false);
		loginButton.setVisible(false);
		loginPanel.add(loginButton);

		homeButton = new JButton();
		homeButton.setIcon(homeButtonInactive);
		homeButton.setBounds(267, 270, 50, 50);
		homeButton.setBorder(null);
		homeButton.setFocusable(false);
		homeButton.setContentAreaFilled(false);
		homeButton.setVisible(false);
		loginPanel.add(homeButton);

		// JSCROLLPANE INITIALIZER
		scrollPane = new JScrollPane();
		scrollPane.setBounds(123, 68, 372, 238);
		loginPanel.add(scrollPane);
		scrollPane.setVisible(false);
		scrollPane.setBorder(BorderFactory.createEmptyBorder());

		// JTABLE INITIALIZER
		table = new JTable();
		scrollPane.setViewportView(table);

		// ACTIONS
		adminButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent click_su_adminButton) {

				homeButton.setVisible(true);
				shopButton.setVisible(false);
				usernameTF.setVisible(true);
				passwordTF.setVisible(true);
				usernameImage.setVisible(true);
				passwordImage.setVisible(true);
				loginButton.setVisible(true);
				adminButton.setVisible(false);
			}

			@Override
			public void mouseEntered(MouseEvent cursore_su_adminButton) {

				adminButton.setIcon(adminButtonActive);

			}

			@Override
			public void mouseExited(MouseEvent cursore_fuori_adminButton) {

				adminButton.setIcon(adminButtonInactive);

			}
		});

		shopButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent click_su_shopButton) {

				homeButton.setVisible(true);
				adminButton.setVisible(false);
				shopButton.setVisible(false);
				usernameTF.setVisible(true);
				passwordTF.setVisible(true);
				usernameImage.setVisible(true);
				passwordImage.setVisible(true);
				loginButton.setVisible(true);
			}

			@Override
			public void mouseEntered(MouseEvent cursore_su_shopButton) {

				shopButton.setIcon(shopButtonActive);

			}

			@Override
			public void mouseExited(MouseEvent cursore_fuori_shopButton) {

				shopButton.setIcon(shopButtonInactive);

			}
		});

		homeButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent click_su_shopButton) {

				homeButton.setVisible(false);
				usernameTF.setVisible(false);
				passwordTF.setVisible(false);
				loginButton.setVisible(false);
				usernameImage.setVisible(false);
				passwordImage.setVisible(false);
				adminButton.setVisible(true);
				shopButton.setVisible(true);
				usernameTF.setText("Username");
				passwordTF.setText("Password");
			}
		});

		homeButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent cursore_su_homeButton) {

				homeButton.setIcon(homeButtonActive);

			}

			@Override
			public void mouseExited(MouseEvent cursore_fuori_homeButton) {

				homeButton.setIcon(homeButtonInactive);

			}
		});

		loginButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent cursore_su_loginButton) {

				loginButton.setIcon(loginButtonActive);

			}

			@Override
			public void mouseExited(MouseEvent cursore_fuori_loginButton) {

				loginButton.setIcon(new ImageIcon("src/images/loginButtonInactive.png"));

			}
		});

		loginButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent validazione_credenziali_admin) {
				if (!usernameTF.getText().equals(username) || !passwordTF.getText().equals(password))
					System.out.println("Username o password sbagliati, riprovare");
				else
				{
					System.out.println("Login avvenuto con successo");
					LoginController login_controller = new LoginController(connection,frame);
					try {
						login_controller.displayShops(connection, frame);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		});
		usernameTF.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent e) {

				if (usernameTF.getText().equals("Username"))
					usernameTF.setText("");

			}

			@Override
			public void focusLost(FocusEvent e) {

				if (usernameTF.getText().equals(""))

					usernameTF.setText("Username");
			}
		});

		passwordTF.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent e) {

				if (passwordTF.getText().equals("Password")) {

					passwordTF.setEchoChar('•');
					passwordTF.setText("");
				}

			}

			@Override
			public void focusLost(FocusEvent e) {

				if (passwordTF.getText().equals("")) {

					passwordTF.setText("Password");
					passwordTF.setEchoChar((char) 0);
				}
			}
		});
	}
}
