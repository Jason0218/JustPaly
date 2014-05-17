package com.jpbc;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import it.unisa.dia.gas.jpbc.Element;

/**
 * This class shows the structure of the public key of the RIBE system. 
 * 
 * @author Zhang Huajun
 * @version 0.14
 */

public class PublicKey {

	/**
	 * an public key Element
	 */

	private Element g;
	/**
	 * an public key Element
	 */

	private Element h;
	/**
	 * an public key Element
	 */

	private Element e;

/**
 * The construction method with the input for each field.
 * @param g input g
 * @param h input h
 * @param e input e
 */

	public PublicKey(Element g,Element h, Element e) {
	this.g=g;
	this.h=h;
	this.e=e;
	}


public Element getG() {
	return g;
}


public Element getH() {
	return h;
}


public Element getE() {
	return e;
}


/**
 * Read the public key from an input stream.
 * @param in an input stream with legal public key elements 
 * @throws IOException
 */
	public void readPK(InputStream in) throws IOException {
		int l;
		byte[] bs;
		l = in.read();
		bs = new byte[l];
		in.read(bs);
		g.setFromBytes(bs);
		g = g.getImmutable();
		l = in.read();
		bs = new byte[l];
		in.read(bs);
		h.setFromBytes(bs);
		h = h.getImmutable();
		l = in.read();
		bs = new byte[l];
		in.read(bs);
		e.setFromBytes(bs);
		e = e.getImmutable();
	}
/**
 * Output this public key.
 * @param out an output stream where the public key should be written.
 * @throws IOException
 */
	public void writePK(OutputStream out) throws IOException {
		out.write(g.getLengthInBytes());
		out.write(g.toBytes());
		out.write(h.getLengthInBytes());
		out.write(h.toBytes());
		out.write(e.getLengthInBytes());
		out.write(e.toBytes());
		out.close();
	}

}
