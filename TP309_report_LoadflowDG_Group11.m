
clear all
clc 

%defining the paths and branches
paths = {[1,2,3,4,5], [1,2,3,4,23,24,25], [1,2,3,18,20,19], [1,2,3,18,21,22],  [1,2,6,8], [1,2,6,7,16], [1,2,6,7,14,15], [1,2,6,7,14,17], [1,2,6,7,9,10,11,12],[1,2,6,7,9,10,11,13]};
branches = {[1,2], [2,3], [3,4], [4,5], [4,23], [23, 24], [24,25], [3,18], [18,20], [20,19], [18,21], [21,22], [2,6], [6,8], [6,7], [7,16], [7,14], [14,15], [14,17], [7,9], [9,10], [10,11], [11,12], [11,13]};

paths_cell = cell(numel(paths), 1);
for i = 1:numel(paths)
    paths_cell{i} = paths{i};
end

branches_cell = cell(numel(branches), 1);
for i = 1:numel(branches)
    branches_cell{i} = branches{i};
end

% Initialize E matrix with zeros
E = zeros(length(paths), length(branches));

% Iterate over paths
for i = 1:length(paths)
    % Iterate over branches
    for branch = 1:length(branches)
        % Check if both ends of the branch are in the current path
        if ismember(branches{branch}(1), paths{i}) && ismember(branches{branch}(2), paths{i})
            E(i, branch) = 1;
        end
    end
end

%disp(E); % Display E matrix

branch_length  = [1000 500 500 500 400 400 400 500 500 400 400 400 500 1000 500 500 500 300 300 500 500 300 200 200];
branch_length = branch_length/5280;

Z1 = [0.3686 + 0.6852i, 0.0169 + 0.1515i, 0.0155 + 0.1098i; ...
      0.0169 + 0.1515i, 0.3757 + 0.6715i, 0.0188 + 0.2072i; ...
      0.0155 + 0.1098i, 0.0188 + 0.2072i, 0.3723 + 0.6782i];
Z1 = Z1*0.1734;
Z2 = [0.9775 + 0.8717i, 0.0167 + 0.1697i, 0.0152 + 0.1264i; ...
      0.0167 + 0.1697i, 0.9844 + 0.8654i, 0.0186 + 0.2275i; ...
      0.0152 + 0.1264i, 0.0186 + 0.2275i, 0.9810 + 0.8648i];
Z2 = Z2*0.1734;
Z3 = [1.9280 + 1.4194i, 0.0161 + 0.1183i, 0.0161 + 0.1183i; ...
      0.0161 + 0.1183i, 1.9308 + 1.4215i, 0.0161 + 0.1183i; ...
      0.0161 + 0.1183i, 0.0161 + 0.1183i, 1.9337 + 1.4236i];
Z3 = Z3*0.1734;
z_name = [1,1,1,2,2,2,3,2,2,3,3,3,2,2,2,2,2,2,3,2,2,2,3,3];

W_aa = zeros(length(paths), length(branches));
W_ab = zeros(length(paths), length(branches));
W_ac = zeros(length(paths), length(branches));
W_ba = zeros(length(paths), length(branches));
W_bb = zeros(length(paths), length(branches));
W_bc = zeros(length(paths), length(branches));
W_ca = zeros(length(paths), length(branches));
W_cb = zeros(length(paths), length(branches));
W_cc = zeros(length(paths), length(branches));

W_aa1 = zeros(length(paths), length(branches));
W_ab1 = zeros(length(paths), length(branches));
W_ac1 = zeros(length(paths), length(branches));
W_ba1 = zeros(length(paths), length(branches));
W_bb1 = zeros(length(paths), length(branches));
W_bc1 = zeros(length(paths), length(branches));
W_ca1 = zeros(length(paths), length(branches));
W_cb1 = zeros(length(paths), length(branches));
W_cc1 = zeros(length(paths), length(branches));


