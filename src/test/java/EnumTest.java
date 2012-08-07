import java.util.EnumMap;
import java.util.EnumSet;

public class EnumTest {
	// ����һ��enumö�����ͣ���������ʵ��ON��OFF
	public enum State {
		ON, OFF
	};

	// ���Ժ���
	public static void main(String[] args) {
		// ֱ�ӱ���enum
		for (State s : State.values())
			System.out.println(s.name());
		// switch��enum�Ľ��ʹ��
		State switchState = State.OFF;
		switch (switchState) {
		case OFF:
			System.out.println("OFF");
			break;
		case ON:
			System.out.println("ON");
			break;
		}
		// EnumSet��ʹ��
		EnumSet<State> stateSet = EnumSet.allOf(State.class);
		for (State s : stateSet) {
			System.out.println(s);
		}
		// EnumMap��ʹ��
		EnumMap<State, String> stateMap = new EnumMap<State, String>(
				State.class);
		stateMap.put(State.ON, "is On");
		stateMap.put(State.OFF, "is off");
		for (State s : State.values()) {
			System.out.println(s.name() + ":" + stateMap.get(s));
		}
	}
}
