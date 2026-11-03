clc
clear all
close all
%% System 1
A1 = [2  1  0 ; 0  2  1 ; 0 0  2];
B1 = [2 ; 0   ; 1];
C1 = [2 1 1];
Dim= 3;

QC1= [B1 A1*B1 A1*A1*B1];

G_C1 = QC1*QC1'; 
rho_gc1_1 = eig(G_C1);
rho_gc1_2 = Dim/trace(inv(G_C1));
rho_gc1_3 = inv(det(G_C1));

QO1 = [C1; C1*A1; C1*A1*A1 ];
GO1 = QO1'*QO1;
rho_go1_1 = eig(GO1);
rho_go1_2 = Dim/trace(inv(GO1));
rho_go1_3 = inv(det(GO1));
%% System 2
A2 = [2  1  0 ; 0  2  1 ; 0 0  2];
B2 = 0.1*[2 ; 0   ; 1];
C2 = 0.1*[2 1 1];

QC2= [B2 A2*B2 A2*A2*B2];

G_C2 = QC2*QC2'; 
rho_gc2_1 = eig(G_C2);
rho_gc2_2 = Dim/trace(inv(G_C2));
rho_gc2_3 = inv(det(G_C2));

QO2 = [C2; C2*A2; C2*A2*A2 ];
GO2 = QO2'*QO2;
rho_go2_1 = eig(GO2);
rho_go2_2 = Dim/trace(inv(GO2));
rho_go2_3 = inv(det(GO2));
%% System 3
A3 = [2  1  0 ; 0  2  1 ; 0 0  2];
B3 =  [2  1; 0 2 ; 1 1];
C3 =  [2  1  1;
       0  2  1];

QC3= [B3 A3*B3 A3*A3*B3];

G_C3 = QC3*QC3'; 
rho_gc3_1 = eig(G_C3);
rho_gc3_2 = Dim/trace(inv(G_C3));
rho_gc3_3 = inv(det(G_C3));

QO3 = [C3; C3*A3; C3*A3*A3 ];
GO3 = QO3'*QO3;
rho_go3_1 = eig(GO3);
rho_go3_2 = Dim/trace(inv(GO3));
rho_go3_3 = inv(det(GO3));
%% System 4
A4 = 0.5*[2  1  0 ; 0  2  1 ; 0 0  2];
B4 = [2 ; 0   ; 1];
C4 = [2 1 1];
 
QC4= [B4 A4*B4 A4*A4*B4];

G_C4 = QC4*QC4'; 
rho_gc4_1 = eig(G_C4);
rho_gc4_2 = Dim/trace(inv(G_C4));
rho_gc4_3 = inv(det(G_C4));

QO4 = [C4; C4*A4; C4*A4*A4 ];
GO4 = QO4'*QO4;
rho_go4_1 = eig(GO4);
rho_go4_2 = Dim/trace(inv(GO4));
rho_go4_3 = inv(det(GO4));

rho_gc1_1,rho_gc1_2,rho_gc1_3,rho_go1_1,rho_go1_2,rho_go1_3

rho_gc2_1,rho_gc2_2,rho_gc2_3,rho_go2_1,rho_go2_2,rho_go2_3

rho_gc3_1,rho_gc3_2,rho_gc3_3,rho_go3_1,rho_go3_2,rho_go3_3

rho_gc4_1,rho_gc4_2,rho_gc4_3,rho_go4_1,rho_go4_2,rho_go4_3
%% 

A5 = [-2  1  0 ; 0  -1  1 ; 0 1  2];
B5 = [2 ; 0   ; 1]
P = [-1 -2 -3]
K =place(A5,B5,P);

A6 =[0 0 1 0;
    0 0 0 1;
    0 0.8 -1.5 0;
    -3.7 0.7 0 -4.9];

B6 =[0   0; 
    0   0; 
   -2   0; 
    0  2.5];
%% 
A7  =[0     1  1;
      0.8 -1.5 0;
      -3.7  0.7 3.1  ];
B7  =[1;2 ;0.3];
Bw7 = [0; 0.1; -0.2];
Cw7 = [2  1  1;
       0  2  1];
Dw7 = [0.2 ;  
       0     ];

