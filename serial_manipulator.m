syms x y z t1 t2 t3 r1;
prompt = 'Enter the cartesian coordinates of end-affector? ';
a2=9;
a3=14;

 a.servoAttach(11);
 a.servoAttach(10);
 a.servoAttach(9);
 a.servoWrite(9,90);
 pause(2);
 a.servoWrite(10,90);
 pause(2);
 a.servoWrite(11,90);
 pause(2);



x = input(prompt);
y = input(prompt);
z = input(prompt);
r= sqrt(z*z+y*y);

t1 = atan2(y,x); 
t3 = acos((r^2 + x^2 - (a2^2 + a3^2))/(2*a2*a3));
t2 = atan2(x,z) - atan2(a3*sin(t3), (a2 + a3*cos(t3)));

t1=90+ round(57.2958*t1);
t2= 90+ round(57.2958*t2);
t3=90+ round(57.2958*t3);

disp(t1);
disp(t2);
disp(t3);

if t1>0 && t1<180 && t2>0 && t2<180 && t3>0 && t3<180
    %a=arduino('COM10');
    a.servoAttach(11);
    a.servoAttach(10);
    a.servoAttach(9);
    a.servoWrite(9,t1);
    pause(2);
    a.servoWrite(10,t2);
    pause(2);
    a.servoWrite(11,t3);
    pause(2);
else
    S = 'Invalid';
    disp(S);
end



%while true 
 %   a.servoWrite(11,0);
  %  pause(2);
  %  a.servoWrite(11,90);
  %  pause(2);
  %  a.servoWrite(11,180);
  %  pause(2);
%end 
