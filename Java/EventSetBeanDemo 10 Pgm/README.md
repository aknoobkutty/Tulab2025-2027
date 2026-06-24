# EventSetBeanDemo

This example demonstrates how to add an event set to a Java bean-style component using custom event classes and listener interfaces.

## What it does

- `MyBean` represents a bean that can change state.
- `MyBeanEvent` contains event information, including an action command.
- `MyBeanListener` is the event listener interface.
- `EventSetBeanDemo` registers a listener and fires events when the bean state changes.

## How it works

1. `EventSetBeanDemo` creates a `MyBean` instance.
2. It adds a `MyBeanListener` to the bean using `addMyBeanListener(...)`.
3. When `bean.changeState(...)` is called, `MyBean` creates a `MyBeanEvent` and notifies all registered listeners.
4. The listener receives the event and prints the action command.

## Setup

No external libraries are required.

1. Open a terminal in the `EventSetBeanDemo` folder.
2. Compile the program:

```powershell
javac EventSetBeanDemo.java
```

## Run

```powershell
java EventSetBeanDemo
```

You should see output like:

```
MyBean: state changed -> bean initialized
Received event: bean initialized
MyBean: state changed -> bean processed data
Received event: bean processed data
```
