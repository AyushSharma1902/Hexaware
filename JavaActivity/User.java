package com.hexaware.user;
import com.hexaware.abstractclass.*;

public class User {
	private Vehicle rentedVehicle;

	public void rentVehicle(Vehicle vehicle) {
        if (vehicle.isAvailable()) {
            rentedVehicle = vehicle;
            vehicle.rentVehicle();
        } else {
            System.out.println("Vehicle is not available.");
        }
    }

    public void returnVehicle() {
        if (rentedVehicle != null) {
            rentedVehicle.returnVehicle();
            rentedVehicle = null;
        } else {
            System.out.println("No vehicle rented.");
        }
    }
	


}
