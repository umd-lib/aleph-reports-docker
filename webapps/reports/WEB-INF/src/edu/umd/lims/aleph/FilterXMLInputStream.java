/*
 * Copyright (c) 2007 The University of Maryland. All Rights Reserved.
 * 
 */

package edu.umd.lims.aleph;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import java.io.BufferedReader;
import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilterInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;



/*********************************************************************
 FilterInputStream for XML.  Filter out invalid control characters.
*********************************************************************/


public class FilterXMLInputStream extends FilterInputStream {


  protected FilterXMLInputStream(InputStream in) {
    super(in);
  }

  public int read() throws IOException {
    int n = in.read();
    
    while (n != -1 && isInvalidControl((char)n)) {
      n = in.read();
    }

    return n;
  }


  public int read(byte b[], int off, int len) throws IOException {
    int read = 0;
    int n = 0;
    
    while (read < len && off+read < b.length && n != -1) {
      n = read();

      if (n != -1) {
	b[off+read] = (byte)n;
	read++;
      }
    }

    if (read == 0) {
      return -1;
    } else {
      return read;
    }
  }

  
  public static boolean isInvalidControl(char c) {
    if (c == '\t' ||
	c == '\n' ||
	c == '\r') {
      return false;
    } else if (Character.isISOControl(c)) {
      return true;
    } else {
      return false;
    }
  }

}

