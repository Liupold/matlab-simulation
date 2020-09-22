% Nature of particle from random numbers.
% Rohn Chatterjee
num_of_particle=100000;
quantum_count_of_time = 500000;
PARTICLE_BOX = ones(2, num_of_particle);
PARTICLE_BOX(2,:) = -1;
PARTICLE_DETECTOR = [num_of_particle; 0];
PARTICLE_DETECTED_T = zeros(1, quantum_count_of_time);
delta_t = 1e-8;
rand_nums = randi(num_of_particle, 1, quantum_count_of_time);
for n = 1:quantum_count_of_time;
        particle_num = rand_nums(n);
        PARTICLE_BOX(:, particle_num) *= -1; % change side
        PARTICLE_DETECTOR += PARTICLE_BOX(:, particle_num);
        PARTICLE_DETECTED_T(n) = PARTICLE_DETECTOR(2);
endfor
% figure ("visible", "off");
hold on;
plot(delta_t * [1:quantum_count_of_time], PARTICLE_DETECTED_T);
plot(delta_t * [1:quantum_count_of_time], num_of_particle - PARTICLE_DETECTED_T);
title('Nature of radiation from random movement.');
ylabel('No of particle on right \rightarrow');
xlabel('Time in second(s) \rightarrow'); grid on;
waitfor(gcf);
% print -dpdf radiation_exchnage.pdf
