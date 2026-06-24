import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class StudentCRUDApp extends JFrame {

    private static final String URL = "jdbc:mysql://localhost:3306/testdb";
    private static final String USER = "root";
    private static final String PASS = "12345";
    private JTextField txtId, txtName, txtDept;
    private JTable table;
    private DefaultTableModel model;
    private Connection con;

    public StudentCRUDApp() {
        setTitle("Student Management System");
        setSize(700, 500);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        connectDB();

        // Form Panel
        JPanel panel = new JPanel(new GridLayout(4, 2, 10, 10));

        panel.add(new JLabel("ID"));
        txtId = new JTextField();
        panel.add(txtId);

        panel.add(new JLabel("Name"));
        txtName = new JTextField();
        panel.add(txtName);

        panel.add(new JLabel("Department"));
        txtDept = new JTextField();
        panel.add(txtDept);

        JButton btnAdd = new JButton("Add");
        JButton btnUpdate = new JButton("Update");

        panel.add(btnAdd);
        panel.add(btnUpdate);

        add(panel, BorderLayout.NORTH);

        // Table
        model = new DefaultTableModel(new String[]{"ID", "Name", "Department"}, 0);
        table = new JTable(model);
        add(new JScrollPane(table), BorderLayout.CENTER);

        // Bottom Panel
        JPanel bottom = new JPanel();
        JButton btnDelete = new JButton("Delete");
        JButton btnClear = new JButton("Clear");
        bottom.add(btnDelete);
        bottom.add(btnClear);

        add(bottom, BorderLayout.SOUTH);

        loadData();

        // Actions
        btnAdd.addActionListener(e -> addStudent());
        btnUpdate.addActionListener(e -> updateStudent());
        btnDelete.addActionListener(e -> deleteStudent());
        btnClear.addActionListener(e -> clearFields());

        table.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                int row = table.getSelectedRow();
                txtId.setText(model.getValueAt(row, 0).toString());
                txtName.setText(model.getValueAt(row, 1).toString());
                txtDept.setText(model.getValueAt(row, 2).toString());
            }
        });
    }

    private void connectDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "DB Error: " + e.getMessage());
        }
    }

    private void loadData() {
        model.setRowCount(0);
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM students");

            while (rs.next()) {
                model.addRow(new Object[]{
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("department")
                });
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }

    private void addStudent() {
        try {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO students VALUES (?, ?, ?)"
            );
            ps.setInt(1, Integer.parseInt(txtId.getText()));
            ps.setString(2, txtName.getText());
            ps.setString(3, txtDept.getText());
            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Added!");
            loadData();
            clearFields();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }

    private void updateStudent() {
        try {
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE students SET name=?, department=? WHERE id=?"
            );
            ps.setString(1, txtName.getText());
            ps.setString(2, txtDept.getText());
            ps.setInt(3, Integer.parseInt(txtId.getText()));
            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Updated!");
            loadData();
            clearFields();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }

    private void deleteStudent() {
        try {
            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM students WHERE id=?"
            );
            ps.setInt(1, Integer.parseInt(txtId.getText()));
            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Deleted!");
            loadData();
            clearFields();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }

    private void clearFields() {
        txtId.setText("");
        txtName.setText("");
        txtDept.setText("");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new StudentCRUDApp().setVisible(true);
        });
    }
}