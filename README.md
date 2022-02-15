# APPM5720-RDW
Modeling of Rotating Detonation Waves. Please refer to this paper for details: [https://arxiv.org/abs/2008.05586](https://arxiv.org/abs/2008.05586)
More info on the variable projection method used in the optimized DMD algorithm can be found here: [https://arxiv.org/abs/1704.02343](https://arxiv.org/abs/1704.02343)

The code uses Lotka-Volterra equations to approximately model the dynamics of the roating detonation wave engine with three wavefronts. The data generated using the Lotka-Volterra equations is in turn used to train a Dynamic Mode Decompositon model.