import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class InterestCalculator extends JFrame implements ActionListener {

    JTextField principalField, rateField, timeField, resultField;
    JButton simpleBtn, compoundBtn, clearBtn;

    public InterestCalculator() {

        setTitle("Interest Calculator");
        setSize(400, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new GridLayout(6, 2, 10, 10));

        // Labels
        add(new JLabel("Principal Amount:"));
        principalField = new JTextField();
        add(principalField);

        add(new JLabel("Rate (%):"));
        rateField = new JTextField();
        add(rateField);

        add(new JLabel("Time (years):"));
        timeField = new JTextField();
        add(timeField);

        add(new JLabel("Result:"));
        resultField = new JTextField();
        resultField.setEditable(false);
        add(resultField);

        // Buttons
        simpleBtn = new JButton("Simple Interest");
        compoundBtn = new JButton("Compound Interest");
        clearBtn = new JButton("Clear");

        add(simpleBtn);
        add(compoundBtn);
        add(clearBtn);

        // Action Listeners
        simpleBtn.addActionListener(this);
        compoundBtn.addActionListener(this);
        clearBtn.addActionListener(this);

        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        try {
            double p = Double.parseDouble(principalField.getText());
            double r = Double.parseDouble(rateField.getText());
            double t = Double.parseDouble(timeField.getText());

            if (e.getSource() == simpleBtn) {
                double si = (p * r * t) / 100;
                resultField.setText(String.valueOf(si));
            }

            else if (e.getSource() == compoundBtn) {
                double ci = p * Math.pow((1 + r / 100), t) - p;
                resultField.setText(String.valueOf(ci));
            }

            else if (e.getSource() == clearBtn) {
                principalField.setText("");
                rateField.setText("");
                timeField.setText("");
                resultField.setText("");
            }

        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this, "Please enter valid numbers!");
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new InterestCalculator());
    }
}