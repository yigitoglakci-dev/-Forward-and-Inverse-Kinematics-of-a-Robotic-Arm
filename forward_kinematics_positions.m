function positions = forward_kinematics_positions(thetas)
    d = [400 0 0 515 0 90];
    a = [25 560 30 0 0 0];
    alpha = [pi/2 0 pi/2 -pi/2 pi/2 0];
    
    T = eye(4);
    positions = zeros(3, 7); % 7 nokta (base + 6 eklem)

    positions(:,1) = [0;0;0];

    for i = 1:6
        T_i = dh_transform(thetas(i), d(i), a(i), alpha(i));
        T = T * T_i;
        positions(:,i+1) = T(1:3,4);
    end