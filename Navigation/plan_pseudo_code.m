clc 
clear all

cost_stay_in_centre = zeros(20,30,4);
cost_move_forward = zeros(20,30);

%getting location of the yellow and blue cones
yellow_cones = [[5,1];[16,1]];
blue_cones = [[14,30];[2,29]];
car_position = [20,10];

%assigning max calculated cost to the grids occupied by yellow and blue
%cones.

%assign_cost_function(yellow/blue_cones)
%   max_cost = 20
%   i = 0
%   cost_matrix(yellow/blue_cones(i)) = max_cost
%   i++

cost_stay_in_centre(16,1) = 20;
cost_stay_in_centre(5,1) = 20;
cost_stay_in_centre(14,30) = 20;
cost_stay_in_centre(2,29) = 20;


%assign íng maximum cost to the block with current position of car, which
%decreases with increasing y-coordinate
cost_move_forward(20,10) = 25;

%sorting the blue and yellow cones into binary heaps based on distance from
%the car.
%dist acc to (y2-y1)*(y2-y1) + (x2-x1)*(x2-x1)
% [ Y2    [ B2
%   Y1 ]    B1 ]

%distributing weights to the graph
% max_cost + (sign of dot product of vector Y1_B1 and Y1_i)*(-1)*20*(Dist
% from Y1/Dist between center of Y1_B1 and Y1 
m = 20;
while(m>10)
    for n = 1:30
        slope_Y1_B1 = atan2(30-1,14-16);
        
        slope_i = atan2(n-1,m-16);
        cos_int_angle_1 = cos(slope_i-slope_Y1_B1);
        
        polarity_1 = cos_int_angle_1/abs(cos_int_angle_1);
        
        dist_from_center_1 = sqrt((1)+(15*15));
        
        dist_from_i = sqrt((m-16)*(m-16)+(n-1)*(n-1));
        cost_stay_in_centre(m,n,1) = 20 + polarity_1*(-1)*20*(dist_from_i/dist_from_center_1);
        
        if(cost_stay_in_centre(m,n,1) < 0)
            cost_stay_in_centre(m,n,1) = 0;
            break
        end
    end
    m = m-1;
end

m=20;
while(m>10)
    for n = 1:30
        polarity = ((n-30)*(1-30) + (m-14)*(16-14))/abs((n-30)*(1-30) + (m-14)*(16-14));
        dist_from_center = sqrt((1)+(14*14));
        dist_from_i = sqrt((m-14)*(m-14)+(n-30)*(n-30));
        cost_stay_in_centre(m,n,2) = 20 + polarity*(-1)*20*(dist_from_i/dist_from_center);
        if(cost_stay_in_centre(m,n,2)<0)
            cost_stay_in_centre(m,n,2) = 0;
        end
    end
    m=m-1;
end

%pop out last entry from binary heap. only Y2 and B2 remains
%or pop out after the car has moved and to move in new cone coordinates into the stack.

while(m>0)
    for n = 1:30
        slope_Y2_B2 = atan2(29-1,2-5);
        slope_i = atan2(n-1,m-5);
        cos_int_angle = cos(slope_i-slope_Y2_B2);
        polarity = cos_int_angle/abs(cos_int_angle);
        dist_from_center = sqrt((1)+(14*14));
        dist_from_i = sqrt((m-5)*(m-5)+(n-1)*(n-1));
        cost_stay_in_centre(m,n,3) = 20 + polarity*(-1)*20*(dist_from_i/dist_from_center);

        if(cost_stay_in_centre(m,n,3) <0)
            cost_stay_in_centre(m,n,3) = 0;
            break
        end
    end
    m = m-1;
end

m=10;
while(m>0)
    for n = 1:30
        polarity = ((n-29)*(1-29) + (m-2)*(5-2))/abs((n-29)*(1-29) + (m-2)*(5-2));
        dist_from_center = sqrt((4)+(14*14));
        dist_from_i = sqrt((m-2)*(m-2)+(n-29)*(n-29));
        cost_stay_in_centre(m,n,4) = 20 + polarity*(-1)*20*(dist_from_i/dist_from_center);
        if(cost_stay_in_centre(m,n,4)<0)
            cost_stay_in_centre(m,n,4) = 0;
        end
    end
    m=m-1;
end
   
m=20;
while(m>0)
    cost_move_forward(m,:)=m;
    m=m-1;
end

