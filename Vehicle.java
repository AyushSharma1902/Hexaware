package com.hexaware.abstractclass;

public abstract class Vehicle {
	  private String name;
	    private double price;
	    private boolean isAvailable;

	    // Constructor
	    public Vehicle(String name, double price) {
	        this.name = name;
	        this.price = price;
	        this.isAvailable = true;
	    }

	    // Getters
	    public String getName() {
	        return name;
	    }

	    public double getPrice() {
	        return price;
	    }
	    public boolean isAvailable() {
	        return isAvailable;
	    }
	    
	    //Setters
	    public void setAvailability(boolean availability) {
	        isAvailable = availability;
	    }

	    // Abstract methods
	    public abstract void rentVehicle();
	    public abstract void returnVehicle();

}
