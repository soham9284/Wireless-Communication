clc; clear; close all;

k = 25; % Fixed number of channels per cell
N_list = [3 4 7]; % Cluster sizes
M = 4; % Number of reuse clusters
users_without_reuse = k; % Only 1 cell, no reuse
users_with_reuse_list = zeros(size(N_list));
S_list = zeros(size(N_list));

for i = 1:length(N_list)
    N = N_list(i);
    S = k * N; % Total channels in system (per cluster)
    total_cells = M * N;
    users_with_reuse_list(i) = total_cells * k; % Total users served
    S_list(i) = S;
end

%% Plotting
figure;
bar([users_without_reuse users_with_reuse_list], 0.5);
xticklabels({'Without Reuse', 'N=3', 'N=4', 'N=7'});
ylabel('Number of Users Served');
title('Effect of Frequency Reuse on User Capacity');
grid on;

%% Add text above bars
values = [users_without_reuse users_with_reuse_list];
for i = 1:length(values)
    text(i, values(i) + 50, ['Users: ' num2str(values(i))], ...
        'HorizontalAlignment', 'center');
end

%% Print Table
fprintf('Frequency Reuse Comparison (Fixed k = %d channels/cell) \n', k);
fprintf('Without Reuse -> Users Served = %d\n', users_without_reuse);
for i = 1:length(N_list)
    fprintf('With Reuse (N = %d) -> Total Channels = %d, Users Served = %d\n', ...
        N_list(i), S_list(i), users_with_reuse_list(i));
end
