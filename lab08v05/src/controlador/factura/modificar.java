package controlador.factura;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controlador.factura.PMF;
import modelo.acceso.Acceso;
import modelo.factura.*;
import modelo.recurso.Recurso;
import modelo.usuario.Usuario;
@SuppressWarnings("serial")
public class modificar  extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");

		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();

		if(user == null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));}
		else if(us.isUserAdmin() || accesoRecurso(user.getEmail(),req.getRequestURI())){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			try {

				String codigo = req.getParameter("codigo");
				Long codigoLong = Long.parseLong(codigo); 
				Factura fac = pm.getObjectById(Factura.class,codigoLong);
				req.setAttribute("factura",fac);
				req.getRequestDispatcher("/WEB-INF/Vistas/Factura/modificar.jsp").forward(req, resp);

			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				pm.close();
			}
		}
		else {

			try {
				req.getRequestDispatcher("/WEB-INF/Vistas/AccesoDenegado.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
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



	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			//Realizar la persistencia
		String codigo = req.getParameter("codigo");
		String nombre = req.getParameter("nombre");
		String descripcion = req.getParameter("descripcion");
		Double monto =Double.parseDouble(req.getParameter("monto")); 
		String direccion = req.getParameter("direccion");
		String estado=req.getParameter("estado");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Long codigoLong = Long.parseLong(codigo);
			
			Factura fac = pm.getObjectById(Factura.class,codigoLong);
			fac.setCustomer(nombre);
			fac.setPension(descripcion);
			fac.setPrice(monto);
			fac.setAddress(direccion);
			if (estado.equals("c")) {
				fac.setStatus(true);
				
			}else if(estado.equals("p")){
				fac.setStatus(false);
				}else{
				fac.setStatus(true);
			}
			fac.setDate();			
		
			
		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
			resp.sendRedirect("/factura");
	}
}

