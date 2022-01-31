# APPM5720-RDW
Modeling of Rotating Detonation Waves

## Status of project

The main.m file is divided into three sections
* Generating data using Lotka-Volterra Equations
* DMD analysis
* Koopman analysis

Since Thariq/David cannot work on sections 2 or 3 without some data to play with, I've made an outline of Section 1.
As of now, the data is generated in section 1 by calling the LV function in the LV.m file. The LV.m file currently just returns a dataset that approximately resembles Fig 6b from the paper by using sines and cosines instead of the Lotka-Volterra equations. Meilan can edit the LV function to actually use the Lotka-Volterra equations instead at her pace.