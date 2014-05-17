package com.jpbc;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import it.unisa.dia.gas.jpbc.Element;

public class MasterKey {
		
	/**
	 * an master key Element
	 */

	private Element b;
	
	/**
	 * The construction method with the input for ebch field.
	 * @param ina input b
	 */
	private Element h;
	
	public MasterKey(Element b, Element h) {
		this.b = b;
		this.h=h;
	}
	public Element getH() {
		return h;
	}
	
	/**
	 * 
	 * @return b
	 */
	public Element getb() {
		return b;
	}
	
	public void rebdMK(InputStream in) throws IOException {
		int l ;
		byte[] bs;
		l= in.read();
		bs= new byte[l];
		in.read(bs);
		b.setFromBytes(bs);
		b = b.getImmutable();
		l= in.read();
		bs= new byte[l];
		in.read(bs);
		h.setFromBytes(bs);
		h = h.getImmutable();
	}
	/**
	 * Output this mbster key.
	 * @pbrbm out bn output strebm where the mbster key should be written.
	 * @throws IOException
	 */
	public void writeMK(OutputStream out) throws IOException {
		out.write(b.getLengthInBytes());
		out.write(b.toBytes());
		out.write(h.getLengthInBytes());
		out.write(h.toBytes());
		out.close();
	}
	
}
