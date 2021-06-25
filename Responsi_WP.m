% Waffiq Aziz / 123190070 / Plug-F
% link dataset : https://archive.ics.uci.edu/ml/machine-learning-databases/00477/
%% CLEAR COMMAN WINDOW
clc;
clear;

%% MENYIAPKAN DATA
% ammbil data kolom ke 3-5 sebanyak 50 baris
data1 = readtable('dataset.xlsx','Range','C2:E51');
data1 = table2cell(data1); %ubah kebentuk cell

% ambil data kolom ke-7 (House Price Of Unit Area) sebanyak 50 baris
data2 = readtable('dataset.xlsx','Range','H2:H51');
data2 = table2cell(data2); %ubah kebentuk cell

data = [data1,data2]; % gabungkan ke-dua cell (data1 dan data2)

data = cell2table(data); % ubah menjadi table

data = table2array(data); % ubah menjadi array

%% atribut tiap-tiap kriteria, dimana nilai :
% 1 --> atrribut keuntungan 
% 0 --> atribut biaya
% namun, berdasarkan uji coba index 1 dan 3 tidak bisa bernilai 0
% karena hasil akan bernilai 0, oleh karena itu index 1 dan 3 bernilai 1
k = [1, 0, 1, 0]; 

%% Nilai bobot tiap kriteria 
w = [3, 5, 4, 1];

%% inisialisasi ukuran data yakni 50x4
[m, n] = size (data); 

%% membagi bobot per kriteria dengan jumlah total seluruh bobot
w = w./sum(w); 

%% MELAKUKAN PERHITUNGAN VEKTOR(S) per baris (alternatif)
S = 0;
for j = 1 : n
    if k(j) == 0
        w(j) = -1*w(j);
    end
end
for i = 1 : m
    S(i) = prod(data(i,:).^w);
end

%% MENGHITUNG PERINGKAT
hitungPeringkat = S/sum(S);

% penyortiran berdasarkan nilai tertinggi
[hasilPeringkat,index] = sort(hitungPeringkat,'descend');

% menampilkan hasilnya ke command window
disp('Hasil Tertinggi (kanan ke kiri)');
disp(hasilPeringkat(1:5))
disp('Index-nya');
disp(index(1:5))
