%% Probability density Plot
% Specify the source folder and get the list of .txt files
source_folder = ''; 
files = dir(fullfile(source_folder, '*.txt'));

% Initialize the accumulator for x, y values
all_x = [];
all_y = [];

% Loop through each .txt file
for k = 1:length(files)
    % Load the data from the current file
    data = load(fullfile(source_folder, files(k).name));
    
    % Check the condition for data(1,7)
    if data(1,7) < 0.2
        % Extract and accumulate the x and y values
        all_x = [all_x; data(1:151, 1)];
        all_y = [all_y; data(1:151, 2)];
    end
end

% Create a probability density plot using hist3
figure;
hist3([all_x, all_y], [50 50]); % 50x50 bins, adjust as needed
title('Probability Density Plot');
xlabel('X Values');
ylabel('Y Values');
set(gcf,'renderer','opengl');
set(get(gca,'child'),'FaceColor','interp','CDataMode','auto');
view(3); % 3D view