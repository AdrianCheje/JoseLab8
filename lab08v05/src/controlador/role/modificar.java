package controlador.role;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controlador.usuario.PMF;
import modelo.acceso.Acceso;
import modelo.recurso.Recurso;
import modelo.role.*;
import modelo.usuario.Usuario;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

@SuppressWarnings("serial")
public class modificar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");


		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();

		if(user == null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));}
		else if(us.isUserAdmin() || accesoRecurso(user.getEmail(),req.getRequestURI())){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			try {

				String id = req.getParameter("id");
				Long idLong = Long.parseLong(id); 
				Role rol = pm.getObjectById(Role.class,idLong);
				req.setAttribute("role",rol);
				req.getRequestDispatcher("/WEB-INF/Vistas/Role/modificar.jsp").forward(req, resp);

			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				pm.close();
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

		//Realizar la persistencia
		String id = req.getParameter("id");
		String nombre = req.getParameter("nombre");
		String estado = req.getParameter("estado");
		Date fecha = new Date();

		PersistenceManager pm = PMF.get().getPersistenceManager();

		try{
			Long idLong = Long.parseLong(id);
			boolean estadoBool = Boolean.parseBoolean(estado);

			Role prof = pm.getObjectById(Role.class,idLong);
			prof.setNombre(nombre.toUpperCase());
			prof.setFecha(fecha);
			prof.setEstado(estadoBool);

		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
		resp.sendRedirect("/roles");
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

