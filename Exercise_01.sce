clc; clear; //clears all previously stored variables

function Vn = capital(V0, r, n ,c)
    if n == 1 then  //this is just to check whether there are one or more periods
        y=' year';  //so at the function can return a nice solution 
    else            
        y=' years';
    end
    if r <= 0 then //it is controlled for negative rate, and a hint is displayed
        disp("Interest rate should be greater then 0%");    
        Vn=""; //it is needed to assign some value to funtion output
    elseif V0 <= 0 then //same as above, only for initial wealth
        disp("Initial Value should be greater then 0!");
        Vn="";
    elseif c == 0 then //since two different ways to calculate are provided, a differention is made between what is the value of c. Of "c" equals 0, then it is calculated with simple rate 
        Vn = V0*(1+r)^n; //actual calculation of the capital after n year(s)
        disp("After "+string(n)+string(y)+" at a rate of "+string(r*100)+"%, capital will be "+string(Vn)+" (discrete calculation)"); //result is displayed
    elseif c == 1 then //if "c" eguals 1 it is calculated with continuous rate
        Vn = V0*exp(r*n); //actual calculation of the capital after n year(s)
        disp("After "+string(n)+string(y)+" at a rate of "+string(r*100)+"%, capital will be "+string(Vn)+" (continuous calculation)"); //result is displayed
    else
        disp("Please choose calculation method properly: c=0 for discrete and c=1 for continuous calculation!") //if "c" is not specified or specified incorrectly, then there is a message, that explains how "c" can be chosen, respectively to the calculation method
        Vn=""; //as above, there needs to be assigned some value to the function resulte, so Scilab does not return an error message.           
    end
endfunction

V0=1000; r=0.05; n=10; c=0; //prespecified values are assigned to variables

Vn=capital(V0, r, n, c); //function "capital" is called with prespecified values for the variables from above.

