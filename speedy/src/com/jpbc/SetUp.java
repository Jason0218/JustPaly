package com.jpbc;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import it.unisa.dia.gas.jpbc.Element;
import it.unisa.dia.gas.jpbc.Pairing;
import it.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory;

public class SetUp {
/**
 * @param ��ȫ����k
 * @param ��ɹ��������ļ�PK������ԿMK
 * @author zhengqianngian
 */

public void setup(){
	//PK = G0 , g, h = g ��  , e=e(g, g)��
	Pairing pairing = PairingFactory.getPairing("curve.properties");
	Element g = pairing.getG1().newRandomElement().getImmutable();
	Element a = pairing.getZr().newRandomElement().getImmutable();
	Element b = pairing.getZr().newRandomElement().getImmutable();
	Element h = g.powZn(b).getImmutable();
    Element e = pairing.pairing(g, g).powZn(a).getImmutable();
	PublicKey pk= new PublicKey(g, h, e);
	MasterKey mk=new MasterKey(b,h);
	try {
		pk.writePK(new FileOutputStream("PublicKey.dat"));
	} catch (FileNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		mk.writeMK(new FileOutputStream("MasterKey.dat"));
	} catch (FileNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
}
}
