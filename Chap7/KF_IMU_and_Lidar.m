%% ==========================================================================
%%  3D Integrated Navigation for UGV: IMU (2ms) + LiDAR-SLAM (100ms)
%%  Hybrid Kalman Filter Simulation
%%  Trajectory: Elliptical motion in XY-plane + Sinusoidal terrain in Z-axis
%% ==========================================================================
clear; clc; close all;

%% ===================== 1. System Parameters =====================
T_imu     = 0.002;        % IMU sampling period: 2 ms
T_slam    = 0.100;        % SLAM sampling period: 100 ms
N_imu     = T_slam / T_imu;  % 50 IMU steps between two SLAM updates
t_end     = 30;           % Total simulation time: 30 s
t         = 0:T_imu:t_end;
N         = length(t);

%% ===================== 2. 3D Complex Trajectory Generation =====================
% Elliptical trajectory in XY-plane
a_x = 50;    a_y = 30;    w = 0.2;
% Sinusoidal terrain height in Z-axis
A_z = 5;     b_z = 10;    w_z = 0.5;

x_true     = a_x * cos(w*t);
y_true     = a_y * sin(w*t);
z_true     = A_z * sin(w_z*t) + b_z;
vx_true    = -a_x*w * sin(w*t);
vy_true    =  a_y*w * cos(w*t);
vz_true    =  A_z*w_z * cos(w_z*t);

% True state matrix: 6xN
X_true = [x_true; y_true; z_true; vx_true; vy_true; vz_true];

%% ===================== 3. Generate SLAM Measurements (100ms) =====================
R = diag([0.09, 0.09, 0.16]);    % SLAM measurement noise covariance
Z_slam = NaN(3, N);             % Initialize as NaN (avoid zero line in plot)
for k = 1:N_imu:N
    Z_slam(:,k) = X_true(1:3,k) + sqrt(R)*randn(3,1);
end

%% ===================== 4. Filter Model =====================
% State transition matrix F (6x6)
F = [1 0 0 T_imu 0 0;
     0 1 0 0 T_imu 0;
     0 0 1 0 0 T_imu;
     0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1];

% Process noise covariance Q
Qc  = diag([0.25, 0.25, 0.36]);
Q_imu = zeros(6,6);
Q_imu(4:6,4:6) = Qc * T_imu;

% Measurement matrix H (3x6)
H = [1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 1 0 0 0];

% Initial conditions
X_est = zeros(6,N);
P_est = zeros(6,6,N);
X_est(:,1) = [50, 0, 10, 0, 6, 2.5]';
P_est(:,:,1) = diag([1,1,1,0.25,0.25,0.25]);

%% ===================== 5. Hybrid Kalman Filter =====================
for k = 2:N
    % -------------------- High-frequency IMU Prediction (2ms) --------------------
    X_est(:,k) = F * X_est(:,k-1);
    P_est(:,:,k) = F*P_est(:,:,k-1)*F' + Q_imu;

    % -------------------- Low-frequency SLAM Correction (100ms) --------------------
    if mod(k-1, N_imu) == 0
        zk = Z_slam(:,k);
        S = H*P_est(:,:,k)*H' + R;
        K = P_est(:,:,k)*H' / S;
        % State update
        X_est(:,k) = X_est(:,k) + K*(zk - H*X_est(:,k));
        % Covariance update
        P_est(:,:,k) = (eye(6)-K*H)*P_est(:,:,k);
    end
end

%% ===================== 6. Error Calculation =====================
pos_err = sqrt(mean( (X_est(1,:)-X_true(1,:)).^2 + ...
                    (X_est(2,:)-X_true(2,:)).^2 + ...
                    (X_est(3,:)-X_true(3,:)).^2 ));
vel_err = sqrt(mean( (X_est(4,:)-X_true(4,:)).^2 + ...
                    (X_est(5,:)-X_true(5,:)).^2 + ...
                    (X_est(6,:)-X_true(6,:)).^2 ));

fprintf('=========================================\n');
fprintf('Position RMSE = %.4f m\n', pos_err);
fprintf('Velocity RMSE = %.4f m/s\n', vel_err);
fprintf('=========================================\n');

%% ===================== 7. Plot Results =====================
figure('Position',[50,50,1200,800]);

% 3D trajectory
subplot(2,3,[1 4]);
plot3(x_true,y_true,z_true,'b-','LineWidth',1.8); hold on;
plot3(X_est(1,:),X_est(2,:),X_est(3,:),'r--','LineWidth',1.5);
scatter3(Z_slam(1,:),Z_slam(2,:),Z_slam(3,:),6,'k','filled');
xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
legend('True','Fused Estimate','SLAM Observation');
title('3D Trajectory: Elliptical Motion + Sinusoidal Terrain'); grid on;

% X position
subplot(2,3,2);
plot(t,x_true,'b-',t,X_est(1,:),'r--',t,Z_slam(1,:),'ko','MarkerSize',3); grid on;
title('X Position'); ylabel('x (m)'); xlabel('Time (s)');
legend('True','Fused','SLAM');

% Y position
subplot(2,3,3);
plot(t,y_true,'b-',t,X_est(2,:),'r--',t,Z_slam(2,:),'ko','MarkerSize',3); grid on;
title('Y Position'); ylabel('y (m)'); xlabel('Time (s)');
legend('True','Fused','SLAM');

% Z position
subplot(2,3,5);
plot(t,z_true,'b-',t,X_est(3,:),'r--',t,Z_slam(3,:),'ko','MarkerSize',3); grid on;
title('Z Position'); ylabel('z (m)'); xlabel('Time (s)');
legend('True','Fused','SLAM');

% X velocity
subplot(2,3,6);
plot(t,vx_true,'b-',t,X_est(4,:),'r--'); grid on;
title('X Velocity'); ylabel('vx (m/s)'); xlabel('Time (s)');
legend('True','Fused');