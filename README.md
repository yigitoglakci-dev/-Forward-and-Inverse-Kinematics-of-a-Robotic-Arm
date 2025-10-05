This project implements both forward and inverse kinematics of a 6-DOF industrial robotic arm using MATLAB.

Using the Denavit–Hartenberg (DH) convention, the robot’s geometric structure was modeled, and the end-effector position and orientation were computed via MATLAB’s RigidBodyTree framework.

Through a simple GUI interface:

Users can input joint angles to visualize the end-effector position (x, y, z) and orientation (roll, pitch, yaw) in real-time.

Alternatively, they can define a desired target pose, and the system automatically computes the required joint angles via inverse kinematics.


💡 Goal: To create a digital twin of an industrial robot (e.g., KUKA KR500-3) and test control and motion algorithms in a simulation environment.
