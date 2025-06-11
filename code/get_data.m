function result = get_data(Data, var_name)

label = unique(Data.(var_name));
label
if label{1} == ' ' or 
    label(1) = {'unknown'};
end

for k = 1 : length(label)
    result(k, 1) = sum(strcmp(Data.(var_name), label{k}));
end

