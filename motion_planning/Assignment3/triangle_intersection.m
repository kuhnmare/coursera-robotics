function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

    flag = false;

    % Ensure the triangle point order is CW
    P1 = fixPointOrder(P1);
    P2 = fixPointOrder(P2);
    
    % Check all the points 
    for i=1:3
        x = pointInTriangle(P1, P2(i, :));
        if x == 1
            flag = true;
            return;
        end
    end
    
    for i=1:3
       x = pointInTriangle(P2, P1(i, :));
        if x == 1
            flag = true;
            return;
        end
    end 
    
    function result = fixPointOrder(triangle)
        A = triangle(1,:);
        B = triangle(2,:);
        C = triangle(3,:);
        
        x = cross2d(B-A, C-B);
        
        if x(3)>0
            result = [A; C; B]; % CCW order
        else
            result = triangle; % CW order
        end
    end
        
    function bool = pointInTriangle(triangle, p)
        
        a=triangle(1,:); 
        b=triangle(2,:);
        c=triangle(3,:);
        
        if sameSide(p, a, b, c) && sameSide(p, b, a, c) && sameSide(p, c, a, b)
            bool = 1;
        else
            bool = 0;
        end
    end

    function bool = sameSide(p1, p2, a, b)
        x1 = cross2d(b-a, p1-a);
        x2 = cross2d(b-a, p2-a);
        
        if dot(x1,x2) >= 0 
            bool = 1;
        else
            bool = 0;
        end
    end

    function vec = cross2d(v1, v2)
        v1 = [ v1 0 ];
        v2 = [v2 0];
        vec = [ v1(2)*v2(3) - v1(3)*v2(2);
              v1(3)*v2(1) - v1(1)*v2(3);
              v1(1)*v2(2) - v1(2)*v2(1)
             ];
            
    end
        

% *******************************************************************
end