import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;

public class NotepadApp extends JFrame implements ActionListener {

    JTextArea textArea;
    JMenuBar menuBar;
    JMenu fileMenu, editMenu;
    JMenuItem newFile, openFile, saveFile, saveAsFile, exit;
    JMenuItem cut, copy, paste, selectAll;

    JFileChooser fileChooser;

    File currentFile = null;

    public NotepadApp() {
        setTitle("Simple Notepad");
        setSize(700, 500);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        // Text Area
        textArea = new JTextArea();
        JScrollPane scrollPane = new JScrollPane(textArea);
        add(scrollPane);

        // Menu Bar
        menuBar = new JMenuBar();

        // File Menu
        fileMenu = new JMenu("File");
        newFile = new JMenuItem("New");
        openFile = new JMenuItem("Open");
        saveFile = new JMenuItem("Save");
        saveAsFile = new JMenuItem("Save As");
        exit = new JMenuItem("Exit");

        // Edit Menu
        editMenu = new JMenu("Edit");
        cut = new JMenuItem("Cut");
        copy = new JMenuItem("Copy");
        paste = new JMenuItem("Paste");
        selectAll = new JMenuItem("Select All");

        // Add Action Listeners
        newFile.addActionListener(this);
        openFile.addActionListener(this);
        saveFile.addActionListener(this);
        saveAsFile.addActionListener(this);
        exit.addActionListener(this);

        cut.addActionListener(this);
        copy.addActionListener(this);
        paste.addActionListener(this);
        selectAll.addActionListener(this);

        // Add items to menus
        fileMenu.add(newFile);
        fileMenu.add(openFile);
        fileMenu.add(saveFile);
        fileMenu.add(saveAsFile);
        fileMenu.addSeparator();
        fileMenu.add(exit);

        editMenu.add(cut);
        editMenu.add(copy);
        editMenu.add(paste);
        editMenu.add(selectAll);

        // Add menus to menu bar
        menuBar.add(fileMenu);
        menuBar.add(editMenu);

        setJMenuBar(menuBar);

        fileChooser = new JFileChooser();

        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        // New File
        if (e.getSource() == newFile) {
            textArea.setText("");
            currentFile = null;
            setTitle("Simple Notepad");
        }

        // Open File
        else if (e.getSource() == openFile) {
            int option = fileChooser.showOpenDialog(this);
            if (option == JFileChooser.APPROVE_OPTION) {
                currentFile = fileChooser.getSelectedFile();
                try (BufferedReader reader = new BufferedReader(new FileReader(currentFile))) {
                    textArea.read(reader, null);
                    setTitle(currentFile.getName());
                } catch (IOException ex) {
                    JOptionPane.showMessageDialog(this, "Error opening file");
                }
            }
        }

        // Save File
        else if (e.getSource() == saveFile) {
            if (currentFile != null) {
                saveToFile(currentFile);
            } else {
                saveAsFile.doClick();
            }
        }

        // Save As
        else if (e.getSource() == saveAsFile) {
            int option = fileChooser.showSaveDialog(this);
            if (option == JFileChooser.APPROVE_OPTION) {
                currentFile = fileChooser.getSelectedFile();
                saveToFile(currentFile);
                setTitle(currentFile.getName());
            }
        }

        // Exit
        else if (e.getSource() == exit) {
            System.exit(0);
        }

        // Edit Functions
        else if (e.getSource() == cut) {
            textArea.cut();
        } else if (e.getSource() == copy) {
            textArea.copy();
        } else if (e.getSource() == paste) {
            textArea.paste();
        } else if (e.getSource() == selectAll) {
            textArea.selectAll();
        }
    }

    // Save helper method
    private void saveToFile(File file) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            textArea.write(writer);
        } catch (IOException ex) {
            JOptionPane.showMessageDialog(this, "Error saving file");
        }
    }
    public static void main(String[] args) {
        new NotepadApp();
    }
}