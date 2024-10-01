package com.hexaware.concreteclass;
import com.hexaware.abstractclass.*;

public class Car extends Vehicle {
	 public Car(String name, double price) {
	        super(name, price);
	    }

	    @Override
	    public void rentVehicle() {
	        System.out.println("Car rented successfully. Rental price: $" + getPrice());
	        setAvailability(false);
	    }

	    @Override
	    public void returnVehicle() {
	        System.out.println("Car returned successfully.");
	        setAvailability(true);
	    }

}
