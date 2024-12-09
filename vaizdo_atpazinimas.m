close all
clear all
clc
%% raidþiø pavyzdþiø nuskaitymas ir poþymiø skaièiavimas
%% read the image with hand-written characters
pavadinimas = 'train_data.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 7);
%% Atpaþintuvo kûrimas
%% Development of character recognizer
% poþymiai ið celiø masyvo perkeliami á matricà
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisingø atsakymø matrica: 11 raidþiø, 8 eilutës mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(7), eye(7), eye(7), eye(7), eye(7)];
% sukuriamas SBF tinklas duotiems P ir T sàryðiams
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = newrb(P,T,0,1,13);

%% Tinklo patikra | Test of the network (recognizer)
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,12:22);
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, '0'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, '2'];
        case 4
            atsakymas = [atsakymas, '3'];
        case 5
            atsakymas = [atsakymas, '4'];
        case 6
            atsakymas = [atsakymas, '5'];
        case 7
            atsakymas = [atsakymas, '6'];
    end
end
% pateikime rezultatà komandiniame lange
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% þodþio "KADA" poþymiø iðskyrimas 
%% Extract features of the test image
pavadinimas = 'test_1.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
%% Perform letter/symbol recognition
% poþymiai ið celiø masyvo perkeliami á matricà
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, '0'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, '2'];
        case 4
            atsakymas = [atsakymas, '3'];
        case 5
            atsakymas = [atsakymas, '4'];
        case 6
            atsakymas = [atsakymas, '5'];
        case 7
            atsakymas = [atsakymas, '6'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
result_test_1_13 = atsakymas;
%% þodþio "FIKCIJA" poþymiø iðskyrimas 
%% extract features for next/another test image
pavadinimas = 'test_2.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
% poþymiai ið celiø masyvo perkeliami á matricà
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, '0'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, '2'];
        case 4
            atsakymas = [atsakymas, '3'];
        case 5
            atsakymas = [atsakymas, '4'];
        case 6
            atsakymas = [atsakymas, '5'];
        case 7
            atsakymas = [atsakymas, '6'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off
result_test_2_13 = atsakymas;

% now we're going to train a network with 5 neurons
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = newrb(P,T,0,1,5);

%% Tinklo patikra | Test of the network (recognizer)
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,12:22);
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, '0'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, '2'];
        case 4
            atsakymas = [atsakymas, '3'];
        case 5
            atsakymas = [atsakymas, '4'];
        case 6
            atsakymas = [atsakymas, '5'];
        case 7
            atsakymas = [atsakymas, '6'];
    end
end
% pateikime rezultatà komandiniame lange
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% þodþio "KADA" poþymiø iðskyrimas 
%% Extract features of the test image
pavadinimas = 'test_1.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
%% Perform letter/symbol recognition
% poþymiai ið celiø masyvo perkeliami á matricà
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, '0'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, '2'];
        case 4
            atsakymas = [atsakymas, '3'];
        case 5
            atsakymas = [atsakymas, '4'];
        case 6
            atsakymas = [atsakymas, '5'];
        case 7
            atsakymas = [atsakymas, '6'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
result_test_1_5 = atsakymas;
%% þodþio "FIKCIJA" poþymiø iðskyrimas 
%% extract features for next/another test image
pavadinimas = 'test_2.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
% poþymiai ið celiø masyvo perkeliami á matricà
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, '0'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, '2'];
        case 4
            atsakymas = [atsakymas, '3'];
        case 5
            atsakymas = [atsakymas, '4'];
        case 6
            atsakymas = [atsakymas, '5'];
        case 7
            atsakymas = [atsakymas, '6'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off
result_test_2_5 = atsakymas;

% now let's calculate and compare the accuracy of the results
%% Accuracy Calculation and Comparison
% Define the correct results for the test images (ground truth)
teisingas_test_1 = '023651'; 
teisingas_test_2 = '332046'; 

% Calculate accuracy for 13 neurons
disp(teisingas_test_1)
disp(result_test_1_13)
disp(teisingas_test_2)
disp(result_test_2_13)
teisingu_sk_test_1_13 = sum(result_test_1_13 == teisingas_test_1);
tikslumas_test_1_13 = (teisingu_sk_test_1_13 / length(teisingas_test_1)) * 100;

teisingu_sk_test_2_13 = sum(result_test_2_13 == teisingas_test_2);
tikslumas_test_2_13 = (teisingu_sk_test_2_13 / length(teisingas_test_2)) * 100;

% Calculate accuracy for 5 neurons
disp(teisingas_test_1)
disp(result_test_1_5)
disp(teisingas_test_2)
disp(result_test_2_5)
teisingu_sk_test_1_5 = sum(result_test_1_5 == teisingas_test_1);
tikslumas_test_1_5 = (teisingu_sk_test_1_5 / length(teisingas_test_1)) * 100;

teisingu_sk_test_2_5 = sum(result_test_2_5 == teisingas_test_2);
tikslumas_test_2_5 = (teisingu_sk_test_2_5 / length(teisingas_test_2)) * 100;

%% Display Results
fprintf('Test 1 Results:\n');
fprintf('Accuracy with 13 Neurons: %.2f%%\n', tikslumas_test_1_13);
fprintf('Accuracy with 5 Neurons: %.2f%%\n\n', tikslumas_test_1_5);

fprintf('Test 2 Results:\n');
fprintf('Accuracy with 13 Neurons: %.2f%%\n', tikslumas_test_2_13);
fprintf('Accuracy with 5 Neurons: %.2f%%\n\n', tikslumas_test_2_5);

%% Compare Overall Performance
average_accuracy_13 = (tikslumas_test_1_13 + tikslumas_test_2_13) / 2;
average_accuracy_5 = (tikslumas_test_1_5 + tikslumas_test_2_5) / 2;

fprintf('Overall Average Accuracy:\n');
fprintf('13 Neurons: %.2f%%\n', average_accuracy_13);
fprintf('5 Neurons: %.2f%%\n', average_accuracy_5);