for i = 1:length(paths)
    for j = 1:length(branches)

            if z_name(j) == 1
                W_aa1(i, j) = Z1(1,1) * branch_length(j);
                W_ab1(i, j) = Z1(1,2) * branch_length(j);
                W_ac1(i, j) = Z1(1,3) * branch_length(j);
                W_ba1(i, j) = Z1(2,1) * branch_length(j);
                W_bb1(i, j) = Z1(2,2) * branch_length(j);
                W_bc1(i, j) = Z1(2,3) * branch_length(j);
                W_ca1(i, j) = Z1(3,1) * branch_length(j);
                W_cb1(i, j) = Z1(3,2) * branch_length(j);
                W_cc1(i, j) = Z1(3,3) * branch_length(j);
            elseif z_name(j) == 2
                W_aa1(i, j) = Z2(1,1) * branch_length(j);
                W_ab1(i, j) = Z2(1,2) * branch_length(j);
                W_ac1(i, j) = Z2(1,3) * branch_length(j);
                W_ba1(i, j) = Z2(2,1) * branch_length(j);
                W_bb1(i, j) = Z2(2,2) * branch_length(j);
                W_bc1(i, j) = Z2(2,3) * branch_length(j);
                W_ca1(i, j) = Z2(3,1) * branch_length(j);
                W_cb1(i, j) = Z2(3,2) * branch_length(j);
                W_cc1(i, j) = Z2(3,3) * branch_length(j);
            else
                W_aa1(i, j) = Z3(1,1) * branch_length(j);
                W_ab1(i, j) = Z3(1,2) * branch_length(j);
                W_ac1(i, j) = Z3(1,3) * branch_length(j);
                W_ba1(i, j) = Z3(2,1) * branch_length(j);
                W_bb1(i, j) = Z3(2,2) * branch_length(j);
                W_bc1(i, j) = Z3(2,3) * branch_length(j);
                W_ca1(i, j) = Z3(3,1) * branch_length(j);
                W_cb1(i, j) = Z3(3,2) * branch_length(j);
                W_cc1(i, j) = Z3(3,3) * branch_length(j);
            end

        if E(i,j) == 1 
            if z_name(j) == 1
                W_aa(i, j) = Z1(1,1) * branch_length(j);
                W_ab(i, j) = Z1(1,2) * branch_length(j);
                W_ac(i, j) = Z1(1,3) * branch_length(j);
                W_ba(i, j) = Z1(2,1) * branch_length(j);
                W_bb(i, j) = Z1(2,2) * branch_length(j);
                W_bc(i, j) = Z1(2,3) * branch_length(j);
                W_ca(i, j) = Z1(3,1) * branch_length(j);
                W_cb(i, j) = Z1(3,2) * branch_length(j);
                W_cc(i, j) = Z1(3,3) * branch_length(j);
            elseif z_name(j) == 2
                W_aa(i, j) = Z2(1,1) * branch_length(j);
                W_ab(i, j) = Z2(1,2) * branch_length(j);
                W_ac(i, j) = Z2(1,3) * branch_length(j);
                W_ba(i, j) = Z2(2,1) * branch_length(j);
                W_bb(i, j) = Z2(2,2) * branch_length(j);
                W_bc(i, j) = Z2(2,3) * branch_length(j);
                W_ca(i, j) = Z2(3,1) * branch_length(j);
                W_cb(i, j) = Z2(3,2) * branch_length(j);
                W_cc(i, j) = Z2(3,3) * branch_length(j);
            else
                W_aa(i, j) = Z3(1,1) * branch_length(j);
                W_ab(i, j) = Z3(1,2) * branch_length(j);
                W_ac(i, j) = Z3(1,3) * branch_length(j);
                W_ba(i, j) = Z3(2,1) * branch_length(j);
                W_bb(i, j) = Z3(2,2) * branch_length(j);
                W_bc(i, j) = Z3(2,3) * branch_length(j);
                W_ca(i, j) = Z3(3,1) * branch_length(j);
                W_cb(i, j) = Z3(3,2) * branch_length(j);
                W_cc(i, j) = Z3(3,3) * branch_length(j);
            end
        end
    end
end


% disp(W_aa);
% disp(W_ab);

T=[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1; ...
    0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1; ...
    0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1; ...
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0; ...
    0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0; ...
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0];

S=[0,0,0; ...
    0,0,0; ...
    36+21.6i,28.8+19.2i,42+26.4i; ...
    57.6+43.2i,4.8+3.4i,48+30i; ...
    43.2+28.8i,28.8+19.2i,36.24i; ...
    43.2+28.8i,33.6+24i,30+30i; ...
    43.2+28.8i,28.8+19.2i,3.6+2.4i; ...
    0,0,0; ...
    72+50.4i,38.4+28.8i,48+30i; ...
    36+21.6i,28.8+19.2i,32+26.4i; ...
    50.4+31.7i,24+14.4i,36+24i; ...
    100,100,100; ...
    64.8+21.6i,33.6+21.1i,36+24i; ...
    57.6+36i,38.4+28.8i,60+42i; ...
   80,80,80; ...
    57.6+4.3i,3.8+28.8i,48+36i; ...
    57.6+43.2i,33.6+24i,54+38.4i; ...
    57.6+43.2i,38.4+28.8i,48+36i; ...
    8.6+6.5i,4.8+3.4i,6+4.8i; ...
    50.4+36i,38.4+28.8i,54+38.4i; ...
    5.8+4.3i,3.4+2.4i,5.4+3.8i; ...
    100,100,100; ...
    8.6+64.8i,4.8+3.8i,60+42i; ...
    50.4+36i,43.2+30.7i,4.8+3.6i; ...
    100,100,100];

