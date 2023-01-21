
sumPos = [1;0.6;0];
sumZYX = [pi/4;0;0];

boxPos = [1;2;0.8;1];

toFranka_x =  0.25;
toFranka_y = -0.22;
toFranka_z =  0.15;
toFranka_ZYX = [0;pi/4;0];


boxtf_01 = [[eul2rotm([0,0,0], 'ZYX')],boxPos(1:3); ...
            0 0 0                               1           ];
sumtf_01 = [[eul2rotm(sumZYX', 'ZYX')],sumPos; ...
            0 0 0                               1           ];
sumtopandatf_12 = [[eul2rotm(toFranka_ZYX', 'ZYX')]',[0.25,-0.22,0]'; ...
            0 0 0                               1           ];

toPandatf = sumtf_01*sumtopandatf_12;

body_or = sumtf_01*sumtopandatf_12*[0,0,0,1]';
body_x = sumtf_01*sumtopandatf_12*[1,0,0,1]';
body_y = sumtf_01*sumtopandatf_12*[0,1,0,1]';
body_z = sumtf_01*sumtopandatf_12*[0,0,1,1]';


boxx = inv(toPandatf)*boxPos;


%%
figure;hold on;
grid on;
xlabel('X axis'), ylabel('Y axis'), zlabel('Z axis')
axis ([-5,5,-5,5,-5,5])
set(gca,'CameraPosition',[1 2 3]);


fixed_x = [1,0,0];
fixed_y = [0,1,0];
fixed_z = [0,0,1];
fixed_or = [0,0,0];
plot3([fixed_or(1) fixed_x(1)],[fixed_or(2) fixed_x(2)],[fixed_or(3) fixed_x(3)],'r--', 'LineWidth',1);
plot3([fixed_or(1) fixed_y(1)],[fixed_or(2) fixed_y(2)],[fixed_or(3) fixed_y(3)],'g--', 'LineWidth',1);
plot3([fixed_or(1) fixed_z(1)],[fixed_or(2) fixed_z(2)],[fixed_or(3) fixed_z(3)],'b--', 'LineWidth',1);

plot3([body_or(1) body_x(1)],[body_or(2) body_x(2)],[body_or(3) body_x(3)],'r-', 'LineWidth',1);
plot3([body_or(1) body_y(1)],[body_or(2) body_y(2)],[body_or(3) body_y(3)],'g-', 'LineWidth',1);
plot3([body_or(1) body_z(1)],[body_or(2) body_z(2)],[body_or(3) body_z(3)],'b-', 'LineWidth',1);

plot3([body_or(1) boxPos(1)],[body_or(2) boxPos(2)],[body_or(3) boxPos(3)],'y-', 'LineWidth',1);
plot3(boxPos(1),boxPos(2),boxPos(3),'.','LineWidth',5)
plot3([fixed_or(1) boxx(1)],[fixed_or(2) boxx(2)],[fixed_or(3) boxx(3)],'y-', 'LineWidth',1);
plot3(boxx(1),boxx(2),boxx(3),'.','LineWidth',5)




