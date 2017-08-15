clc; clear;

function lr = log_returns (data); //function log_return is defined with input data and output lr
    lr = diff(log(data)); //lr is the log difference, function diff substitutes from next value the current one, so data needs to be ordered ascending in date
endfunction

data1 = csvRead('time_series_dax.csv',";",",","",[],[],[],[1]); // data is read, ";" is the separator, "," is the decimal, and [1] tells that first row is the header and is ignored
data = data1($:-1:1, 2); // second column is ordered from bottom to top, as it is needed this way for the diff function and only second column is of interest
lr = log_returns(data); //function log_return is called

scf(0); //figure 0 is selected
clf(); //selected figure is cleared
plot(lr); //lr is plotted
xgrid(1); // grid is added for better visibility

title("log-returns of DAX in the period from 26/11/1990 to 26/10/2015"); //title
xlabel("trading day");  //x axis label
ylabel("log-return");   //y axis label

muh = 250*mean(lr); //annualized empirical mean 
sigma=sqrt(250*variance(lr)); //annualized empirical standard deviation
disp("Annualized mean is " + string(muh) + " and annualized standard deviation is " + string(sigma)); //displays the results

