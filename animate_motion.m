function animate_motion(app, start_thetas, target_thetas, steps)
    for i = 1:steps
       
        thetas = start_thetas + (target_thetas - start_thetas) * (i / steps);

        % Pozisyonları al
        positions = forward_kinematics_positions(thetas);

        % UIAxes temizle
        cla(app.UIAxes);
        hold(app.UIAxes, 'on');

        % Robot kol çizimi
        plot3(app.UIAxes, positions(1,:), positions(2,:), positions(3,:), ...
            '-o', 'LineWidth', 2, 'MarkerSize', 6, 'Color', [0 0.4470 0.7410]);

        % Etiketler
        for j = 1:6
            txt = ['Joint ', num2str(j)];
            text(app.UIAxes, positions(1,j), positions(2,j), positions(3,j)+50, txt, ...
                'FontSize', 9, 'Color', 'black');
        end

        % Uç efektörü vurgula
        plot3(app.UIAxes, positions(1,end), positions(2,end), positions(3,end), ...
            'rp', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
        text(app.UIAxes, positions(1,end), positions(2,end), positions(3,end)+50, ...
            'End Effector', 'FontSize', 10, 'Color', 'red', 'FontWeight', 'bold');

        xlabel(app.UIAxes, 'X'); ylabel(app.UIAxes, 'Y'); zlabel(app.UIAxes, 'Z');
        grid(app.UIAxes, 'on');
        title(app.UIAxes, 'KUKA KR 5 sixx R650 Robot Kolu (Animasyon)');
        axis(app.UIAxes, 'equal');
        view(app.UIAxes, 3);
        xlim(app.UIAxes, [-2000 2000]);
        ylim(app.UIAxes, [-2000 2000]);
        zlim(app.UIAxes, [0 3000]);

        hold(app.UIAxes, 'off');
        pause(0.03); % animasyon hızı (30ms)
    end
end
