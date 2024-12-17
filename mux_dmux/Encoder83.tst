//Test Stimulus file for Encoder83 Chip

load Encoder83.hdl,
output-file Encoder83.out,
compare-to Encoder83.cmp,
output-list a%B2.8.2 out%B2.3.2 idle%B2.1.2;


set a %B10000000,
eval,
output;

// Build more testcases below to fully test the functionality
