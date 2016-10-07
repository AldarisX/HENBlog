package tool;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.Map;

import com.Config;

public class Tool {
	public static String transMapToString(Map<String, String[]> map) {
		String mapToString = "";
		for (String key : map.keySet()) {
			String tempString[] = map.get(key);
			for (int i = 0; i < tempString.length; i++) {
				mapToString += key + "-" + tempString[i] + "-";
			}
		}
		return mapToString;
	}

	public static boolean isFileExist(File file, long time) throws IOException {
		if (file.exists()) {
			Date date = new Date();
			if ((date.getTime() - file.lastModified()) / 100 > time) {
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}

	public static boolean isFileExist(File file) throws IOException {
		if (file.exists()) {
			return true;
		} else {
			return false;
		}
	}

	public static void dirClean(File dir, boolean inn) {
		File[] children = dir.listFiles();
		if (children != null) {
			for (final File child : children) {
				if (child.isFile()) {
					child.delete();
				} else {
					if (inn) {
						dirClean(child, inn);
					} else {

					}
				}
			}
		}
	}

	public static void delVMSP(File dir, String fileName) {
		File[] children = dir.listFiles();
		if (children != null) {
			for (final File child : children) {
				if (child.isFile()) {
					if (child.getName().startsWith(fileName)) {
						child.delete();
					}
				}
			}
		}
	}
}
