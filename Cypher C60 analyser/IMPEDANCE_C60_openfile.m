clear all
clear 
clc

VECTORtime.name={'1'}
VECTORtime.data=[1]

impedance = 'Z_';

    
path = uigetdir; %get folder path for all files
files_imp = dir(path);

j = 1;
for i = 1:length(files_imp)
   if length(files_imp(i).name) >= (length(impedance))
       if files_imp(i).name(1:(length(impedance) )) == [impedance]
        
           valid_files_imp{j} = files_imp(i).name;
           j = j + 1;
       end 
   end
end

        
          for j = 1:length(valid_files_imp)
    filename_imp_withoutxlsx = valid_files_imp{j}(1:end-4);
    full_path_imp = [path '/' char(valid_files_imp(j))];
    eval(sprintf('%s_imp.data = importdata(full_path_imp);',filename_imp_withoutxlsx)); 
    
    eval(sprintf('%s_imp.FREQUENCY = %s_imp.data.data(:,1);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));
    eval(sprintf('%s_imp.IMPEDANCE = %s_imp.data.data(:,2);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));
    eval(sprintf('%s_imp.ADMITTANCE = %s_imp.data.data(:,3);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));
    eval(sprintf('%s_imp.PHASE = %s_imp.data.data(:,4);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));
    eval(sprintf('%s_imp.RESISTANCE = %s_imp.data.data(:,5);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));
    eval(sprintf('%s_imp.REACTANCE = %s_imp.data.data(:,6);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));
    eval(sprintf('%s_imp.CONDUCTANCE = %s_imp.data.data(:,7);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));
    eval(sprintf('%s_imp.SUSCEPTANCE = %s_imp.data.data(:,8);',filename_imp_withoutxlsx,filename_imp_withoutxlsx));

          end

          
          









