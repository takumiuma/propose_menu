package menu_controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MenuServlet
 */
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MenuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/menuForm.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String message = null;
		String all = request.getParameter("全検索");
		String detail = request.getParameter("詳細検索");
		String[] genre = request.getParameterValues("genre");
		String[] category = request.getParameterValues("category");
		if (all == null && detail == null) {
			message = "不正アクセスです";
			request.setAttribute("message", message);

		} else {
			try {
				if (all != null) {
					MenuDao dao = new MenuDao();
					ArrayList<String> menuList = dao.getMenuList(all);
					request.setAttribute("menuList", menuList);
					dao.close();

				} else if (genre == null || category == null) {
					message = "少なくともジャンルかカテゴリに１つずつチェックをつけてください";
					request.setAttribute("message", message);
					
				} else if (detail != null) {
					MenuDao dao = new MenuDao();
					ArrayList<String> menuList = dao.getDetailList(request);
					request.setAttribute("menuList", menuList);
					dao.close();

				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		}
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/menuForm.jsp");
		dispatcher.forward(request, response);

	}

}
