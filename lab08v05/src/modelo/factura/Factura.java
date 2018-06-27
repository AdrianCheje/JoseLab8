/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.factura;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;


@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Factura {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long codigo;
    @Persistent private Date date;
    @Persistent private String customer;
    @Persistent private String pension;
    @Persistent private Double price;
    @Persistent private boolean status;
    @Persistent private String address;
    
   public Factura(String customer, String pension,Double price,String address) {
	this.customer=customer;
	this.pension=pension;
	this.price=price;
	this.address=address;
	TimeZone tz = TimeZone.getTimeZone ("Asia / Tokio");
	Calendar calendar=new GregorianCalendar(tz);	
	this.date=(Date) calendar.getTime();
	this.status=true;
	
	
}
    public void setAddress(String address) {
		this.address = address;
	}
    public void setCustomer(String customer) {
		this.customer = customer;
	}
    public void setPrice(Double price) {
		this.price = price;
	}
    public void setPension(String pension) {
		this.pension = pension;
	}
    public void setStatus(boolean status) {
			this.status=status;
	}
   public String getAddress() {
	return address;
}
   public String getCustomer() {
	return customer;
}
   public Double getPrice() {
	return price;
}
   public String getPension() {
	return pension;
}
   public String getStatus(){
	  String Estado="sin estado";
	   if (status==true) {
		    Estado="cancelado";
		
		}else if(status==false){
			    Estado="pendiente";
	
		}
	   return Estado;
   }
   
   public String getDate() {
	DateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");  
	//   DateFormat dateformat=new SimpleDateFormat("dd MMMM 'del' YYYY  HH:mm:s");  

	   String da=dateformat.format(date).toString();
	return da;
}
   public void setDate() {
	   TimeZone tz = TimeZone.getTimeZone ("America / Lima");
		Calendar calendar=new GregorianCalendar(tz);	
		this.date=(Date) calendar.getTime();
}  
   public Long getCodigo() {
	return codigo;
}
}