function [out1, out2] = printhello(in)

disp("Hello world! - outer");

printhello_local();

out1 = in^2;
out2 = in*2;

function printhello_local()

disp("hellow world - inner!");
