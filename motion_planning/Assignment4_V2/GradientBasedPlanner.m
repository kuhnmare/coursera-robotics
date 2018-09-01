function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);

%%% All of your code should be between the two lines of stars.
% *******************************************************************

route = [start_coords];
pos = start_coords';

% Normalization
norm = sqrt(gx.^2 + gy.^2);
gx = gx./norm;
gy = gy./norm;

x = start_coords(1);
y = start_coords(2);

i = 0;
while i < max_its 
	posIndex = min(max(round(pos), 1), size(gx)');
	
	grad = [
		gx(posIndex(2), posIndex(1));
		gy(posIndex(2), posIndex(1));
	];
    
	pos = pos + grad;
	
    distGoal = sqrt((pos(1) - end_coords(1)) ^2 + (pos(2) - end_coords(2)) ^2);
    if distGoal < 1.0
        break;
    end
    
    route = [route; pos'];
	i = i+1;
end
size(route)
route = double(route);

% *******************************************************************
end
