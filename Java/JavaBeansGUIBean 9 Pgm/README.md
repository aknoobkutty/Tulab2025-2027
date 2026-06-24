# JavaBeans GUI Component Example

This sample demonstrates converting a Swing GUI component into a JavaBean and using it in a simple desktop application.

## Overview

The project shows how to:

- build a reusable GUI component with JavaBean conventions
- expose customizable properties through getter/setter methods
- fire property change events for bean-aware tools or frameworks
- run a Swing demo app that updates bean properties at runtime

## Files

- `src/com/example/javabeans/BeanComponent.java` - A Swing component that acts as a JavaBean.
- `src/com/example/javabeans/BeanDemo.java` - A demo application that creates the bean and allows live property changes.

## Bean Properties

`BeanComponent` exposes the following JavaBean properties:

- `buttonText` (`String`) - the label shown on the button
- `buttonBackground` (`Color`) - the button's background color
- `buttonForeground` (`Color`) - the button's text color
- `beanSize` (`Dimension`) - the preferred component size

These properties follow standard bean naming conventions and can be used by bean-aware tools.

## Build and Run

From the `JavaBeansGUIBean` directory:

```bat
javac -d out src\com\example\javabeans\*.java
java -cp out com.example.javabeans.BeanDemo
```

If you use an IDE, import the `src` folder as a Java source root and run `BeanDemo`.

## What to expect

When the demo runs, a window appears with:

- the bean component in the center
- controls to change the button text
- controls to change the button background and foreground colors

Clicking the button in the bean component shows a popup message, verifying the component is functional.

## Troubleshooting

- Ensure you have a Java JDK installed and `javac` is on your PATH.
- If the GUI window does not appear, verify the command completed without errors.
- Use color codes like `#00CCCC` or named colors supported by `Color.decode`.

## Extend this sample

To extend the bean:

- add new bean properties with public getters/setters
- add new UI controls to the `BeanDemo` class
- use the component in a larger Swing application or a bean builder tool
