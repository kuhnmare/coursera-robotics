
disp('Checking on triangle in another')
T1 = [0 0; 0 1; 1 0; ];
T2 = [ -1 -1;  0 2; 2 0 ];
triangle_intersection(T1,T2)
    
disp('Checking one point inside the triangle')
T1 = [0 0; 0 1; 1 0];
T2 = [0.2 0.2; 0.2 2; 2 0.2];
triangle_intersection(T1,T2)

disp('Checking one point touch')
T1 = [0 0; 0 1; 1 0];
T2 = [-1 -1; 0 0; 2 -1];
triangle_intersection(T1,T2)

disp('Checking no collision')
T1 = [0 0; 0 1; 1 0];
T2 = [5 5; 5 6; 6 5];
triangle_intersection(T1,T2)

disp('Checking official example')
T1 = [2 5; 2 3; 3 4];
T2 = [0 0; 4 4; 2 6];
triangle_intersection(T1,T2)

disp('Checking wrong order, but colliding')
T1 = [1 1;2 2;1 3];
T2 = [1 1; 4 4; 2 6];
triangle_intersection(T1,T2)



