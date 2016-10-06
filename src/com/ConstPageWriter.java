package com;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.jsp.JspWriter;

public class ConstPageWriter extends JspWriter {
	private PrintWriter pw;

	public ConstPageWriter(String fileName) {
		super(JspWriter.DEFAULT_BUFFER, false);
		try {
			File f = new File(fileName);
			if (!f.exists())
				f.createNewFile();
			pw = new PrintWriter(fileName, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void clear() throws IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void clearBuffer() throws IOException {

	}

	@Override
	public void close() throws IOException {
		pw.close();
	}

	@Override
	public void flush() throws IOException {
		pw.flush();
	}

	@Override
	public int getRemaining() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void newLine() throws IOException {
		pw.println();
	}

	@Override
	public void print(boolean arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(char arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(int arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(long arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(float arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(double arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(char[] arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(String arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void print(Object arg0) throws IOException {
		pw.print(arg0);
	}

	@Override
	public void println() throws IOException {
		pw.println();
	}

	@Override
	public void println(boolean arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(char arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(int arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(long arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(float arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(double arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(char[] arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(String arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void println(Object arg0) throws IOException {
		pw.println(arg0);
	}

	@Override
	public void write(char[] arg0, int arg1, int arg2) throws IOException {
		pw.write(arg0, arg1, arg2);
	}
}