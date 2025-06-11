%%
data = Data(~any(ismissing(Data(:, {'MatricGrade', 'Grade'})), 2), :);
data(:, {'MatricGrade', 'Grade'}) = round(data(:, {'MatricGrade', 'Grade'}));
data = data(ismember(data.Year, {'1st Year', '2nd Year'}), :);
%data = data(strcmp(data.Sex, 'Male'), :);
%data = data(strcmp(data.Year, '3rd Year'), :);

delta = data.Grade - data.MatricGrade;
%figure, plot(delta)

clabel = {'zero', 'one', 'thr', 'fif', 'eig'};
cdata.(clabel{1}) = data(strcmp(data.Alcohol, '0'), :);
cdata.(clabel{2}) = data(strcmp(data.Alcohol, '1-3'), :);
cdata.(clabel{3}) = data(strcmp(data.Alcohol, '3-5'), :);
cdata.(clabel{4}) = data(strcmp(data.Alcohol, '5-8'), :);
cdata.(clabel{5}) = data(strcmp(data.Alcohol, '8+'), :);

delta = cell(numel(fieldnames(cdata)), 1);
for k = 1: numel(fieldnames(cdata))
    tdata = cdata.(clabel{k});
    delta(k) = {tdata.Grade};
    %delta(k) = {tdata.Grade - tdata.MatricGrade};
end

figure; 
vals = cat(1, delta{:});
groups = repelem(1:numel(delta), cellfun(@numel,delta)).';
clabel = {'0', '1-3', '3-5', '5-8', '8+'};
boxplot(vals, groups, 'Labels', clabel);
xlabel('每週飲酒次數')
ylabel('成績')


%%
%data = Data(strcmp(Data.Faculty, 'Economic & Management Sciences'), :);
%data = Data(ismember(Data.Year, {'1st Year', '2nd Year'}), :);
data = Data(strcmp(Data.Year, '3rd Year'), :);
%data = data(strcmp(data.Sex, 'Female'), :);
%data = Data(~any(ismissing(Data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
data = data(~any(ismissing(data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
data(:, {'MatricGrade', 'Grade'}) = round(data(:, {'MatricGrade', 'Grade'}));


clabel = {'zero', 'one', 'thr', 'fif', 'eig'};
cdata.(clabel{1}) = data(strcmp(data.StudyTime, '0'), :);
cdata.(clabel{2}) = data(strcmp(data.StudyTime, '1-3'), :);
cdata.(clabel{3}) = data(strcmp(data.StudyTime, '3-5'), :);
cdata.(clabel{4}) = data(strcmp(data.StudyTime, '5-8'), :);
cdata.(clabel{5}) = data(strcmp(data.StudyTime, '8+'), :);

delta = cell(numel(fieldnames(cdata)), 1);
for k = 1: numel(fieldnames(cdata))
    tdata = cdata.(clabel{k});
    delta(k) = {tdata.Grade};
    %delta(k) = {tdata.Grade - tdata.MatricGrade};
end

figure; 
vals = cat(1, delta{:});
groups = repelem(1:numel(delta), cellfun(@numel,delta)).';
boxplot(vals, groups, 'Labels', clabel);
xlabel('每週飲酒次數')
ylabel('成績')
%%
set(gcf, 'Renderer', 'painters');
print(gcf, '/Users/matthew/Desktop/量化數據分析期末/plot/3year_grade.svg', '-dsvg');

%%
%data = Data(strcmp(Data.Faculty, 'Economic & Management Sciences'), :);
%data = Data(ismember(Data.Year, '3rd Year'), :);
%data = Data(ismember(Data.Year, {'1rd Year', '2nd Year'}), :);
data = Data(strcmp(Data.Sex, 'Male'), :);
data = data(~any(ismissing(data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
%data = data(~any(ismissing(data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
data(:, {'MatricGrade', 'Grade'}) = round(data(:, {'MatricGrade', 'Grade'}));

label = unique(data.StudyTime);
alc_label = unique(data.Alcohol);

heatdata = [];
for k = 1 : length(label)
    ddata = data(strcmp(data.StudyTime, label{k}), :);
    temp = [];
    for j = 1 : length(alc_label)
        temp = [temp, sum(strcmp(ddata.Alcohol, alc_label{j}))];
    end
    heatdata = [heatdata; temp];
end

figure, h = heatmap(alc_label, label, heatdata);
xlabel('每週飲酒次數')
ylabel('每週課外讀書時間（小時）')

%%
set(gcf, 'Renderer', 'painters');
print(gcf, '/Users/matthew/Desktop/量化數據分析期末/plot/3year_grade.svg', '-dsvg');
%%
%data = Data(strcmp(Data.Faculty, 'Economic & Management Sciences'), :);
data = Data(ismember(Data.Year, '3rd Year'), :);
%data = Data(ismember(Data.Year, {'1rd Year', '2nd Year'}), :);
%data = Data(strcmp(Data.Sex, 'Female'), :);
data = data(~any(ismissing(data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
%data = data(~any(ismissing(data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
data(:, {'MatricGrade', 'Grade'}) = round(data(:, {'MatricGrade', 'Grade'}));

label = unique(data.StudyTime);
alc_label = unique(data.Alcohol);

heatdata = [];
for k = 1 : length(label)
    ddata = data(strcmp(data.StudyTime, label{k}), :);
    temp = [];
    for j = 1 : length(alc_label)
        dddata = ddata(strcmp(ddata.Alcohol, alc_label{j}), :);
        temp = [temp, mean(dddata.Grade)];
        %temp = [temp, mean(dddata.Grade - dddata.MatricGrade)];
    end
    heatdata = [heatdata; temp];
end

figure, h = heatmap(alc_label, label, heatdata);
xlabel('每週飲酒次數')
ylabel('每週課外讀書時間（小時）')

%% 不同年級 飲酒次數和讀書時間與學期成績的關係
%data = Data(strcmp(Data.Faculty, 'Economic & Management Sciences'), :);
data = Data(ismember(Data.Year, '3rd Year'), :);
%data = Data(ismember(Data.Year, {'1st Year', '2nd Year'}), :);
data = data(strcmp(data.Sex, 'Male'), :);
data = data(~any(ismissing(data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
%data = data(~any(ismissing(data(:, {'MatricGrade', 'Grade', 'StudyTime'})), 2), :);
data(:, {'MatricGrade', 'Grade'}) = round(data(:, {'MatricGrade', 'Grade'}));

label = unique(data.StudyTime);
alc_label = unique(data.Alcohol);

heatdata = [];
for k = 1 : length(label)
    ddata = data(strcmp(data.StudyTime, label{k}), :);
    temp = [];
    for j = 1 : length(alc_label)
        dddata = ddata(strcmp(ddata.Alcohol, alc_label{j}), :);
        temp = [temp, mean(dddata.Grade)];
        %temp = [temp, mean(dddata.Grade - dddata.MatricGrade)];
    end
    heatdata = [heatdata; temp];
end

figure, h = heatmap(alc_label, label, heatdata);
ylabel('StudyTime');
xlabel('Alcohol');