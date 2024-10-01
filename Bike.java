package com.hexaware.concreteclass;
import com.hexaware.abstractclass.*;

public class Bike extends Vehicle {
	public Bike(String name, double price) {
        super(name, price);
    }

    @Override
    public void rentVehicle() {
        System.out.println("Bike rented successfully. Rental price: $" + getPrice());
        setAvailability(false);
    }

    @Override
    public void returnVehicle() {
        System.out.println("Bike returned successfully.");
        setAvailability(true);
    }

}
