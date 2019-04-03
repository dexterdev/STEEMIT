%matplotlib inline
from __future__ import print_function
import numpy as np
import matplotlib.pyplot as plt
import simtk.openmm as mm
#Imported numpy, plotting libraries and openmm

def run_simulation(n_steps=10000):
    "Simulate a single particle in the double well"
    system = mm.System()
    system.addParticle(1)# added particle with a unit mass
    force = mm.CustomExternalForce('2*(x-1)^2*(x+1)^2 + y^2')# defines the potential
    force.addParticle(0, [])
    system.addForce(force)
    integrator = mm.LangevinIntegrator(500, 1, 0.02)% Langevin integrator with 500K temperature, gamma=1, step size = 0.02
    context = mm.Context(system, integrator)
    context.setPositions([[0, 0, 0]])
    context.setVelocitiesToTemperature(500)
    x = np.zeros((n_steps, 3))
    for i in range(n_steps):
        x[i] = context.getState(getPositions=True).getPositions(asNumpy=True)._value
        integrator.step(1)
    return x

trajectory = run_simulation(25000)

ylabels = ['x', 'y']
for i in range(2):
    plt.subplot(2, 1, i+1)
    plt.plot(trajectory[:, i])
    plt.ylabel(ylabels[i])
plt.xlabel('Simulation time')
plt.show()

plt.hist2d(trajectory[:, 0], trajectory[:, 1], bins=(25, 25), cmap=plt.cm.jet)
plt.show()
