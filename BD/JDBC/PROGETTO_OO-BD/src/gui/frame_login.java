package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import dao_impl.UtenteDAOPostgresimpl;
import daos.UtenteDAO;
import entities.Utente;
import javax.swing.JTextField;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.awt.event.ActionEvent;

public class frame_login extends JFrame {

	private JPanel contentPane;
	private JTextField emailTF;
	private JTextField passwordTF;
	private JTextField login_alertTF;
	/**
	 * Create the frame.
	 */
	public frame_login(UtenteDAO dao) {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 733, 474);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		emailTF = new JTextField();
		emailTF.setBounds(269, 93, 218, 31);
		contentPane.add(emailTF);
		emailTF.setColumns(10);
		
		passwordTF = new JTextField();
		passwordTF.setColumns(10);
		passwordTF.setBounds(269, 170, 218, 31);
		contentPane.add(passwordTF);
		
		JLabel emailLabel = new JLabel("Email: ");
		emailLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		emailLabel.setBounds(188, 97, 108, 19);
		contentPane.add(emailLabel);
		
		JLabel passwordLabel = new JLabel("Password:");
		passwordLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		passwordLabel.setBounds(188, 178, 108, 19);
		contentPane.add(passwordLabel);
		
		JButton loginButton = new JButton("Login");
		loginButton.setToolTipText("");
		loginButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					  boolean login = dao.validaLoginUtente(emailTF.getText(), passwordTF.getText());
					  if(login)
						login_alertTF.setText("Login avvenuto");
					  else
						login_alertTF.setText("Credenziali errate");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		});
		loginButton.setFont(new Font("Tahoma", Font.BOLD, 14));
		loginButton.setBounds(517, 338, 89, 31);
		contentPane.add(loginButton);
		login_alertTF = new JTextField();
		login_alertTF.setFont(new Font("Tahoma", Font.BOLD, 14));
		login_alertTF.setColumns(10);
		login_alertTF.setBounds(269, 338, 218, 31);
		contentPane.add(login_alertTF);
	}
}
