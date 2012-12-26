public enum EnumMethodTest {

	SAMPLE1 {
		String getInfo() {
			return "apple";
		}
	},
	SAMPLE2 {
		String getInfo() {
			return "banana";
		}
	};
	abstract String getInfo();

	// 测试
	public static void main(String args[]) {
		for (EnumMethodTest method : values()) {
			System.out.println(method.getInfo());
		}

		System.out.println(EnumMethodTest.SAMPLE1.getInfo());
	}
}