S_=conj(S)/(300);
%S_ = S_;


V_a = ones(25,1);
V_b = ones(25,1)* exp(-1i*2*pi/3);
V_c = ones(25,1)* exp(1i*2*pi/3);

i_a = zeros(length(branches), 25);
i_b = zeros(length(branches), 25);
i_c = zeros(length(branches), 25);

J_a = zeros(length(branches),1);
J_b = zeros(length(branches),1);
J_c = zeros(length(branches),1);

D_aa = zeros(length(paths), length(branches));
D_ab = zeros(length(paths), length(branches));
D_ac = zeros(length(paths), length(branches));
D_ba = zeros(length(paths), length(branches));
D_bb = zeros(length(paths), length(branches));
D_bc = zeros(length(paths), length(branches));
D_ca = zeros(length(paths), length(branches));
D_cb = zeros(length(paths), length(branches));
D_cc = zeros(length(paths), length(branches));

    Z_aa = zeros(4,4);
    Z_ab = zeros(4,4);
    Z_ac = zeros(4,4);
    Z_ba = zeros(4,4);
    Z_bb = zeros(4,4);
    Z_bc = zeros(4,4);
    Z_ca = zeros(4,4);
    Z_cb = zeros(4,4);
    Z_cc = zeros(4,4);
    
    W_aa_row = sum(W_aa,2);
    W_ab_row = sum(W_ab,2);
    W_ac_row = sum(W_ac,2);
    W_ba_row = sum(W_ba,2);
    W_bb_row = sum(W_bb,2);
    W_bc_row = sum(W_bc,2);
    W_ca_row = sum(W_ca,2);
    W_cb_row = sum(W_cb,2);
    W_cc_row = sum(W_cc,2);
    
    Z_aa(1,1) = W_aa_row(9,1);
    Z_ab(1,1) = W_ab_row(9,1);
    Z_ac(1,1) = W_ac_row(9,1);
    Z_ba(1,1) = W_ba_row(9,1);
    Z_bb(1,1) = W_bb_row(9,1);
    Z_bc(1,1) = W_bc_row(9,1);
    Z_ca(1,1) = W_ca_row(9,1);
    Z_cb(1,1) = W_cb_row(9,1);
    Z_cc(1,1) = W_cc_row(9,1);
    
    Z_aa(1,2) = W_aa1(1,18)+W_aa1(1,11)+W_aa1(1,20)+W_aa1(1,21)+W_aa1(1,22)+W_aa1(1,23);
    Z_ab(1,2) = W_ab1(1,18)+W_ab1(1,11)+W_ab1(1,20)+W_ab1(1,21)+W_ab1(1,22)+W_ab1(1,23);
    Z_ac(1,2) = W_ac1(1,18)+W_ac1(1,11)+W_ac1(1,20)+W_ac1(1,21)+W_ac1(1,22)+W_ac1(1,23);
    Z_ba(1,2) = W_ba1(1,18)+W_ba1(1,11)+W_ba1(1,20)+W_ba1(1,21)+W_ba1(1,22)+W_ba1(1,23);
    Z_bb(1,2) = W_bb1(1,18)+W_bb1(1,11)+W_bb1(1,20)+W_bb1(1,21)+W_bb1(1,22)+W_bb1(1,23);
    Z_bc(1,2) = W_bc1(1,18)+W_bc1(1,11)+W_bc1(1,20)+W_bc1(1,21)+W_bc1(1,22)+W_bc1(1,23);
    Z_ca(1,2) = W_ca1(1,18)+W_ca1(1,11)+W_ca1(1,20)+W_ca1(1,21)+W_ca1(1,22)+W_ca1(1,23);
    Z_cb(1,2) = W_cb1(1,18)+W_cb1(1,11)+W_cb1(1,20)+W_cb1(1,21)+W_cb1(1,22)+W_cb1(1,23);
    Z_cc(1,2) = W_cc1(1,18)+W_cc1(1,11)+W_cc1(1,20)+W_cc1(1,21)+W_cc1(1,22)+W_cc1(1,23);
    
    Z_aa(1,3) = W_aa1(1,22)+W_aa1(1,21)+W_aa1(1,20)+W_aa1(1,23)+W_aa1(1,2)+W_aa1(1,15)+W_aa1(1,13)+W_aa1(1,8)+W_aa1(1,11)+W_aa1(1,12);
    Z_ab(1,3) = W_ab1(1,22)+W_ab1(1,21)+W_ab1(1,20)+W_ab1(1,23)+W_ab1(1,2)+W_ab1(1,15)+W_ab1(1,13)+W_ab1(1,8)+W_ab1(1,11)+W_ab1(1,12);
    Z_ac(1,3) = W_ac1(1,22)+W_ac1(1,21)+W_ac1(1,20)+W_ac1(1,23)+W_ac1(1,2)+W_ac1(1,15)+W_ac1(1,13)+W_ac1(1,8)+W_ac1(1,11)+W_ac1(1,12);
    Z_ba(1,3) = W_ba1(1,22)+W_ba1(1,21)+W_ba1(1,20)+W_ba1(1,23)+W_ba1(1,2)+W_ba1(1,15)+W_ba1(1,13)+W_ba1(1,8)+W_ba1(1,11)+W_ba1(1,12);
    Z_bb(1,3) = W_bb1(1,22)+W_bb1(1,21)+W_bb1(1,20)+W_bb1(1,23)+W_bb1(1,2)+W_bb1(1,15)+W_bb1(1,13)+W_bb1(1,8)+W_bb1(1,11)+W_bb1(1,12);
    Z_bc(1,3) = W_bc1(1,22)+W_bc1(1,21)+W_bc1(1,20)+W_bc1(1,23)+W_bc1(1,2)+W_bc1(1,15)+W_bc1(1,13)+W_bc1(1,8)+W_bc1(1,11)+W_bc1(1,12);
    Z_ca(1,3) = W_ca1(1,22)+W_ca1(1,21)+W_ca1(1,20)+W_ca1(1,23)+W_ca1(1,2)+W_ca1(1,15)+W_ca1(1,13)+W_ca1(1,8)+W_ca1(1,11)+W_ca1(1,12);
    Z_cb(1,3) = W_cb1(1,22)+W_cb1(1,21)+W_cb1(1,20)+W_cb1(1,23)+W_cb1(1,2)+W_cb1(1,15)+W_cb1(1,13)+W_cb1(1,8)+W_cb1(1,11)+W_cb1(1,12);
    Z_cc(1,3) = W_cc1(1,22)+W_cc1(1,21)+W_cc1(1,20)+W_cc1(1,23)+W_cc1(1,2)+W_cc1(1,15)+W_cc1(1,13)+W_cc1(1,8)+W_cc1(1,11)+W_cc1(1,12);
    
    Z_aa(1,4) = W_aa1(1,20)+W_aa1(1,21)+W_aa1(1,22)+W_aa1(1,15)+W_aa1(1,3)+W_aa1(1,2)+W_aa1(1,6)+W_aa1(1,7)+W_aa1(1,5)+W_aa1(1,13)+W_aa1(1,23);
    Z_ab(1,4) = W_ab1(1,20)+W_ab1(1,21)+W_ab1(1,22)+W_ab1(1,15)+W_ab1(1,3)+W_ab1(1,2)+W_ab1(1,6)+W_ab1(1,7)+W_ab1(1,5)+W_ab1(1,13)+W_ab1(1,23);
    Z_ac(1,4) = W_ac1(1,20)+W_ac1(1,21)+W_ac1(1,22)+W_ac1(1,15)+W_ac1(1,3)+W_ac1(1,2)+W_ac1(1,6)+W_ac1(1,7)+W_ac1(1,5)+W_ac1(1,13)+W_ac1(1,23);
    Z_ba(1,4) = W_ba1(1,20)+W_ba1(1,21)+W_ba1(1,22)+W_ba1(1,15)+W_ba1(1,3)+W_ba1(1,2)+W_ba1(1,6)+W_ba1(1,7)+W_ba1(1,5)+W_ba1(1,13)+W_ba1(1,23);
    Z_bb(1,4) = W_bb1(1,20)+W_bb1(1,21)+W_bb1(1,22)+W_bb1(1,15)+W_bb1(1,3)+W_bb1(1,2)+W_bb1(1,6)+W_bb1(1,7)+W_bb1(1,5)+W_bb1(1,13)+W_bb1(1,23);
    Z_bc(1,4) = W_bc1(1,20)+W_bc1(1,21)+W_bc1(1,22)+W_bc1(1,15)+W_bc1(1,3)+W_bc1(1,2)+W_bc1(1,6)+W_bc1(1,7)+W_bc1(1,5)+W_bc1(1,13)+W_bc1(1,23);
    Z_ca(1,4) = W_ca1(1,20)+W_ca1(1,21)+W_ca1(1,22)+W_ca1(1,15)+W_ca1(1,3)+W_ca1(1,2)+W_ca1(1,6)+W_ca1(1,7)+W_ca1(1,5)+W_ca1(1,13)+W_ca1(1,23);
    Z_cb(1,4) = W_cb1(1,20)+W_cb1(1,21)+W_cb1(1,22)+W_cb1(1,15)+W_cb1(1,3)+W_cb1(1,2)+W_cb1(1,6)+W_cb1(1,7)+W_cb1(1,5)+W_cb1(1,13)+W_cb1(1,23);
    Z_cc(1,4) = W_cc1(1,20)+W_cc1(1,21)+W_cc1(1,22)+W_cc1(1,15)+W_cc1(1,3)+W_cc1(1,2)+W_cc1(1,6)+W_cc1(1,7)+W_cc1(1,5)+W_cc1(1,13)+W_cc1(1,23);
    
    Z_aa(2,3) = W_aa1(1,17)+W_aa1(1,15)+W_aa1(1,18)+W_aa1(1,13)+W_aa1(1,2)+W_aa1(1,8)+W_aa1(1,11)+W_aa1(1,12);
    Z_ab(2,3) = W_ab1(1,17)+W_ab1(1,15)+W_ab1(1,18)+W_ab1(1,13)+W_ab1(1,2)+W_ab1(1,8)+W_ab1(1,11)+W_ab1(1,12);
    Z_ac(2,3) = W_ac1(1,17)+W_ac1(1,15)+W_ac1(1,18)+W_ac1(1,13)+W_ac1(1,2)+W_ac1(1,8)+W_ac1(1,11)+W_ac1(1,12);
    Z_ba(2,3) = W_ba1(1,17)+W_ba1(1,15)+W_ba1(1,18)+W_ba1(1,13)+W_ba1(1,2)+W_ba1(1,8)+W_ba1(1,11)+W_ba1(1,12);
    Z_bb(2,3) = W_bb1(1,17)+W_bb1(1,15)+W_bb1(1,18)+W_bb1(1,13)+W_bb1(1,2)+W_bb1(1,8)+W_bb1(1,11)+W_bb1(1,12);
    Z_bc(2,3) = W_bc1(1,17)+W_bc1(1,15)+W_bc1(1,18)+W_bc1(1,13)+W_bc1(1,2)+W_bc1(1,8)+W_bc1(1,11)+W_bc1(1,12);
    Z_ca(2,3) = W_ca1(1,17)+W_ca1(1,15)+W_ca1(1,18)+W_ca1(1,13)+W_ca1(1,2)+W_ca1(1,8)+W_ca1(1,11)+W_ca1(1,12);
    Z_cb(2,3) = W_cb1(1,17)+W_cb1(1,15)+W_cb1(1,18)+W_cb1(1,13)+W_cb1(1,2)+W_cb1(1,8)+W_cb1(1,11)+W_cb1(1,12);
    Z_cc(2,3) = W_cc1(1,17)+W_cc1(1,15)+W_cc1(1,18)+W_cc1(1,13)+W_cc1(1,2)+W_cc1(1,8)+W_cc1(1,11)+W_cc1(1,12);
    
    Z_ab(2,4) = W_ab1(1,18)+W_ab1(1,17)+W_ab1(1,13)+W_ab1(1,5)+W_ab1(1,3)+W_ab1(1,2)+W_ab1(1,6)+W_ab1(1,7)+W_ab1(1,15);
    Z_aa(2,4) = W_aa1(1,18)+W_aa1(1,17)+W_aa1(1,13)+W_aa1(1,5)+W_aa1(1,3)+W_aa1(1,2)+W_aa1(1,6)+W_aa1(1,7)+W_aa1(1,15);
    Z_ac(2,4) = W_ac1(1,18)+W_ac1(1,17)+W_ac1(1,13)+W_ac1(1,5)+W_ac1(1,3)+W_ac1(1,2)+W_ac1(1,6)+W_ac1(1,7)+W_ac1(1,15);
    Z_ba(2,4) = W_ba1(1,18)+W_ba1(1,17)+W_ba1(1,13)+W_ba1(1,5)+W_ba1(1,3)+W_ba1(1,2)+W_ba1(1,6)+W_ba1(1,7)+W_ba1(1,15);
    Z_bb(2,4) = W_bb1(1,18)+W_bb1(1,17)+W_bb1(1,13)+W_bb1(1,5)+W_bb1(1,3)+W_bb1(1,2)+W_bb1(1,6)+W_bb1(1,7)+W_bb1(1,15);
    Z_bc(2,4) = W_bc1(1,18)+W_bc1(1,17)+W_bc1(1,13)+W_bc1(1,5)+W_bc1(1,3)+W_bc1(1,2)+W_bc1(1,6)+W_bc1(1,7)+W_bc1(1,15);
    Z_ca(2,4) = W_ca1(1,18)+W_ca1(1,17)+W_ca1(1,13)+W_ca1(1,5)+W_ca1(1,3)+W_ca1(1,2)+W_ca1(1,6)+W_ca1(1,7)+W_ca1(1,15);
    Z_cb(2,4) = W_cb1(1,18)+W_cb1(1,17)+W_cb1(1,13)+W_cb1(1,5)+W_cb1(1,3)+W_cb1(1,2)+W_cb1(1,6)+W_cb1(1,7)+W_cb1(1,15);
    Z_cc(2,4) = W_cc1(1,18)+W_cc1(1,17)+W_cc1(1,13)+W_cc1(1,5)+W_cc1(1,3)+W_cc1(1,2)+W_cc1(1,6)+W_cc1(1,7)+W_cc1(1,15);
    
    Z_aa(3,4) = W_aa1(1,7)+W_aa1(1,6)+W_aa1(1,5)+W_aa1(1,3)+W_aa1(1,8)+W_aa1(1,11)+W_aa1(1,12);
    Z_ab(3,4) = W_ab1(1,7)+W_ab1(1,6)+W_ab1(1,5)+W_ab1(1,3)+W_ab1(1,8)+W_ab1(1,11)+W_ab1(1,12);
    Z_ac(3,4) = W_ac1(1,7)+W_ac1(1,6)+W_ac1(1,5)+W_ac1(1,3)+W_ac1(1,8)+W_ac1(1,11)+W_ac1(1,12);
    Z_ba(3,4) = W_ba1(1,7)+W_ba1(1,6)+W_ba1(1,5)+W_ba1(1,3)+W_ba1(1,8)+W_ba1(1,11)+W_ba1(1,12);
    Z_bb(3,4) = W_bb1(1,7)+W_bb1(1,6)+W_bb1(1,5)+W_bb1(1,3)+W_bb1(1,8)+W_bb1(1,11)+W_bb1(1,12);
    Z_bc(3,4) = W_bc1(1,7)+W_bc1(1,6)+W_bc1(1,5)+W_bc1(1,3)+W_bc1(1,8)+W_bc1(1,11)+W_bc1(1,12);
    Z_ca(3,4) = W_ca1(1,7)+W_ca1(1,6)+W_ca1(1,5)+W_ca1(1,3)+W_ca1(1,8)+W_ca1(1,11)+W_ca1(1,12);
    Z_cb(3,4) = W_cb1(1,7)+W_cb1(1,6)+W_cb1(1,5)+W_cb1(1,3)+W_cb1(1,8)+W_cb1(1,11)+W_cb1(1,12);
    Z_cc(3,4) = W_cc1(1,7)+W_cc1(1,6)+W_cc1(1,5)+W_cc1(1,3)+W_cc1(1,8)+W_cc1(1,11)+W_cc1(1,12);
    
    Z_aa(2,2) = W_aa_row(7,1);
    Z_ab(2,2) = W_ab_row(7,1);
    Z_ac(2,2) = W_ac_row(7,1);
    Z_ba(2,2) = W_ba_row(7,1);
    Z_bb(2,2) = W_bb_row(7,1);
    Z_bc(2,2) = W_bc_row(7,1);
    Z_ca(2,2) = W_ca_row(7,1);
    Z_cb(2,2) = W_cb_row(7,1);
    Z_cc(2,2) = W_cc_row(7,1);
    
    Z_aa(3,3) = W_aa_row(4,1);
    Z_ab(3,3) = W_ab_row(4,1);
    Z_ac(3,3) = W_ac_row(4,1);
    Z_ba(3,3) = W_ba_row(4,1);
    Z_bb(3,3) = W_bb_row(4,1);
    Z_bc(3,3) = W_bc_row(4,1);
    Z_ca(3,3) = W_ca_row(4,1);
    Z_cb(3,3) = W_cb_row(4,1);
    Z_cc(3,3) = W_cc_row(4,1);
    
    Z_aa(4,4) = W_aa_row(2,1);
    Z_ab(4,4) = W_ab_row(2,1);
    Z_ac(4,4) = W_ac_row(2,1);
    Z_ba(4,4) = W_ba_row(2,1);
    Z_bb(4,4) = W_bb_row(2,1);
    Z_bc(4,4) = W_bc_row(2,1);
    Z_ca(4,4) = W_ca_row(2,1);
    Z_cb(4,4) = W_cb_row(2,1);
    Z_cc(4,4) = W_cc_row(2,1);
    
    Z_aa(2,1) = Z_aa(1,2);
    Z_ab(2,1) = Z_ab(1,2);
    Z_ac(2,1) = Z_ac(1,2);
    Z_ba(2,1) = Z_ba(1,2);
    Z_bb(2,1) = Z_bb(1,2);
    Z_bc(2,1) = Z_bc(1,2);
    Z_ca(2,1) = Z_ca(1,2);
    Z_cb(2,1) = Z_cb(1,2);
    Z_cc(2,1) = Z_cc(1,2);
    
    Z_aa(3,1) = Z_aa(1,3);
    Z_ab(3,1) = Z_ab(1,3);
    Z_ac(3,1) = Z_ac(1,3);
    Z_ba(3,1) = Z_ba(1,3);
    Z_bb(3,1) = Z_bb(1,3);
    Z_bc(3,1) = Z_bc(1,3);
    Z_ca(3,1) = Z_ca(1,3);
    Z_cb(3,1) = Z_cb(1,3);
    Z_cc(3,1) = Z_cc(1,3);
    
    Z_aa(4,1) = Z_aa(1,4);
    Z_ab(4,1) = Z_ab(1,4);
    Z_ac(4,1) = Z_ac(1,4);
    Z_ba(4,1) = Z_ba(1,4);
    Z_bb(4,1) = Z_bb(1,4);
    Z_bc(4,1) = Z_bc(1,4);
    Z_ca(4,1) = Z_ca(1,4);
    Z_cb(4,1) = Z_cb(1,4);
    Z_cc(4,1) = Z_cc(1,4);
    
    Z_aa(4,2) = Z_aa(2,4);
    Z_ab(4,2) = Z_ab(2,4);
    Z_ac(4,2) = Z_ac(2,4);
    Z_ba(4,2) = Z_ba(2,4);
    Z_bb(4,2) = Z_bb(2,4);
    Z_bc(4,2) = Z_bc(2,4);
    Z_ca(4,2) = Z_ca(2,4);
    Z_cb(4,2) = Z_cb(2,4);
    Z_cc(4,2) = Z_cc(2,4);
    
    Z_aa(3,2) = Z_aa(2,3);
    Z_ab(3,2) = Z_ab(2,3);
    Z_ac(3,2) = Z_ac(2,3);
    Z_ba(3,2) = Z_ba(2,3);
    Z_bb(3,2) = Z_bb(2,3);
    Z_bc(3,2) = Z_bc(2,3);
    Z_ca(3,2) = Z_ca(2,3);
    Z_cb(3,2) = Z_cb(2,3);
    Z_cc(3,2) = Z_cc(2,3);
    
    Z_aa(4,3) = Z_aa(3,4);
    Z_ab(4,3) = Z_ab(3,4);
    Z_ac(4,3) = Z_ac(3,4);
    Z_ba(4,3) = Z_ba(3,4);
    Z_bb(4,3) = Z_bb(3,4);
    Z_bc(4,3) = Z_bc(3,4);
    Z_ca(4,3) = Z_ca(3,4);
    Z_cb(4,3) = Z_cb(3,4);
    Z_cc(4,3) = Z_cc(3,4);
    
    Z = [Z_aa Z_ab Z_ac; Z_ba Z_bb Z_bc; Z_ca Z_cb Z_cc];
    Z_imag = imag(Z);
    
    V_sched_a = [0.9542;0.9545;0.9712;0.9695];
    V_sched_b = [0.9537;0.9551;0.9716;0.9719];
    V_sched_c = [0.9586;0.9588;0.9752;0.9756];


