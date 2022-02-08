# APPM5720-RDW
Modeling of Rotating Detonation Waves

## Status of project

The main.m file is divided into three sections
* Generating data using Lotka-Volterra Equations
* DMD analysis
* Koopman analysis

Since Thariq/David cannot work on sections 2 or 3 without some data to play with, I've made an outline of Section 1.
As of now, the data is generated in section 1 by calling the LV function.
The LV function currently returns a dataset that approximately resembles Fig 6b from the paper by using sines and cosines instead of the Lotka-Volterra equations. See figures below.

![Alt text](images/dummy_data.jpg?raw=true "Title")
![Alt text](images/real_data.jpg?raw=true "Title")


Meilan can edit the LV function to actually use the Lotka-Volterra equations instead at her pace.
Meanwhile, Thariq and David can work with the dummy data for DMD/Koopman stuff until the Lotka-Volterra equations are ready.

@Meilan: Please make sure to maintain the format of the output of the LV() function so that it doesn't break Thariq's or David's code when you merge your code to the repository. 
I suggest we all make a new git branch to work on our part of the project and merge it to the main branch when it's ready to avoid conflicts. (The DMD code is in the DMD branch, for example. I'm ironing out some issues before merging.)

02/08 Update: Added a simple implementation of the volterra equations as I ran into some anomalies with the dummy data, which I discussed with Prof. Bortz on Thursday. I cannot proceed with the DMD code without more realistic data, so working with actual Lotka-Volterra equations for now.
