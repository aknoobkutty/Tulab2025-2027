package com.example.javabeans;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

public class BeanDemo {

    public static void main(String[] args) {
        SwingUtilities.invokeLater(BeanDemo::createAndShowGUI);
    }

    private static void createAndShowGUI() {
        JFrame frame = new JFrame("JavaBean GUI Component Demo");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new BorderLayout(10, 10));

        BeanComponent beanComponent = new BeanComponent("Hello Bean");

        JPanel controls = new JPanel(new GridLayout(0, 2, 8, 8));

        JTextField textField = new JTextField(beanComponent.getButtonText(), 15);
        JButton updateText = new JButton("Update Text");
        updateText.addActionListener(e -> beanComponent.setButtonText(textField.getText()));

        JTextField bgField = new JTextField("#00CCCC", 10);
        JButton updateBg = new JButton("Update Background");
        updateBg.addActionListener(e -> beanComponent.setButtonBackground(parseColor(bgField.getText(), beanComponent.getButtonBackground())));

        JTextField fgField = new JTextField("#000000", 10);
        JButton updateFg = new JButton("Update Foreground");
        updateFg.addActionListener(e -> beanComponent.setButtonForeground(parseColor(fgField.getText(), beanComponent.getButtonForeground())));

        controls.add(new JLabel("Button text:"));
        controls.add(textField);
        controls.add(updateText);
        controls.add(new JLabel());
        controls.add(new JLabel("Background color:"));
        controls.add(bgField);
        controls.add(updateBg);
        controls.add(new JLabel());
        controls.add(new JLabel("Foreground color:"));
        controls.add(fgField);
        controls.add(updateFg);
        controls.add(new JLabel());

        frame.add(beanComponent, BorderLayout.CENTER);
        frame.add(controls, BorderLayout.SOUTH);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    private static Color parseColor(String text, Color fallback) {
        try {
            return Color.decode(text.trim());
        } catch (Exception e) {
            return fallback;
        }
    }
}
