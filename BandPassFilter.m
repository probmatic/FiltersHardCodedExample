clc
clear

w = -30000*pi:10:30000*pi;

w1 = w -(16000*pi); %shift right
w2 = w + (16000*pi); %shift left

x_w = rectangularPulse(((w/(16000*pi))));
x_w1 = triangularPulse(((w1/(8000*pi))));
x_w2 = triangularPulse(((w2/(8000*pi))));


z_w = x_w + x_w1 + x_w2;
subplot(3,1,1);
plot (w, z_w, 'g'); %original graph with no filters applied



f_bp = rectangularPulse(((w1/(16000*pi)))) + rectangularPulse(((w2/(16000*pi))));
subplot(3,1,2);
plot(w, f_bp, 'b'); %filter being applied graphed




z_f = z_w.*f_bp; %By multiplying the parts of the graph where these two don't overlap by 0, result will be the low pass filter
subplot(3,1,3);
plot (w, z_f, 'r'); %Function being passed through the filter