tmax = 10;
t = 1;
a=0;
err = 0.001; 
while (t<tmax)

    V_dg_a = [V_a(12); V_a(15); V_a(22); V_a(25)];
    delV_a = abs(real(V_sched_a)) - abs(real(V_dg_a));
    
    V_dg_b = [V_b(12); V_b(15); V_b(22); V_b(25)];
    delV_b = abs(real(V_sched_b)) - abs(real(V_dg_b));
    
    V_dg_c = [V_c(12); V_c(15); V_c(22); V_c(25)];
    delV_c = abs(real(V_sched_c)) - abs(real(V_dg_c));
    
    delV = [delV_a; delV_b; delV_c];
    
    
    delI = inv(Z_imag*i) * delV;
    
    %Bus Current Beyond Branch Matrix(I) Computation
    for i = 1:length(branches)
        for j = 1:25
            if T(i,j) == 1
                i_a(i,j) = T(i,j)*S_(j,1)/(conj(V_a(j)));
                i_b(i,j) = T(i,j)*S_(j,2)/(conj(V_b(j)));
                i_c(i,j) = T(i,j)*S_(j,3)/(conj(V_c(j)));
            end
        end
    end

    %Branch Current Matrix(J) Computation
    J_a = sum(i_a,2);
    J_b = sum(i_b,2);
    J_c = sum(i_c,2);

