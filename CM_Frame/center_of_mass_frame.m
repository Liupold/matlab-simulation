## Center of mass frame. (evolution of center of mass)
## Author:  <rohnch@Luna>
## Created: 2020-09-23
pause on;
m1 = 1; m2 = 2;
x1 = -3; x2 = 0;
y1 = -3; y2 = 0;

function [x_cm, y_cm] = get_center_of_mass(m1, m2, x1, y1, x2, y2)
        x_cm = (m1 * x1 + m2 * x2) / (m1 + m2);
        y_cm = (m1 * y1 + m2 * y2) / (m1 + m2);
endfunction

hold on;
xlim([-10 10]); ylim([-5 5]);

particle_1 = plot(x1, y1, 'o');
set (particle_1, 'linewidth', m1);
particle_2 = plot(x2, y2, 'o');
set (particle_2, 'linewidth', m2);
[x_cm, y_cm] = get_center_of_mass(m1, m2, x1, y1, x2, y2);
particles_cm = plot(x_cm, y_cm, 'x');
legend("Light Particle", "Heavy Particle", "Center of mass");

% how CM chage with mass,
title("Center of mass w.r.t mass proportion.")
for m2 = 1:10
        set (particle_2, 'linewidth', m2);
        [x_cm, y_cm] = get_center_of_mass(m1, m2, x1, y1, x2, y2);
        set (particles_cm, 'XData', x_cm);
        set (particles_cm, 'YData', y_cm);
        pause(0.5);
endfor
m2 = 2;
set (particle_2, 'linewidth', m2);

% how CM chage with position of the light particle,
title("Center of mass w.r.t movement of light particle")
for _ = 1:10
        x1 += 1; y1 += 1;
        [x_cm, y_cm] = get_center_of_mass(m1, m2, x1, y1, x2, y2);
        set (particle_1, 'XData', x1);
        set (particle_1, 'YData', y1);
        set (particles_cm, 'XData', x_cm);
        set (particles_cm, 'YData', y_cm);
        pause(0.5);
endfor
