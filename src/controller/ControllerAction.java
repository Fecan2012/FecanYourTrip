package controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import action.CommandAction;

public class ControllerAction extends HttpServlet {
	private Map commandMap = new HashMap();

	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("propertyConfig");
		System.out.println("Path = " + props);
		Properties pr = new Properties();
		FileInputStream f = null;

		try {
			f = new FileInputStream(props);
			pr.load(f);

		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}

		Iterator keyiter = pr.keySet().iterator();

		while (keyiter.hasNext()) {
			String command = (String) keyiter.next();
			System.out.println("command=" + command);
			String className = pr.getProperty(command);
			System.out.println("className=" + className);
			try {
				Class commandClass = Class.forName(className);
				System.out.println("commandClass=" + commandClass);
				Object commandInstance = commandClass.newInstance();
				System.out.println("commandInstance=" + commandInstance);
				commandMap.put(command, commandInstance);
				System.out.println("commandMap=" + commandMap);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null;
		CommandAction com = null;
		try {
			String command = request.getRequestURI();
			System.out.println("request.getRequestURI()=" + request.getRequestURI());
			System.out.println("request.getContextPath()=" + request.getContextPath());
			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
				System.out.println("command=" + command);
			}
			com = (CommandAction) commandMap.get(command);
			System.out.println("com=" + com);
			view = com.requestPro(request, response);
			System.out.println("view=" + view);
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
