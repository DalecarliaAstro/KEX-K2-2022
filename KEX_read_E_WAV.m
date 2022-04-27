function KEX_read_E_WAV(startdate, stopdate)

global epoch_E_WAV E_WAV_LFR_LO_f E_WAV_LFR_LO_data;

%--- Initialize
path = 'C:\Users\emanu\Desktop\Studies and Research\KTH Studies\CELTE3\EF112X - Examensarbete inom elektroteknik, grundnivå\Juno_Data\Measurements\E-WAV\';

%--- Search for file
startdoy = irf_time(startdate,'vector>doy');
stopdoy = irf_time(stopdate,'vector>doy');

startdatenum = datenum(startdate(1),startdate(2),startdate(3));
stopdatenum = datenum(stopdate(1),stopdate(2),stopdate(3));

epoch_E_WAV = [];
E_WAV_LFR_LO_data = [];
E_WAV_LFR_LO_f = [];

epoch_E_WAV_ = {};
E_WAV_LFR_LO_data_ = {};
E_WAV_LFR_LO_f_ = {};

tempdoy = 0;
setf = 0;
for datenumber = startdatenum:stopdatenum
    % Get day of year (doy)
    doy = day(datetime(datenumber,'ConvertFrom','datenum'),'dayofyear');
    
    % Handle new year
    if tempdoy > doy
        startdate(1) = startdate(1)+1;
    end
    
    doyformat = '%03d';
    %dirres = dir([path 'WAV_' num2str(date(1)) num2str(doy,doyformat) '*.CSV']);
    dirres = dir([path 'WAV_' num2str(startdate(1)) num2str(doy,doyformat) '*_E_V*.CSV']);
    file = [dirres.folder '\' dirres.name];
    %disp(['Reading file ' file]);
    
    if contains(file, '.CSV')
        fprintf('Reading E-WAV data from %d\n', startdate(1)*1000+doy);
        
        %--- Read time from CSV file
        E_WAV_UTC = JUNO_read_E_WAV_UTC(file);

        %--- Convert time
        n = numel(E_WAV_UTC);

        year = startdate(1);
        temp_epoch_E_WAV = zeros(n,1);
        for i=1:n
            numbers = regexp(E_WAV_UTC(i),'\d*','Match');
            h = str2num(numbers(3));
            m = str2num(numbers(4));
            s = str2num(numbers(5));
            ms = str2num(numbers(6));

            temp_epoch_E_WAV(i) = irf_time([year,doy,h,m,s,ms,0,0],'doy8>epoch');

            %if mod(i,1000)==0
            %    i
            %end;
        end;
        epoch_E_WAV__ = temp_epoch_E_WAV;

        %--- Read data
        E_WAV_data = JUNO_read_E_WAV_data(file);
        E_WAV_LFR_LO_data__ = E_WAV_data(:,1:43);

        %--- Read frequencies
        if setf == 0
            setf=setf+1;
            E_WAV_f = JUNO_read_E_WAV_f(file);
            n = numel(E_WAV_f);
            f_temp = zeros(n,1);
            for i=1:n
                f_temp(i) = str2num(E_WAV_f(i));
            end
            E_WAV_LFR_LO_f = f_temp;
        end

        epoch_E_WAV_{end+1} = epoch_E_WAV__';
        E_WAV_LFR_LO_data_{end+1} = E_WAV_LFR_LO_data__';
        %E_WAV_LFR_LO_f_{end+1} = E_WAV_LFR_LO_f__;
    else
        fprintf('No data found on %d\n', startdate(1)*1000+doy);
        %epoch_E_WAV_{end+1} = irf_time(startdate,'vector>epoch')';
        %E_WAV_LFR_LO_data_{end+1} = zeros(43, 1)';
    end
        
    tempdoy = doy;
end

fprintf('Concatinating E-WAV data\n');
epoch_E_WAV = cell2mat(epoch_E_WAV_);
E_WAV_LFR_LO_data = cell2mat(E_WAV_LFR_LO_data_)';
%E_WAV_LFR_LO_f = cell2mat(E_WAV_LFR_LO_f_);

return;