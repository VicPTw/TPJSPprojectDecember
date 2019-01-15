package pass;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
import java.sql.*;
import java.util.*;

import dao.Common;

public class DBProxy extends Common
{


	private String sqlCommand = ""; //SQL語法
	public boolean insert(String tableName, String columnName, String data)
	{
		    Connection dbConn ;
		    Statement stmt = null;
	        try
	        {
	        		dbConn = getConnection();
		            stmt = dbConn.createStatement();

		            sqlCommand = "INSERT INTO ";
		            sqlCommand += tableName;
		            if(columnName!=null)
		            	sqlCommand += "("+ columnName +") ";
		            sqlCommand += " VALUES ";
		            StringTokenizer tokenizer=new StringTokenizer(data,",");
		            String information=null;
		            while(tokenizer.hasMoreTokens())
		            {
						if(information!=null)
							information=information+",";
						if(information==null)
							information="'"+tokenizer.nextToken()+"'";
						else
							information=information+"'"+tokenizer.nextToken()+"'";
					}

		            sqlCommand += "("+information+ ")";
		            stmt.execute(sqlCommand);
		            stmt.close();
		            dbConn.close();
		            return true;
			}

		  	catch(Exception ex)
		  	{
					return false;
			}
	}

	public String query(String tableName,String selection,String condition)
	{
            Connection dbConn ;
            Statement stmt = null;
            ResultSet rs;
            String result="";

            try
		   {
            	dbConn = getConnection();
			    stmt = dbConn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			    sqlCommand="Select "+selection+" FROM "+tableName;
			    if(condition!=null)
			    	sqlCommand=sqlCommand+" WHERE "+condition;
				rs = stmt.executeQuery(sqlCommand);
				int count = rs.getMetaData().getColumnCount();
				while (rs.next())
				{
				//	if(result!="")
				//		result=result+",";
				//	result =result + rs.getString(selection);
				    for (int i=1; i<=count; i++)
				    {
							if(result!="")
								result=result+",";
						    result =result + rs.getString(i);
				    }

			     }
				 rs.close();
				 stmt.close(); //關閉Statement物件
				 dbConn.close(); //關閉Connection物件
          }

          catch(Exception ex)
          {
			     ex.printStackTrace();
		         System.out.println("error! "+ex.toString());
		  }
		  return result;
	}

	public boolean update(String tableName,String options,String condition )
	{
		   Connection dbConn ;
		   Statement stmt = null;
	      try
	      {
	    	  dbConn = getConnection();
            	stmt = dbConn.createStatement();
            	sqlCommand="UPDATE "+tableName+" SET "+options+" WHERE "+condition;
            	stmt.execute(sqlCommand);
            	stmt.close();
            	dbConn.close();
            	return true;
		 }

  		 catch(Exception ex)
  		{
				return false;
		}
	}
}
