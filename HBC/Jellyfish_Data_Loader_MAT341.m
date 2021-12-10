function Jellyfish_Data_Loader_MAT341()

%------------------------------------------------------------------------
%
% LOADS JELLYFISH DATA FOR CASE: Re=37.5, f=0.5 Hz, p=0.20
%
%   -> After running the 'load(...)' command below, it will automatically
%           load a matrix DATA that you can use in the remainder of this
%           script
%
%   -> DATA(j,i): each column is specific quantity, 
%                       each row is different time-point
%
%   -> DATA(:,1): first column is time (# of strokes)
%
%   -> DATA(:,2): second column is swimming speed (bodylengths/stroke)
%
%------------------------------------------------------------------------
load('Jellyfish_Data_MAT341.mat'); % loads matrix 'DATA'


%---------------------------------------------------------
% EXAMPLE to show 'DATA' was loaded as described above
%       ---> Plot the swimming speed data
%---------------------------------------------------------
figure(1)
%
lw = 6; % LineWidth
fs= 20; % FontSize
%
plot(DATA(:,1),DATA(:,2),'-','LineWidth',lw); hold on;
xlabel('Time (# of stroke cycles)');
ylabel('Speed (bodylength/stroke)');
title('Jellyfish Swimming Speed');
set(gca,'FontSize',fs);







