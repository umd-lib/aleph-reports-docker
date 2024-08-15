/*
 * Copyright (c) 2004 The University of Maryland. All Rights Reserved.
 * 
 */

package edu.umd.lims.aleph;

import java.util.*;
import java.io.*;
import java.util.zip.*;

import javax.servlet.jsp.JspWriter;

import org.apache.log4j.Category;

import edu.umd.lims.aleph.*;


/*********************************************************************
 Support config display.

 <pre>
 Revision History:

   2004/04/16: Ben
     - initial version
 </pre>

 @author  Ben Wallberg

*********************************************************************/


public class Config
{
  public static Category cat  = Category.getInstance(Config.class.getName());

  private String strFile     = null;  // file to display


  /************************************************************** getFile */
  /**
   */

  public String
    getFile()
  { return strFile; }


  /************************************************************** setFile */
  /**
   */

  public void
    setFile(String strFile)
  { this.strFile = strFile; }


}




