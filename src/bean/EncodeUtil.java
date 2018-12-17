/**
 * 
 */
package bean;

/**
 * @author VicP
 * 2018年12月17日
 */
class EncodeUtil {
	static String HTMLEncode(String setters) {
		String[] oldChar = {"& ", "<", ">", " ", "\"", "\'",
							"¢", "£", "¥", "€", "©", "®", "‚",
							"’", "“", "”", "\n"};
		String[] newChar = {"&amp;", "&lt;", "&gt;", "&nbsp;", "&quot;",
							"&apos;", "&cent;", "&pound;", "&yen;", "&euro;", "&copy;", "&reg;", "&lsquor;",
							"&apos;", "&ldquo;", "&rdquo;", "<br>"};
		for (int i = 0; i < oldChar.length; i++) {
			setters = setters.replaceAll(oldChar[i], newChar[i]);
		}
		return setters;
	}
}
