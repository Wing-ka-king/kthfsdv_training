clc 
clear all

cost_stay_in_centre = zeros(20,30,6);
cost_move_forward = zeros(20,30);

%getting location of the yellow and blue cones
yellow_cones = [[13,3];[16,12]];
blue_cones = [[1,18];[13,30]];
car_position = [20,18];

%assigning max calculated cost to the grids occupied by yellow and blue
%cones.

%assign_cost_function(yellow/blue_cones)
%   max_cost = 20
%   i = 0
%   cost_matrix(yellow/blue_cones(i)) = max_cost
%   i++

%cost_stay_in_centre(16,1) = 20;
%cost_stay_in_centre(5,1) = 20;
%cost_stay_in_centre(14,30) = 20;
%cost_stay_in_centre(2,29) = 20;

%assign íng maximum cost to the block with current position of car, which
%decreases with increasing y-coordinate
%cost_move_forward(20,10) = 20;

%sorting the blue and yellow cones into binary heaps based on distance from
%the car.
%dist acc to (y2-y1)*(y2-y1) + (x2-x1)*(x2-x1)
% [ Y2    [ B2
%   Y1 ]    B1 ]

%distributing weights to the graph
% max_cost + (sign of dot product of vector Y1_B1 and Y1_i)*(-1)*20*(Dist
% from Y1/Dist between center of Y1_B1 and Y1 
m = 20;
while(m>0)
    for n = 1:30
        slope_Y1_B1 = atan2(30-12,13-16);
        slope_Y1_B2 = atan2(18-12,1-16);
        slope_i = atan2(n-12,m-16);
        cos_int_angle_1 = cos(slope_i-slope_Y1_B1);
        cos_int_angle_2 = cos(slope_i-slope_Y1_B2);
        polarity_1 = cos_int_angle_1/abs(cos_int_angle_1);
        polarity_2 = cos_int_angle_2/abs(cos_int_angle_2);
        dist_from_center_1 = sqrt((1)+(9*9));
        dist_from_center_2 = sqrt(49+9);
        dist_from_i = sqrt((m-16)*(m-16)+(n-12)*(n-12));
        cost_stay_in_centre(m,n,1) = 20 + polarity_1*(-1)*20*(dist_from_i/dist_from_center_1);
        cost_stay_in_centre(m,n,2) = 20 + polarity_2*(-1)*20*(dist_from_i/dist_from_center_2);
        if(cost_stay_in_centre(m,n,1) < 0)
            cost_stay_in_centre(m,n,1) = 0;
        end
        if(cost_stay_in_centre(m,n,1) > 22)
            cost_stay_in_centre(m,n,1) = 22;
        end
        if(cost_stay_in_centre(m,n,2) < 0)
            cost_stay_in_centre(m,n,2) = 0;
        end
        if(cost_stay_in_centre(m,n,2) > 22)
            cost_stay_in_centre(m,n,2) = 22;
        end
    end
    m = m-1;
end

m=20;
while(m>0)
    for n = 1:30
        polarity = ((n-30)*(12-30) + (m-13)*(16-13))/abs((n-30)*(12-30) + (m-13)*(16-13));
        dist_from_center = sqrt((4)+(81));
        dist_from_i = sqrt((m-13)*(m-13)+(n-30)*(n-30));
        cost_stay_in_centre(m,n,3) = 20 + polarity*(-1)*20*(dist_from_i/dist_from_center);
        if(cost_stay_in_centre(m,n,3)<0)
            cost_stay_in_centre(m,n,3) = 0;
        end
        if(cost_stay_in_centre(m,n,3) > 22)
            cost_stay_in_centre(m,n,3) = 22;
        end
    end
    m=m-1;
end

%pop out last entry from binary heap. only Y2 and B2 remains
%or pop out after the car has moved and to move in new cone coordinates into the stack.

m = 20;
while(m>0)
    for n = 1:30
        slope_Y2_B2 = atan2(3-18,13-1);
        slope_Y1_B2 = atan2(12-18,16-1);
        slope_i = atan2(n-18,m-1);
        cos_int_angle_1 = cos(slope_i-slope_Y2_B2);
        cos_int_angle_2 = cos(slope_i-slope_Y1_B2);
        polarity_1 = cos_int_angle_1/abs(cos_int_angle_1);
        polarity_2 = cos_int_angle_2/abs(cos_int_angle_2);
        dist_from_center_1 = sqrt((36)+(49));
        dist_from_center_2 = sqrt(64+49);
        dist_from_i = sqrt((m-1)*(m-1)+(n-18)*(n-18));
        cost_stay_in_centre(m,n,4) = 20 + polarity_1*(-1)*20*(dist_from_i/dist_from_center_1);
        cost_stay_in_centre(m,n,5) = 20 + polarity_2*(-1)*20*(dist_from_i/dist_from_center_2);
        if(cost_stay_in_centre(m,n,4) < 0)
            cost_stay_in_centre(m,n,4) = 0;
        end
        if(cost_stay_in_centre(m,n,4) > 22)
            cost_stay_in_centre(m,n,4) = 22;
        end
        if(cost_stay_in_centre(m,n,5) < 0)
            cost_stay_in_centre(m,n,5) = 0;
        end
        if(cost_stay_in_centre(m,n,5) > 22)
            cost_stay_in_centre(m,n,5) = 22;
        end
    end
    m = m-1;
end

m=20;
while(m>10)
    for n = 1:30
        polarity = ((n-3)*(18-3) + (m-13)*(1-13))/abs((n-3)*(18-3) + (m-13)*(1-13));
        dist_from_center = sqrt((36)+(49));
        dist_from_i = sqrt((m-13)*(m-13)+(n-3)*(n-3));
        cost_stay_in_centre(m,n,6) = 20 + polarity*(-1)*20*(dist_from_i/dist_from_center);
        if(cost_stay_in_centre(m,n,6)<0)
            cost_stay_in_centre(m,n,6) = 0;
        end
        if(cost_stay_in_centre(m,n,6) > 22)
            cost_stay_in_centre(m,n,6) = 22;
        end
    end
    m=m-1;
end

m=20;
while(m>0)
    cost_move_forward(m,:)=m;
    m=m-1;
end

final_weights_curved = cost_move_forward;
for i=(1:6)
    final_weights_curved = final_weights_curved + cost_stay_in_centre(:,:,i);
end

filelist = ["curved_1.csv", 'curved_2.csv','curved_3.csv','curved_4.csv','curved_5.csv','curved_6.csv',"curved_7.csv","weighted_graph_curved.csv"];

for i=(1:6)
    csvwrite(filelist(i), cost_stay_in_centre(:,:,i))
end

csvwrite("weighted_graph_curved.csv",final_weights_curved)
