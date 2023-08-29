package menu_controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class MenuDao {
	private Connection connection;

	public MenuDao() throws ClassNotFoundException, SQLException {
		Class.forName("hogehoge");
		String url = "hogehoge";
		String user = "hogehoge";
		String password = "hogehoge";
		connection = DriverManager.getConnection(url, user, password);
	}

	// データベースとの切断するメソッド
	public void close() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}

	public ArrayList<String> getMenuList(String all) throws SQLException {
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		ArrayList<String> menuList = new ArrayList<String>();
		try {
			// SQLを保持するPreparedStatementオブジェクトの生成
			String sql = "SELECT menu_list.menu_name, \n" + "eating_genre_list.genre_name,\n"
					+ "eating_category_list.category_name FROM eating_genre_list\n" + "JOIN menu_list \n"
					+ "ON eating_genre_list.genre_id = menu_list.eating_genre_id\n" + "JOIN eating_category_list \n"
					+ "ON menu_list.eating_category_id = eating_category_list.category_id\n"
					+ "ORDER BY RAND() LIMIT 1";
			pstatement = connection.prepareStatement(sql);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				menuList.add(rs.getString("menu_name"));
			}
			// ResultSetオブジェクトの解放
			rs.close();
		} catch (NullPointerException e) {
			e.printStackTrace();
		} finally {
			// PreparedStatementの解放
			pstatement.close();
		}
		return menuList;
	}

	public ArrayList<String> getDetailList(HttpServletRequest request) throws SQLException {
		String[] genre = request.getParameterValues("genre");
		String[] category = request.getParameterValues("category");
		int count = Integer.parseInt(request.getParameter("count"));
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		ArrayList<String> menuList = new ArrayList<String>();
		try {
			String sqlAdd = "WHERE (";
			for (int i = 0; i < genre.length; i++) {
				if (i == genre.length - 1) {
					sqlAdd += "genre_name = '" + genre[i] + "') ";
				} else {
					sqlAdd += "genre_name = '" + genre[i] + "' OR ";
				}
			}
			sqlAdd += "AND (";
			for (int i = 0; i < category.length; i++) {
				if (i == category.length - 1) {
					sqlAdd += "category_name = '" + category[i] + "')";
				} else {
					sqlAdd += "category_name = '" + category[i] + "' OR ";
				}
			}
			String sql = "SELECT menu_list.menu_name, \n" + "eating_genre_list.genre_name,\n"
					+ "eating_category_list.category_name FROM eating_genre_list\n" + "JOIN menu_list \n"
					+ "ON eating_genre_list.genre_id = menu_list.eating_genre_id\n" + "JOIN eating_category_list \n"
					+ "ON menu_list.eating_category_id = eating_category_list.category_id \n"
					+ sqlAdd
					+" ORDER BY RAND() LIMIT ?";
			pstatement = connection.prepareStatement(sql);
			// INパラメータは以下の通り
			pstatement.setInt(1,count);
			// SQL発行し、抽出結果が格納されたResultSetオブジェクトから値を取得
			rs = pstatement.executeQuery();
			while (rs.next()) {
				menuList.add(rs.getString("menu_name"));
			}
			// ResultSetオブジェクトの解放
			rs.close();
		} catch (NullPointerException e) {
			e.printStackTrace();
		} finally {
			// PreparedStatementの解放
			pstatement.close();
		}
		return menuList;
	}

}
