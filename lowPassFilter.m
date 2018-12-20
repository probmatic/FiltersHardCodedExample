clc
clear

w = -24000*pi:10:24000*pi;

w1 = w -(16000*pi); %shift right
w2 = w + (16000*pi); %shift left

x_w = rectangularPulse(((w/(16000*pi))));
x_w1 = triangularPulse(((w1/(8000*pi))));
x_w2 = triangularPulse(((w2/(8000*pi))));
z_w = x_w + x_w1 + x_w2;

plot (w, z_w, 'b');

grid on
hold on

z_f = z_w.*x_w; %By multiplying the parts of the graph where these two don't overlap by 0, result will be the low pass filter
plot (w, z_f, 'r'); %low pass filter shows up in red

hold off
