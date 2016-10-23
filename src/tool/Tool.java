package tool;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

public class Tool {
	private static ExecutorService service;
	private static AtomicLong pendingFileVisits = new AtomicLong();
	private static CountDownLatch latch = new CountDownLatch(1);
	private static AtomicLong totalSize = new AtomicLong();
	
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

	public static long getFileSize(File file) throws InterruptedException {
		latch = new CountDownLatch(1);
		pendingFileVisits = new AtomicLong();
		totalSize = new AtomicLong();
		service = Executors.newFixedThreadPool(100);
		pendingFileVisits.incrementAndGet();
		try {
			updateTotalSizeOfFilesInDir(file);
			latch.await(100, TimeUnit.SECONDS);
			return totalSize.longValue();
		} finally {
			service.shutdown();
		}
	}
	
	private static void updateTotalSizeOfFilesInDir(final File file) {
		long fileSize = 0;
		if (file.isFile())
			fileSize = file.length();
		else {
			final File[] children = file.listFiles();
			if (children != null) {
				for (final File child : children) {
					if (child.isFile())
						fileSize += child.length();
					else {
						pendingFileVisits.incrementAndGet();
						service.execute(new Runnable() {
							public void run() {
								updateTotalSizeOfFilesInDir(child);
							}
						});
					}
				}
			}
		}
		totalSize.addAndGet(fileSize);
		if (pendingFileVisits.decrementAndGet() == 0)
			latch.countDown();
	}
	
	public static String FormetFileSize(long fileS) {
		DecimalFormat df = new DecimalFormat("#.00");
		String fileSizeString = "";
		if (fileS == 0) {
			fileSizeString = "0";
		} else if (fileS < 1024) {
			fileSizeString = df.format((double) fileS) + "B";
		} else if (fileS < 1048576) {
			fileSizeString = df.format((double) fileS / 1024) + "K";
		} else if (fileS < 1073741824) {
			fileSizeString = df.format((double) fileS / 1048576) + "M";
		} else {
			fileSizeString = df.format((double) fileS / 1073741824) + "G";
		}
		return fileSizeString;
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
