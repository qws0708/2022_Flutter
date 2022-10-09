
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import math as m

pi =3.141592
a = pi/180

theta1 = 30*a          
theta2 = 60*a

L1 = 0.15               
L2 = 0.12


T0_1 = np.array([[m.cos(theta1), -m.sin(theta1), 0, 0], [m.sin(theta1), m.cos(theta1), 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])    	
T1_2 = np.array([[m.cos(theta2), -m.sin(theta2), 0, L1], [m.sin(theta2), m.cos(theta2), 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
T2_3 = np.array([[1, 0, 0, L2], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])

T0_2 = T0_1@T1_2
T0_3 = T0_1@T1_2@T2_3

Px1_1 = T0_2[0,3]
Py1_1 = T0_2[1,3]

Px1_2 = T0_3[0,3]
Py1_2 = T0_3[1,3]

totall_x = np.array([0, Px1_1, Px1_2])
totall_y = np.array([0, Py1_1, Py1_2])
plt.plot(totall_x, totall_y,'k')
plt.show()



i= ((0.1167)**2 + (0.1990)**2 - ((0.15)**2+(0.12)**2))/(2*L1*L2)
k= (1-(i**2))**(1/2)

theta2_1 = m.atan2(k,i)
theta1_1 = m.atan2(0.1990, 0.1167) -m.atan2(L2*k, L1+L2*i)


error1 = theta1 - theta1_1
eroor2 = theta2 - theta2-1



P1 = np.array([[L1*m.cos(theta1)+L2*m.cos(theta1+theta2)], [L1*m.sin(theta1)+L2*m.sin(theta1+theta2)]])      

jaco = np.array([[-L1*m.sin(theta1)-L2*m.sin(theta1+theta2), -L2*m.sin(theta1+theta2)], [L1*m.cos(theta1)+L2*m.cos(theta1+theta2), L2*m.cos(theta1+theta2)]])

d_theta = np.array([[2*a], [3*a]])

dP = jaco@d_theta

P2 = P1 + dP


px2=P2[0,0]             
py2=P2[1,0]













