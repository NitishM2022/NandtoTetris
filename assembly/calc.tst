// Filename = calc.tst

load calc.asm,
output-file calc.out,
compare-to calc.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2 RAM[4]%D2.6.2 RAM[1024]%D2.6.2;

set RAM[0] 1, // Set test arguments
set RAM[1] 2,
set RAM[2] 1,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] 1,   // Restore arguments in case program used them as loop counter
set RAM[1] 2,
set RAM[2] 1,
output;

set PC 0,
set RAM[0] 2, // Set test arguments
set RAM[1] 1,
set RAM[2] 2,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] 2,   // Restore arguments in case program used them as loop counter
set RAM[1] 1,
set RAM[2] 2,
output;

//added test
set PC 0,
set RAM[0] 2, // Set test arguments
set RAM[1] -1,
set RAM[2] 2,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] 2,   // Restore arguments in case program used them as loop counter
set RAM[1] -1,
set RAM[2] 2,
output;

set PC 0,
set RAM[0] -1,  // Set test arguments
set RAM[1] 2,
set RAM[2] 3,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] -1,   // Restore arguments in case program used them as loop counter
set RAM[1] 2,
set RAM[2] 3,
output;


//added test
set PC 0,
set RAM[0] 2,  // Set test arguments
set RAM[1] -1,
set RAM[2] 3,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] 2,   // Restore arguments in case program used them as loop counter
set RAM[1] -1,
set RAM[2] 3,
output;

//added test
set PC 0,
set RAM[0] 4,  // Set test arguments
set RAM[1] 10,
set RAM[2] 3,  
set RAM[3] 0; // Test that program initialized to 0
repeat 250 {
  ticktock;
}
set RAM[0] 4,   // Restore arguments in case program used them as loop counter
set RAM[1] 10,
set RAM[2] 3,
output;

set PC 0,
set RAM[0] 5, // Set test arguments
set RAM[1] 2,
set RAM[2] 4,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] 5,   // Restore arguments in case program used them as loop counter
set RAM[1] 2,
set RAM[2] 4,
output;

//added test
set PC 0,
set RAM[0] 5, // Set test arguments
set RAM[1] 7,
set RAM[2] 4,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] 5,   // Restore arguments in case program used them as loop counter
set RAM[1] 7,
set RAM[2] 4,
output;

//added test
set PC 0,
set RAM[0] 20, // Set test arguments
set RAM[1] 5,
set RAM[2] 4,  
set RAM[3] 0; // Test that program initialized to 0
repeat 100 {
  ticktock;
}
set RAM[0] 20,   // Restore arguments in case program used them as loop counter
set RAM[1] 5,
set RAM[2] 4,
output;

// check if they handle incorrect inputs

set PC 0,
set RAM[0] -1,
set RAM[1] -1,
set RAM[2] 3,  
set RAM[3] 0; 
repeat 100 {
  ticktock;
}
set RAM[0] -1,   // Restore arguments in case program used them as loop counter
set RAM[1] -1,
set RAM[2] 3,
output;

set PC 0,
set RAM[0] 1,
set RAM[1] -1,
set RAM[2] 4,  
set RAM[3] 0; 
repeat 100 {
  ticktock;
}
set RAM[0] 1,   // Restore arguments in case program used them as loop counter
set RAM[1] -1,
set RAM[2] 4,
output;