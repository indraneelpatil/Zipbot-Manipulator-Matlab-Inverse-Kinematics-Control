syms x y z t1 t2 t3 r1;
prompt = 'Enter the cartesian coordinates of end-affector? ';

 a.servoAttach(11);
 a.servoAttach(10);
 a.servoAttach(9);
 a.servoWrite(9,90);
 a.servoWrite(10,90);
 a.servoWrite(11,90);
 pause(2);
%x = input(prompt);
%y = input(prompt);
%z = input(prompt);

 %Triangle coords
  xs = [70,104,120];
  ys = [30,90,30];
  
  
      
for i= 1:length(xs)
 
 %x = xs(i) ; %104
 %y = ys(i)  ; %69
 x = 104 ; %104
 y = 69  ; %69
 phi = 0;                            %   Define phi here.

    l_1i = 73;
 l_2i = 117;
 l_3i = 15;
 l_i = [l_1i, l_2i, l_3i];

 %servo 1
 psi_1 = 210;
 a_1x = 0;
 a_1y = 0;

 %servo 2
 psi_2 = 330;
 a_2x = 90;
 a_2y = 185;
        
 %servo 3
 psi_3 = 90;
 a_3x = 155;
 a_3y = 0;
        
 a_ixs = [a_1x, a_2x, a_3x];
 a_iys = [a_1y, a_2y, a_3y];
 psi_is = [psi_1, psi_2, psi_3];

 thetas = [];
 for i = 1:3
    psi_i = psi_is(i);
    a_ix = a_ixs(i);
    a_iy = a_iys(i);
                        
    thetas = [thetas; new_inv_kin(x, y, phi, psi_i, l_1i, l_2i, l_3i, a_ix, a_iy)];
  end
        
  servo_angle_1 = 133+round(thetas(1,1));
  servo_angle_2 = 233+round(thetas(2,1));
  servo_angle_3 = 54+round(thetas(3,1));
  servo_angles = [servo_angle_1, servo_angle_2, servo_angle_3];


%t1=90+ round(57.2958*t1);
%t2= 90+ round(57.2958*t2);
%t3=90+ round(57.2958*t3);

disp(servo_angles);
%disp(t2);
%disp(t3);

if  servo_angle_1>0 && servo_angle_1<180 && servo_angle_2>0 && servo_angle_2<180 && servo_angle_3>0 && servo_angle_3<180
    %a=arduino('COM10');
    a.servoAttach(11);
    a.servoAttach(10);
    a.servoAttach(9);
    a.servoWrite(9,servo_angle_3);
    a.servoWrite(10,servo_angle_2);
    a.servoWrite(11,servo_angle_1);
    pause(2);
else
   S = 'Invalid';
   disp(S);
end



end
