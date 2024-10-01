package com.hexaware.concreteclass;
import com.hexaware.abstractclass.*;

public class Truck extends Vehicle {
	 public Truck(String name, double price) {
	        super(name, price);
	    }

	    @Override
	    public void rentVehicle() {
	        System.out.println("Truck rented successfully. Rental price: $" + getPrice());
	        setAvailability(false);
	    }

	    @Override
	    public void returnVehicle() {
	        System.out.println("Truck returned successfully.");
	        setAvailability(true);
	    }
	

}
