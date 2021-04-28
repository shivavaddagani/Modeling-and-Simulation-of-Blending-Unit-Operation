D=dir
abcd= length(D)
for bbbb=14:1:29
bbbb
currD = D(bbbb).name
cd(currD)
fList = dir(currD)
        cd postfiles
            dir
            z=length(dir)
            run Mean_Indices_computation_6direc_sampling_revised.m
        cd ..
    cd ..
    
    %pause
end



