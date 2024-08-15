/*
 * Copyright (c) 2003 The University of Maryland. All Rights Reserved.
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

 Xpt report support.

 <pre>
 Revision History:

   2003/08/14: Ben
     - initial version
 </pre>

 @author  Ben Wallberg

*********************************************************************/


public class ReportXpt extends Report
{
  public static Category cat  = Category.getInstance(ReportXpt.class.getName());


  /****************************************************** getTitleOptions */
  /**
   * Get the report title extras for a particular report.
   */

  public String
    getTitleOptions(File f)
  {
    int j,k;
    int nCount = 0;

    HashSet hDocs = new HashSet();
    try {
      // Open the file
      InputStream i  = new FileInputStream(f);

      if (f.getName().endsWith(".gz"))
        i = new GZIPInputStream(i);

      BufferedReader br = new BufferedReader(new InputStreamReader(i, "UTF8"));

      // Read the file
      String strLine;
      while ((strLine = br.readLine()) != null) {

        // doc-number
        if ((j = strLine.indexOf("<doc-number>")) > -1 &&
            (k = strLine.indexOf("</doc-number>", j)) > -1)
          {
            hDocs.add(strLine.substring(j+12,k).trim());
          }
      }

      br.close();

    }
    catch (Exception e) {
      cat.error("Error reading title information for " + f + ": " + e.getMessage());
    }

    return " (" + hDocs.size() + ")";
  }

}


