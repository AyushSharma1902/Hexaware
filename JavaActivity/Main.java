package com.hexaware.mainclass;
import com.hexaware.concreteclass.*;
import com.hexaware.abstractclass.*;
import com.hexaware.user.*;
import java.util.*;

public class Main {
	public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        User user = new User();

        Vehicle car = new Car("Toyota", 50);
        Vehicle car1=new Car("Tata",150);
        Vehicle bike = new Bike("Honda", 20);
        Vehicle bike1 = new Bike("Hero", 25);
        Vehicle truck = new Truck("Ford", 100);
        Vehicle truck1 = new Truck("Mahindra", 120);

        while (true) {
            System.out.println("Vehicle Rental System");
            System.out.println("1. Rent Vehicle");
            System.out.println("2. Return Vehicle");
            System.out.println("3. Vehicle Availability");
            System.out.println("4. Exit");

            System.out.print("Choose an option: ");
            int option = sc.nextInt();

            switch (option) {
                case 1:
                    System.out.println("Available vehicles:");
                    System.out.println("1.  Toyota Car ($50)");
                    System.out.println("2.  Tata Car ($150)");
                    System.out.println("3. Honda Bike ($20)");
                    System.out.println("4. Hero Bike ($25)");
                    System.out.println("5.  Ford Truck ($100)");
                    System.out.println("6.  Mahindra Truck ($120)");
                    
               
                    

                    System.out.print("Choose a vehicle: ");
                    int vehicleOption = sc.nextInt();

                    switch (vehicleOption) {
                        case 1:
                            user.rentVehicle(car);
                            break;
                        case 2:
                        	user.rentVehicle(car1);
                        	break;
                        	
                        case 3:
                            user.rentVehicle(bike);
                            break;
                        case 4:
                            user.rentVehicle(bike1);
                            break;    
                        case 5:
                            user.rentVehicle(truck);
                            break;
                        case 6:
                            user.rentVehicle(truck1);
                            break;    
                        default:
                            System.out.println("Invalid option.");
                    }
                    break;
                case 2:
                    user.returnVehicle();
                    break;
                    
                case 3:
                	System.out.println("Vehicle Availability:");
                    System.out.println("Toyota Car - " + (car.isAvailable() ? "Available" : "Not Available"));
                    System.out.println("Tata Car - " + (car1.isAvailable() ? "Available" : "Not Available"));
                    System.out.println("Honda Bike - " + (bike.isAvailable() ? "Available" : "Not Available"));
                    System.out.println("Hero Bike - " + (bike1.isAvailable() ? "Available" : "Not Available"));
                    System.out.println(" Ford Truck - " + (truck.isAvailable() ? "Available" : "Not Available"));
                    System.out.println(" Mahindra Truck - " + (truck1.isAvailable() ? "Available" : "Not Available"));
                    break;
                case 4:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid option.");
            }
            
        }
        
       
    }

}

