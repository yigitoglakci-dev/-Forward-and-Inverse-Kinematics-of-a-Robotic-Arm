function J = numerical_jacobian(f, thetas)
    n = length(thetas);
    f0 = f(thetas);
    p0 = f0(:, end);  % uç efektör konumu
    J = zeros(3, n);
    delta = 1e-5;

    for i = 1:n
        thetas_ = thetas;
        thetas_(i) = thetas_(i) + delta;
        fi = f(thetas_);
        pi = fi(:, end);
        J(:, i) = (pi - p0) / delta;
    end
end
