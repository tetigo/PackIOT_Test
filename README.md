# PackIOT_Test
A database and system architecture test.

This query is for retrieving information about machines data collect. 

The database required was Postgre 11.

Every machine send data every single minute and all the machines have shifts.

The requirement is for the sum of data per shift for the entire day for the last 7 days.

But just for a specific machine named PRESS.

The query is about it. I've used some views for helping me get the results.

I got stucked for some time when manipulating timestamptz with time all together for retrieving data about a specific shift, but I got it. 

This code could and should be improved, maybe replacing the views by using just the sql directly or using Postgre procedural language.

I will try to change the code in near future for using procedural language as soon as I got proficient about using it because the code became too big.

I have an idea about using the procedural language the code can be very smaller.


<tetigo@gmail.com>


