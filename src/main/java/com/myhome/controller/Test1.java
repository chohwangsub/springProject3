package com.myhome.controller;

public class Test1 {

	public static void main(String[] args) {

		String filename = "aaa.txt／  ";
		filename = filename.trim();
		String[] files = filename.split("／");
		System.out.println( files.length ); 
	}

}
