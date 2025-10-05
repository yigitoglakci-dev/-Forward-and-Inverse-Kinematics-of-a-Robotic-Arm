function thetas = inverse_kinematics(goalPos, initialGuess)
    % Tolerans
    epsilon = 1e-3;
    maxIter = 1000;
    alpha = 0.5;  % öğrenme oranı

    thetas = initialGuess;

    for i = 1:maxIter
        % Mevcut uç pozisyonunu al
        positions = forward_kinematics_positions(thetas);
        currentPos = positions(:, end);

        % Hata vektörü
        error = goalPos - currentPos;

        if norm(error) < epsilon
            return;
        end

        % Sayısal türevle Jacobian tahmini
        J = numerical_jacobian(@forward_kinematics_positions, thetas);

        % Güncelleme (dampingli çözüm)
        deltaTheta = alpha * pinv(J) * error;

        % Açılar güncelleniyor
        thetas = thetas + deltaTheta';
    end

    warning('Geri kinematik çözüm bulunamadı, yakınsama sağlanamadı.');
end
