%% get all alcohol
label = unique(Data.Alcohol);

for k = 1 : length(label)
    alcohol(k, 1) = sum(strcmp(Data.Alcohol, label{k}));
end
size(alcohol)

percent = alcohol(:, 1)/sum(alcohol(:, 1));

label1 = strcat(label, {' - '}, string(round(percent, 2)), '%');

figure, pie(alcohol(:, 1), label1);
%% male female alcohol

male = Data(strcmp(Data.Sex, 'Male'), :);
female = Data(strcmp(Data.Sex, 'Female'), :);

male_alc = [];
female_alc = [];

for k = 1 : height(male)
    
    male_alc = [male_alc, find(strcmp(label, male.Alcohol(k)))];

end

figure, histogram(male_alc);
xticks(1:length(label))
xticklabels(label);
xlabel('每週飲酒次數');
ylabel('人數')

for k = 1 : height(female)
    
    female_alc = [female_alc, find(strcmp(label, female.Alcohol(k)))];

end

figure, histogram(female_alc);
xticks(1:length(label))
xticklabels(label);
xlabel('每週飲酒次數');
ylabel('人數')


%% get all Accom
label = unique(Data.Accom);

for k = 1 : length(label)
    Accom(k) = sum(strcmp(Data.Accom, label{k}));
    disp(k)
end
size(Accom)

percent = Accom/sum(Accom);
label(1) = {'unknown'};

label = strcat(label', {' - '}, string(round(percent, 2)), '%');

figure, pie(Accom, label);

%% alcohol Accom
label = unique(Data.Alcohol);

stay_with = Data(strcmp(Data.Accom, 'Private accommodation/ stay with family/friends'), :);
nostay_with = Data(strcmp(Data.Accom, 'Non-private accommodation ie. Res'), :);

for k = 1 : length(label)
    Accom(k) = sum(strcmp(stay_with.Alcohol, label{k}));
    disp(k)
end
size(Accom)

label(1) = {'unknown'};

label = strcat(label', {' - '}, string(round(percent, 2)), '%');

figure, bar(Accom)
xticklabels(label)
title('stay_with')

label = unique(Data.Alcohol);
for k = 1 : length(label)
    Accom(k) = sum(strcmp(nostay_with.Alcohol, label{k}));
    disp(k)
end
size(Accom)

label(1) = {'unknown'};

label = strcat(label', {' - '}, string(round(percent, 2)), '%');

figure, bar(Accom)
xticklabels(label)
title('nostay_with')