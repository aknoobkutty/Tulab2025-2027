package com.examapp.model;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

public class Question implements Serializable {

    private int id;
    private String text;
    private Map<String, String> options = new LinkedHashMap<>();
    private String correctOption;
    private String userAnswer;

    public Question() {
    }

    public Question(int id, String text, String optionA, String optionB, String optionC, String optionD, String correctOption) {
        this.id = id;
        this.text = text;
        options.put("A", optionA);
        options.put("B", optionB);
        options.put("C", optionC);
        options.put("D", optionD);
        this.correctOption = correctOption;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Map<String, String> getOptions() {
        return options;
    }

    public void setOptions(Map<String, String> options) {
        this.options = options;
    }

    public String getCorrectOption() {
        return correctOption;
    }

    public void setCorrectOption(String correctOption) {
        this.correctOption = correctOption;
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }
}
