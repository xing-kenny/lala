import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.kenny.drillmgt.domain.RungIn;
import org.kenny.drillmgt.util.RungInLabel;


public class RungInLabelTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		RungInLabelTest t = new RungInLabelTest();
		t.testInitRungInLabels();

	}

	private void testInitRungInLabels() {
		List<RungInLabel> labels = initRungInLabels();
		for (RungInLabel r : labels) {
			System.out.println(r.toString());
		}

		List<RungIn> rungIns = new ArrayList<RungIn>();
		rungIns.add(new RungIn());
		rungIns.add(null);
		rungIns.add(new RungIn());

		for (Object o : rungIns) {
			if (null != o) {
				System.out.println(((RungIn) o).toString());
			} else {
				System.out.println("have no rungIn now!");
			}
		}

	}

	private List<RungInLabel> initRungInLabels() {

		List<RungInLabel> labels = new ArrayList<RungInLabel>();

		Calendar cStart = Calendar.getInstance();
		Calendar cEnd = Calendar.getInstance();
		cStart.set(2012, 8, 30);
		cEnd.set(2012, 9, 5);

		int loop = 0;
		while (!cStart.after(cEnd) && loop < 10) {
			loop ++;
			RungInLabel r = new RungInLabel();
			r.setRungInDay(cStart.getTime());
			r.setForenoon(1);
			labels.add(r);
			r = new RungInLabel();
			r.setRungInDay(cStart.getTime());
			r.setForenoon(0);
			labels.add(r);
			cStart.add(Calendar.DAY_OF_MONTH, 1);
		}

		return labels;
	}

}
