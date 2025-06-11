%% import Data

Data = readtable('/Users/matthew/Desktop/量化數據分析期末/data/Stats_survey.csv');

Data.Properties.VariableNames = {'TS', 'Sex', 'MatricGrade', 'Year', 'Faculty', ...
    'Grade', 'Accom', 'Allowance', 'Scholarship', 'StudyTime', 'Party', 'Alcohol',...
    'MissClass', 'FailClass', 'Relationship', 'ParentsApprove', 'ParentsRelation'};

% del the high school Data
Data(strcmp(Data.Year, ''), :) = [];
%Data = Data(~any(ismissing(Data), 2), :);

%% get all sex
label = {'Male', 'Female'};
sex(1) = sum(strcmp(Data.Sex, label{1}));
sex(2) = sum(strcmp(Data.Sex, label{2}));

percent = sex/sum(sex);
label = strcat(label, {' - '}, string(round(percent, 2)), '%');

figure, pie(sex, label);
set(gcf, 'Renderer', 'painters');
print(gcf, '/Users/matthew/Desktop/量化數據分析期末/plot/all_sex.svg', '-dsvg');

%% get all year
label = {'1st Year', '2nd Year', '3rd Year', '4th Year', 'Postgraduate'};
year(1) = sum(strcmp(Data.Year, label{1}));
year(2) = sum(strcmp(Data.Year, label{2}));
year(3) = sum(strcmp(Data.Year, label{3}));
year(4) = sum(strcmp(Data.Year, label{4}));
year(5) = sum(strcmp(Data.Year, label{5}));
year(4) = year(5) + year(4);
year(5) = [];
label = {'1st Year', '2nd Year', '3rd Year', '4th Year and Postgraduate'};

percent = year/sum(year);
label = strcat(label, {' - '}, string(round(percent, 2)), '%');

figure, pie(year, label);
set(gcf, 'Renderer', 'painters');
print(gcf, '/Users/matthew/Desktop/量化數據分析期末/plot/all_year.svg', '-dsvg');

%% get all Faculty
label = unique(Data.Faculty);

for k = 1 : length(label)
    faculty(k) = sum(strcmp(Data.Faculty, label{k}));
    disp(k)
end
size(faculty)

faculty(1) = [];

percent = faculty/sum(faculty);
label(1) = [];
label(7) = {'Medicine and Health'};

label = strcat(label', {' - '}, string(round(percent, 2)), '%');

figure, pie(faculty, label);
set(gcf, 'Renderer', 'painters');
print(gcf, '/Users/matthew/Desktop/量化數據分析期末/plot/all_faculty.svg', '-dsvg');

