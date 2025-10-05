function draw_end_effector_axes(app, T)
    origin = T(1:3, 4);       % Pozisyon
    R = T(1:3, 1:3);          % Yönelim (rotation matrix)
    L = 200;                  % Ok uzunluğu

    % X ekseni (k)
    quiver3(app.UIAxes, origin(1), origin(2), origin(3), ...
        R(1,1)*L, R(2,1)*L, R(3,1)*L, 'Color', 'r', 'LineWidth', 2, 'MaxHeadSize', 2);

    % Y ekseni (y)
    quiver3(app.UIAxes, origin(1), origin(2), origin(3), ...
        R(1,2)*L, R(2,2)*L, R(3,2)*L, 'Color', 'g', 'LineWidth', 2, 'MaxHeadSize', 2);

    % Z ekseni (m)
    quiver3(app.UIAxes, origin(1), origin(2), origin(3), ...
        R(1,3)*L, R(2,3)*L, R(3,3)*L, 'Color', 'b', 'LineWidth', 2, 'MaxHeadSize', 2);
end
