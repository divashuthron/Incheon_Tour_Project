package ICproject;

import java.sql.*;
import java.util.Date;
import java.util.*;
import java.text.SimpleDateFormat;

public class MemberManager {
	
	private DBConnectionMgr pool = null;

    public MemberManager() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public boolean loginCheck(String id, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select User_ID, User_Password from User_Data where User_ID = ? and User_Password = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
    
    public boolean memberInsert(AddAcountBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into User_Data values(?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getID());
            System.out.println(regBean.getID());
            pstmt.setString(2, regBean.getPS());
            System.out.println(regBean.getPS());
            pstmt.setString(3, regBean.getNA());
            System.out.println(regBean.getNA());
            pstmt.setString(4, regBean.getSEX());
            System.out.println(regBean.getSEX());
            
            int TEL1 = Integer.parseInt(regBean.getTEL1());
            pstmt.setInt(5, TEL1);
            System.out.println(regBean.getTEL1());
            int TEL2 = Integer.parseInt(regBean.getTEL2());
            pstmt.setInt(6, TEL2);
            System.out.println(regBean.getTEL2());
            int TEL3 = Integer.parseInt(regBean.getTEL3());
            pstmt.setInt(7, TEL3);
            System.out.println(regBean.getTEL3());
            
            pstmt.setString(8, regBean.getEMAIL1());
            System.out.println(regBean.getEMAIL1());
            pstmt.setString(9, regBean.getEMAIL2());
            System.out.println(regBean.getEMAIL2());
            
            String NC = regBean.getNCTermsAgree();
            if (NC.equals("Y")) { pstmt.setBoolean(10, true); }
            if (NC.equals("N")) { pstmt.setBoolean(10, false); }
            System.out.println(regBean.getNCTermsAgree());
            
            String OP = regBean.getOPTermsAgree();
            if (OP.equals("Y")) { pstmt.setBoolean(11, true); }
            else { pstmt.setBoolean(11, false); }
            System.out.println(regBean.getOPTermsAgree());
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public AddAcountBean getMember(String mem_ID) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        AddAcountBean regBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from User_Data where User_ID=? or User_Name=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_ID);
            pstmt.setString(2, mem_ID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	regBean = new AddAcountBean();
                regBean.setID(rs.getString("User_ID"));
                regBean.setPS(rs.getString("User_Password"));
                regBean.setNA(rs.getString("User_Name"));
                regBean.setSEX(rs.getString("User_SEX"));
                regBean.setTEL1(rs.getString("User_Tel1"));
                regBean.setTEL2(rs.getString("User_Tel2"));
                regBean.setTEL3(rs.getString("User_Tel3"));
                regBean.setEMAIL1(rs.getString("User_Email1"));
                regBean.setEMAIL2(rs.getString("User_Email2"));
                regBean.setNCTermsAgree(rs.getString("User_NCTermsAgree"));
                regBean.setOPTermsAgree(rs.getString("User_OPTermsAgree"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return regBean;
    }
    
    public Vector getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from User_Data";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                AddAcountBean regBean = new AddAcountBean();
                regBean.setID(rs.getString("User_ID"));
                regBean.setPS(rs.getString("User_Password"));
                regBean.setNA(rs.getString("User_Name"));
                regBean.setSEX(rs.getString("User_Sex"));
                regBean.setTEL1(rs.getString("User_Tel1"));
                regBean.setTEL2(rs.getString("User_Tel2"));
                regBean.setTEL3(rs.getString("User_Tel3"));
                regBean.setEMAIL1(rs.getString("User_Email1"));
                regBean.setEMAIL2(rs.getString("User_Email2"));
                regBean.setNCTermsAgree(rs.getString("User_NCTermsAgree"));
                regBean.setOPTermsAgree(rs.getString("User_OPTermsAgree"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public boolean memberUpdate(AddAcountBean regBean) { //MySQL 애프터 트리거로 업데이트 시 카트 데이터베이스 내의 User_Name 변경되게 설정
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update User_Data set User_ID=?, User_Password=?,";
            strQuery = strQuery + " User_Name=?, User_Sex=?, User_Tel1=?, User_Tel2=?, User_Tel3=?, User_Email1=?, User_Email2=?";
            strQuery = strQuery + " where User_ID=? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getID());
            pstmt.setString(2, regBean.getPS());
            pstmt.setString(3, regBean.getNA());
            pstmt.setString(4, regBean.getSEX());
            
            int TEL1 = Integer.parseInt(regBean.getTEL1());
            pstmt.setInt(5, TEL1);
            int TEL2 = Integer.parseInt(regBean.getTEL2());
            pstmt.setInt(6, TEL2);
            int TEL3 = Integer.parseInt(regBean.getTEL3());
            pstmt.setInt(7, TEL3);
            
            pstmt.setString(8, regBean.getEMAIL1());
            pstmt.setString(9, regBean.getEMAIL2());
            
            pstmt.setString(10, regBean.getID());
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public ArrayList<NoticeBean> getNoticeList(int pageNum) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<NoticeBean> list = new ArrayList<NoticeBean>();
    	
    	try {
    		con = pool.getConnection();
    		String strQuery = "select * from Notice_Data where Notice_Num < ? order by Notice_Num desc limit 10";
    		pstmt = con.prepareStatement(strQuery);
    		pstmt.setInt(1, getNext() - (pageNum - 1) * 10);
    		rs = pstmt.executeQuery();
    	
    		while (rs.next()) {
    			NoticeBean NTB = new NoticeBean();
    			NTB.setNA(rs.getString("User_Name"));
    			NTB.setNNA(rs.getString("Notice_Name"));
    			NTB.setDATE(rs.getString("Notice_Date"));
    			NTB.setVIEW(rs.getString("Notice_Views"));
    			NTB.setNUM(rs.getString("Notice_Num"));
    			NTB.setCONTENT(rs.getString("Notice_Content"));
    			list.add(NTB);
    		}
    	}
    	catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(con, pstmt, rs);
    	}
    	return list;
    }
    
    public boolean noticeInsert (NoticeBean NB) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into Notice_Data values(?, ?, ?, ?, null, ?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, NB.getNA());
            System.out.println(NB.getNA());
            pstmt.setString(2, NB.getNNA());
            System.out.println(NB.getNNA());
            
            pstmt.setString(3, NB.getDATE());
            System.out.println(NB.getDATE());
            
            pstmt.setInt(4, 0);
            pstmt.setString(5, NB.getCONTENT());
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public NoticeBean getNotice(String notice_Num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        NoticeBean NTB = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from Notice_Data where Notice_Num = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, notice_Num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	NTB = new NoticeBean();
                NTB.setNNA(rs.getString("Notice_Name"));
                NTB.setDATE(rs.getString("Notice_Date"));
                NTB.setNA(rs.getString("User_Name"));
                NTB.setCONTENT(rs.getString("Notice_Content"));
                NTB.setNUM(rs.getString("Notice_Num"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return NTB;
    }
    
    public boolean NoticeUpdate(NoticeBean NTB) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update Notice_Data set Notice_Name=?, Notice_Date=?,";
            strQuery = strQuery + " User_Name=?, Notice_Content=?";
            strQuery = strQuery + " where Notice_Num=? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, NTB.getNNA());
            pstmt.setString(2, NTB.getDATE());
            pstmt.setString(3, NTB.getNA());
            pstmt.setString(4, NTB.getCONTENT());
            pstmt.setString(5, NTB.getNUM());
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public boolean DeliteNotice(String notice_Num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "delete from Notice_Data where Notice_Num = ?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, notice_Num);
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public void increaseView(String notice_Num) {
    	Connection con = null;
    	PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();
            String strQuery = "update Notice_Data set Notice_Views = Notice_Views + 1 where Notice_Num = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, notice_Num);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }
    
    // 공지사항 페이지 목록 넘기기로 사용될 메소드
    
    public boolean nextPage (int pageNum) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String strQuery = "select * from Notice_Data where Notice_Num < ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setInt(1, getNext() - (pageNum - 1) * 10);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	return true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        } 
        return false;
    }
        
    public int getNext() { 
    	Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String SQL = "SELECT Notice_Num FROM Notice_Data ORDER BY Notice_Num DESC";
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
    } 
    
    public ArrayList<TravelBean> getTravelList(int pageNum) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<TravelBean> list = new ArrayList<TravelBean>();
    	
    	try {
    		con = pool.getConnection();
    		String strQuery = "select * from Travel_Data where Travel_No < ? order by Travel_No desc limit 10";
    		pstmt = con.prepareStatement(strQuery);
    		pstmt.setInt(1, TgetNext() - (pageNum - 1) * 10);
    		rs = pstmt.executeQuery();
    	
    		while (rs.next()) {
    			TravelBean TTB = new TravelBean();
    			TTB.setNO(rs.getString("Travel_No"));
    			TTB.setNAME(rs.getString("Travel_Name"));
    			TTB.setADDRESS(rs.getString("Travel_Address"));
    			TTB.setCONTENT(rs.getString("Travel_Content"));
    			TTB.setTEL(rs.getString("Travel_Tel"));
    			TTB.setIMAGE(rs.getString("Travel_Image"));
    			TTB.setTYPE(rs.getString("Travel_Type"));
    			list.add(TTB);
    		}
    	}
    	catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(con, pstmt, rs);
    	}
    	return list;
    }
    
    public TravelBean getTravel(String Travel_No) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        TravelBean TTB = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from Travel_Data where Travel_No = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Travel_No);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	TTB = new TravelBean();
            	TTB.setNO(rs.getString("Travel_No"));
                TTB.setNAME(rs.getString("Travel_Name"));
                TTB.setADDRESS(rs.getString("Travel_Address"));
                TTB.setTEL(rs.getString("Travel_Tel"));
                TTB.setIMAGE(rs.getString("Travel_Image"));
                TTB.setTYPE(rs.getString("Travel_Type"));
                TTB.setCONTENT(rs.getString("Travel_Content"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return TTB;
    }
    
    public boolean checkCart(String Travel_No, String User_ID, String DATE) {
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	int check = 0;
    	
    	try {
             con = pool.getConnection();
             String strQuery = "select * from Cart_Data where User_ID = ? and Travel_No = ? and Travel_Date = ?";

             pstmt = con.prepareStatement(strQuery);
             pstmt.setString(1, User_ID);
             System.out.println(User_ID);
             pstmt.setString(2, Travel_No);
             System.out.println(Travel_No);
             pstmt.setString(3, DATE);
             System.out.println(DATE);
             rs = pstmt.executeQuery();
             
             if (rs.next()) {
            	 check = rs.getInt("Cart_No");
            	 System.out.println(check);
             }

             if (check == 0) {
                 return true; //예약 가능
             }
         } catch (Exception ex) {
             System.out.println("Exception" + ex);
         } finally {
             pool.freeConnection(con, pstmt);
         }
         return false; //예약 불가능
    }
    
    public boolean InsertCartTravel (CartBean CB) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into Cart_Data values(null, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, CB.getUID());
            System.out.println(CB.getUID());
            pstmt.setString(2, CB.getTNO());
            System.out.println(CB.getTNO());
            pstmt.setString(3, CB.getTNAME());
            System.out.println(CB.getTNAME());
            pstmt.setString(4, CB.getTTEL());
            System.out.println(CB.getTTEL());
            pstmt.setString(5, CB.getTADDR());
            System.out.println(CB.getTADDR());
            pstmt.setString(6, CB.getTIMAGE());
            System.out.println(CB.getTIMAGE());
            pstmt.setString(7, CB.getTDATE());
            System.out.println(CB.getTDATE());
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public ArrayList<CartBean> getCart(int pageNum, String User_ID) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<CartBean> list = new ArrayList<CartBean>();
    	
    	try {
    		con = pool.getConnection();
    		String strQuery = "select * from Cart_Data where Cart_No < ? and User_ID = ? order by Cart_No desc limit 10";
    		pstmt = con.prepareStatement(strQuery);
    		pstmt.setInt(1, CgetNext() - (pageNum - 1) * 10);
    		pstmt.setString(2, User_ID);
    		rs = pstmt.executeQuery();
    	
    		while (rs.next()) {
    			CartBean CB = new CartBean();
    			CB.setCNO(rs.getString("Cart_No"));
    			CB.setUID(rs.getString("User_ID"));
    			CB.setTNO(rs.getString("Travel_No"));
    			CB.setTNAME(rs.getString("Travel_Name"));
    			CB.setTTEL(rs.getString("Travel_Tel"));
    			CB.setTADDR(rs.getString("Travel_Address"));
    			CB.setTIMAGE(rs.getString("Travel_Image"));
    			CB.setTDATE(rs.getString("Travel_Date"));
    			
    			list.add(CB);
    		}
    	}
    	catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(con, pstmt, rs);
    	}
    	return list;
    }
    
    public boolean DeleteCart(String Cart_No) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "delete from Cart_Data where Cart_No = ?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Cart_No);
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public boolean TnextPage (int pageNum) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String strQuery = "select * from Travel_Data where Travel_No < ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setInt(1, TgetNext() - (pageNum - 1) * 10);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	return true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        } 
        return false;
    }
        
    public int TgetNext() { 
    	Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String SQL = "SELECT Travel_No FROM Travel_Data ORDER BY Travel_No DESC";
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
    } 
    
    public boolean CnextPage (int pageNum) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String strQuery = "select * from Cart_Data where Cart_No < ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setInt(1, CgetNext() - (pageNum - 1) * 10);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	return true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        } 
        return false;
    }
        
    public int CgetNext() { 
    	Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String SQL = "SELECT Cart_No FROM Cart_Data ORDER BY Cart_No DESC";
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
    }
    
    public AddAcountBean getAffinity(String ID) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        AddAcountBean ACB = null;

        try {
            con = pool.getConnection();
            String strQuery = "select User_Travel_Affinity from User_Data where User_ID = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, ID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	ACB = new AddAcountBean();
                ACB.setAffinity(rs.getString("User_Travel_Affinity"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return ACB;
    }
    
    public ArrayList<TravelBean> getTravelAffnityList(String Affinity) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<TravelBean> list = new ArrayList<TravelBean>();
    	
    	try {
    		con = pool.getConnection();
    		String strQuery = "select * from Travel_Data where Travel_Type = ? limit 3";
    		pstmt = con.prepareStatement(strQuery);
    		pstmt.setString(1, Affinity);
    		rs = pstmt.executeQuery();
    	
    		while (rs.next()) {
    			TravelBean TB = new TravelBean();
    			TB.setNO(rs.getString("Travel_No"));
    			TB.setNAME(rs.getString("Travel_Name"));
    			TB.setADDRESS(rs.getString("Travel_Address"));
    			TB.setTEL(rs.getString("Travel_Tel"));
    			TB.setIMAGE(rs.getString("Travel_Image"));
    			TB.setTYPE(rs.getString("Travel_Type"));
    			list.add(TB);
    		}
    	}
    	catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(con, pstmt, rs);
    	}
    	return list;
    }
    
    public ArrayList<AffinityQuestionBean> getAffinityQuestion() {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<AffinityQuestionBean> list = new ArrayList<AffinityQuestionBean>();
    	
    	try {
    		con = pool.getConnection();
    		String strQuery = "select * from Affinity_Question";
    		pstmt = con.prepareStatement(strQuery);
    		rs = pstmt.executeQuery();
    	
    		while (rs.next()) {
    			AffinityQuestionBean AQB = new AffinityQuestionBean();
    			AQB.setQN(rs.getString("Question_No"));
    			AQB.setQT(rs.getString("Question_Title"));
    			AQB.setQA1(rs.getString("Question_Answer1"));
    			AQB.setQA2(rs.getString("Question_Answer2"));
    			AQB.setQA3(rs.getString("Question_Answer3"));
    			AQB.setQA4(rs.getString("Question_Answer4"));
    			list.add(AQB);
    		}
    	}
    	catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(con, pstmt, rs);
    	}
    	return list;
    }
    
    public int TravelTypeLength() {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int length = 0;
    	
    	try {
    		con = pool.getConnection();
    		String strQuery = "select Travel_Type from Travel_Data";
    		pstmt = con.prepareStatement(strQuery);
    		rs = pstmt.executeQuery();
    	
    		while (rs.next()) {
    			++length;
    		}
    	}
    	catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(con, pstmt, rs);
    	}
    	return length;
    }
    
    public boolean UpdateUserAffinity(String MAX, String ID) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update User_Data set User_Travel_Affinity=? where User_ID=?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, MAX);
            pstmt.setString(2, ID);
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
}
