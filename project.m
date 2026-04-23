clc;
clear;
close all;

t = -10:0.1:10;

while true
    fprintf('\n===== SIGNAL VISUALIZER MENU =====\n');
    fprintf('1. Sine Signal\n');
    fprintf('2. Unit Step Signal\n');
    fprintf('3. Exponential Signal\n');
    fprintf('4. Exit\n');

    choice = input('Enter your choice: ');

    if choice == 4
        disp('Exiting program...');
        break;
    end

    switch choice
        case 1
            x = sin(t);
            signal_name = 'Sine Signal';

        case 2
            x = double(t >= 0);  
            signal_name = 'Unit Step Signal';

        case 3
            x = exp(-abs(t));
            signal_name = 'Exponential Signal';

        otherwise
            disp('Invalid choice!');
            continue;
    end

    fprintf('\n--- OPERATIONS MENU ---\n');
    fprintf('1. Time Shift\n');
    fprintf('2. Amplitude Scaling\n');
    fprintf('3. Time Reversal\n');
    fprintf('4. No Operation\n');

    op = input('Choose operation: ');

   
    switch op
        case 1
            shift = input('Enter shift value (positive = delay): ');
            x_mod = interp1(t, x, t - shift, 'linear', 0);
            op_name = ['Shifted by ', num2str(shift)];

        case 2
            scale = input('Enter scaling factor: ');
            x_mod = scale * x;
            op_name = ['Scaled by ', num2str(scale)];

        case 3
            x_mod = fliplr(x);
            op_name = 'Time Reversed';

        case 4
            x_mod = x;
            op_name = 'Original (No Operation)';

        otherwise
            disp('Invalid operation!');
            continue;
    end

    figure;

    subplot(2,1,1);
    plot(t, x, 'b', 'LineWidth', 2);
    title(['Original: ', signal_name]);
    xlabel('Time');
    ylabel('Amplitude');
    grid on;

    subplot(2,1,2);
    plot(t, x_mod, 'r', 'LineWidth', 2);
    title(['Modified: ', op_name]);
    xlabel('Time');
    ylabel('Amplitude');
    grid on;

end