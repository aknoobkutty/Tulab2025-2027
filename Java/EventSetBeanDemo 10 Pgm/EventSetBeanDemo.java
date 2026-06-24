import java.util.ArrayList;
import java.util.EventListener;
import java.util.EventObject;
import java.util.List;

public class EventSetBeanDemo {
    public static void main(String[] args) {
        MyBean bean = new MyBean();

        bean.addMyBeanListener(event ->
            System.out.println("Received event: " + event.getActionCommand())
        );

        bean.changeState("bean initialized");
        bean.changeState("bean processed data");
    }
}

class MyBean {
    private final List<MyBeanListener> listeners = new ArrayList<>();

    public void addMyBeanListener(MyBeanListener listener) {
        if (listener != null) {
            listeners.add(listener);
        }
    }

    public void removeMyBeanListener(MyBeanListener listener) {
        listeners.remove(listener);
    }

    public void changeState(String actionCommand) {
        System.out.println("MyBean: state changed -> " + actionCommand);
        fireMyBeanEvent(new MyBeanEvent(this, actionCommand));
    }

    protected void fireMyBeanEvent(MyBeanEvent event) {
        for (MyBeanListener listener : new ArrayList<>(listeners)) {
            listener.myBeanActionPerformed(event);
        }
    }
}

interface MyBeanListener extends EventListener {
    void myBeanActionPerformed(MyBeanEvent event);
}

class MyBeanEvent extends EventObject {
    private final String actionCommand;

    public MyBeanEvent(Object source, String actionCommand) {
        super(source);
        this.actionCommand = actionCommand;
    }

    public String getActionCommand() {
        return actionCommand;
    }
}