package com.example.javabeans;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class BeanComponent extends JPanel implements Serializable {
    private static final long serialVersionUID = 1L;

    private String buttonText = "Click Me Bean";
    private Color buttonBackground = Color.CYAN;
    private Color buttonForeground = Color.BLACK;
    private Dimension beanSize = new Dimension(280, 120);

    private final JButton button;
    private transient PropertyChangeSupport propertyChangeSupport;

    public BeanComponent() {
        this("Click Me Bean");
    }

    public BeanComponent(String buttonText) {
        this.buttonText = buttonText;
        setLayout(new BorderLayout(10, 10));
        button = new JButton(buttonText);
        button.setBackground(buttonBackground);
        button.setForeground(buttonForeground);
        button.addActionListener(e -> JOptionPane.showMessageDialog(this, "JavaBean button clicked!"));
        add(button, BorderLayout.CENTER);
        setPreferredSize(beanSize);
        propertyChangeSupport = new PropertyChangeSupport(this);
    }

    private void readObject(java.io.ObjectInputStream in) throws java.io.IOException, ClassNotFoundException {
        in.defaultReadObject();
        propertyChangeSupport = new PropertyChangeSupport(this);
    }

    public String getButtonText() {
        return buttonText;
    }

    public void setButtonText(String buttonText) {
        String old = this.buttonText;
        this.buttonText = buttonText;
        button.setText(buttonText);
        propertyChangeSupport.firePropertyChange("buttonText", old, buttonText);
    }

    public Color getButtonBackground() {
        return buttonBackground;
    }

    public void setButtonBackground(Color buttonBackground) {
        Color old = this.buttonBackground;
        this.buttonBackground = buttonBackground;
        button.setBackground(buttonBackground);
        propertyChangeSupport.firePropertyChange("buttonBackground", old, buttonBackground);
    }

    public Color getButtonForeground() {
        return buttonForeground;
    }

    public void setButtonForeground(Color buttonForeground) {
        Color old = this.buttonForeground;
        this.buttonForeground = buttonForeground;
        button.setForeground(buttonForeground);
        propertyChangeSupport.firePropertyChange("buttonForeground", old, buttonForeground);
    }

    public Dimension getBeanSize() {
        return beanSize;
    }

    public void setBeanSize(Dimension beanSize) {
        Dimension old = this.beanSize;
        this.beanSize = beanSize;
        setPreferredSize(beanSize);
        revalidate();
        repaint();
        propertyChangeSupport.firePropertyChange("beanSize", old, beanSize);
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.removePropertyChangeListener(listener);
    }
}
