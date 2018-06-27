package controlador.factura;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controlador.usuario.PMF;
import modelo.acceso.Acceso;
import modelo.factura.*;
import modelo.recurso.Recurso;
import modelo.usuario.Usuario;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

/*import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar	;
import java.util.GregorianCalendar;
import java.util.TimeZone;	+'*/


public class insertar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();

		if(user == null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));}
		else if(us.isUserAdmin() || accesoRecurso(user.getEmail(),req.getRequestURI())){
			try {
				req.getRequestDispatcher("/WEB-INF/Vistas/Factura/insertar.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
		else {

			try {
				req.getRequestDispatcher("/WEB-INF/Vistas/AccesoDenegado.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	   
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		/*TimeZone tz = TimeZone.getTimeZone ("America / Lima");
		Calendar calendar=new GregorianCalendar(tz);	
		
		DateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		   String da=dateformat.format(calendar.getTime()).toString();*/
		
		String customer = req.getParameter("nombre");
		String pension = req.getParameter("descripcion");
		Double price = Double.parseDouble(req.getParameter("monto"));
		String address = req.getParameter("direccion");
	

		PersistenceManager pm = PMF.get().getPersistenceManager();
	
		Factura fac = new Factura(customer, pension, price, address);
		
		try{
			pm.makePersistent(fac);
			}
		finally{
			pm.close();
		}
			resp.sendRedirect("/factura");
	}
	private boolean accesoRecurso(String gmail,String url){

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Usuario.class);
		query.setFilter("email == idParam");
		query.declareParameters("String idParam");

		List<Usuario> array = (List<Usuario>) query.execute(gmail);

		if(array.size()> 0 ){

			Usuario usuario = array.get(0);
			Query query1 = pm.newQuery(Recurso.class);
			query1.setFilter("url == idParam");
			query1.declareParameters("String idParam");

			List<Recurso> arrayRecurso = (List<Recurso>)query1.execute(url);


			if(arrayRecurso.size() > 0 ){

				Recurso recurso = arrayRecurso.get(0);

				Long idRol = usuario.getIdRol();
				Long idRecurso = recurso.getId();

				Query query2 = pm.newQuery(Acceso.class);
				query2.setFilter("idRole == idParam && idRecurso == idParam2");
				query2.declareParameters("Long idParam , Long idParam2");
				System.out.println("das");

				List<Acceso> arrayAcceso = (List<Acceso>)query2.execute(idRol,idRecurso);

				if(arrayAcceso.size()>0){
					Acceso acceso = arrayAcceso.get(0);
					if(acceso.isEstado()){
						pm.close();
						return true;
					}
				}
			}

		}
		pm.close();
		return false;
	}
}