%    disp("Ja_1");
%    disp(J_a);


    J_a(23) = J_a(23)+delI(1);
    J_a(18) = J_a(18)+delI(2);
    J_a(12) = J_a(12)+delI(3);
    J_a(7) = J_a(7)+delI(4);

%    disp("Ja_2");
%   disp(J_a);

    J_b(23) = J_b(23)+delI(5);
    J_b(18) = J_b(18)+delI(6);
    J_b(12) = J_b(12)+delI(7);
    J_b(7) = J_b(7)+delI(8);

    J_c(23) = J_c(23)+delI(9);
    J_c(18) = J_c(18)+delI(10);
    J_c(12) = J_c(12)+delI(11);
    J_c(7) = J_c(7)+delI(12);
    
    %Voltage Drop Matrix(D) Computation
    D_aa = W_aa.*(J_a.');
    D_ab = W_ab.*(J_b.');
    D_ac = W_ac.*(J_c.');
    D_ba = W_ba.*(J_a.');
    D_bb = W_bb.*(J_b.');
    D_bc = W_bc.*(J_c.');
    D_ca = W_ca.*(J_a.');
    D_cb = W_cb.*(J_b.');
    D_cc = W_cc.*(J_c.');
    
    %Source to Other Bus Drop Matrix(L) Computation
    L_a = zeros(length(paths), length(branches));
    L_b = zeros(length(paths), length(branches));
    L_c = zeros(length(paths), length(branches));
    
    for i = 1: length(paths)
        for j = 1:length(branches)
            if E(i,j) == 1 
                for k = 1:j
                    L_a(i,j) = L_a(i,j)+D_aa(i,k)+D_ab(i,k)+D_ac(i,k);
                    L_b(i,j) = L_b(i,j)+D_ba(i,k)+D_bb(i,k)+D_bc(i,k);
                    L_c(i,j) = L_c(i,j)+D_ca(i,k)+D_cb(i,k)+D_cc(i,k);
                end
            end
        end
    end
    
    V_a_new = ones(25,1);
    V_b_new = ones(25,1)* exp(-1i*2*pi/3);
    V_c_new = ones(25,1)* exp(1i*2*pi/3);
    %disp("La");
    %disp(L_a);
    for i = 1:length(branches)
        maxa=0;
        maxb=0;
        maxc=0;
        for j = 1: length(paths)
            countx= E(j,i)- L_a(j,i);
            if (abs(countx)>abs(maxa))
                maxa = countx;
            end
            county= E(j,i)*exp(-1i*2*pi/3)- L_b(j,i);
            if (abs(county)>abs(maxb))
                maxb = county;
            end
            countz= E(j,i)*exp(1i*2*pi/3)- L_c(j,i);
            if (abs(countz)>abs(maxc))
                maxc = countz;
            end

        end

        V_a_new(i+1) = maxa;
        V_b_new(i+1) = maxb;
        V_c_new(i+1) = maxc;
%         disp("V_a");
%         disp(V_a_new);
%        disp(V_a);
%        disp("V_b");
%        disp(V_b);
%        disp("V_c");
%        disp(V_c);
    end
    %disp(V_a);

    
    disp(V_a_new);
    count =0;
    for i =1:25
        %disp(i)
        %disp(V_a_new(i)-V_a(i));

     
        if (abs(abs(V_a_new(i))-abs(V_a(i)))<=err)
            count = count+1;
        end
        %disp(V_b_new(i)-V_b(i));
        if (abs(abs(V_b_new(i))-abs(V_b(i)))<=err)
            
            count = count+1;
        end
        %disp(V_c_new(i)-V_c(i));
        if (abs(abs(V_c_new(i))-abs(V_c(i)))<=err)
            
            count = count+1;
        end
    end
    if count == 75   
        disp("converged");
        a=1;
        break;
    else
        %disp("yo")
        %disp(V_a_new);
        V_a = V_a_new;
        %disp(V_a);
        V_b = V_b_new;
        V_c = V_c_new;
        
    end
        
    %disp(t);
    t= t+1;


end
if a ==0
    disp("Not converged");
end


disp("V_a");
disp(V_a);
disp("V_b");
disp(V_b);
disp("V_c");
disp(V_c);