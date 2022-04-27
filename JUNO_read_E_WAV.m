function JUNO_read_E_WAV(date)

global epoch_E_WAV E_WAV_LFR_LO_f E_WAV_LFR_LO_data;

%--- Initialize
path = '';

%--- Search for file
doy = irf_time(date,'vector>doy');
doy = doy(2)
doyformat = '%03d';
%dirres = dir([path 'WAV_' num2str(date(1)) num2str(doy,doyformat) '*.CSV']);
dirres = dir([path 'WAV_' num2str(date(1)) num2str(doy,doyformat) '*_E_V*.CSV']);
file = [dirres.folder '\' dirres.name];
disp(['Reading file ' file]);

%--- Read time from CSV file
E_WAV_UTC = JUNO_read_E_WAV_UTC(file);
    
%--- Convert time
n = numel(E_WAV_UTC);
epoch_E_WAV = zeros(n,1);
year = date(1);
for i=1:n
    numbers = regexp(E_WAV_UTC(i),'\d*','Match');
    h = str2num(numbers(3));
    m = str2num(numbers(4));
    s = str2num(numbers(5));
    ms = str2num(numbers(6));

    epoch_E_WAV(i) = irf_time([year,doy,h,m,s,ms,0,0],'doy8>epoch');
    
    if mod(i,1000)==0
        i
    end;
end;

%--- Read data
E_WAV_data = JUNO_read_E_WAV_data(file);
E_WAV_LFR_LO_data = E_WAV_data(:,1:43);

%--- Read frequencies
E_WAV_f = JUNO_read_E_WAV_f(file);
n = numel(E_WAV_f);
f_temp = zeros(n,1);
for i=1:n
    f_temp(i) = str2num(E_WAV_f(i));
end
E_WAV_LFR_LO_f = f_temp;



return;