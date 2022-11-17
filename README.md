# EE2742_project
Elevator control

The system has 4 inputs and 4 outputs.
Inputs
First floor – It represents a button located inside the elevator or on the first floor that signals a request to send the elevator to the first floor, from any floor. Use SW1.

Second floor - It represents a button located inside the elevator or on the second floor that signals a request to send the elevator to the second floor, from any floor. Use SW2.

Third floor - It represents a button located inside the elevator or on the third floor that signals a request to send the elevator to the third floor, from any floor. Use SW3.

Door blocked – It represents the output of a sensor that detects that an object is in the door’s way while the door is closing. Use SW4.
Outputs
Location – 3 LEDs indicate the floor at which the elevator is located. Each LED will correspond to a floor. Use LD7, LD8, and LD9 for floors 1, 2, and 3, respectively.

Door open - When this output equals logic 1, it indicates the elevator door is open. Use LD10.

Details about the design
•	System states indicate conditions such as elevator is at 1st floor and door is open.
•	The elevator should remain at rest until someone presses a button. The door is closed in a rest state.
•	If someone presses the first-floor button, then the elevator should go to the 1st floor, open the door and remain on this floor with the door open for a small amount of time, then close the door. Assume the elevator takes one clock cycle to travel from one floor to an adjacent floor and that the door stays open for two clock cycles.
•	The same behavior will apply to the other floors’ input buttons.
•	The elevator has a safety feature associated with the doors. If the door is closing and a sensor detects that an object is in the door’s way, then the door remains in the open position.
•	Other behaviors for the elevator should be reasonable.
•	Use BTND for the clock signal.
