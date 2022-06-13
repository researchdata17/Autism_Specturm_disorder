function [prepreces_data] = preprocess_data(data_val)
   data_text = [];
   prepreces_data = []; 
    for i=1:length(data_val(:,1))
       for j=1:length(data_val(1,:))
            if string(data_val(i,j)) ~= '1' && string(data_val(i,j))~='0'
               data_text = [data_text,sum(double((cell2mat(data_val(i,j)))))]; 
            else
               data_text = [data_text,sum(double(str2double(string(data_val(i,j)))))];
            end
       end
       prepreces_data = [prepreces_data; data_text];
       data_text = [];
    end
   
end

