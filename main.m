%Sinyaller dosyadan okunuyor.
load eeg.mat

%Filtreler dosyadan okunuyor.
load BSF50Hz.mat
load HPF0_5Hz.mat
load LPF120Hz.mat

%Matrisin boyutu sizeEEG değişkenine kaydediliyor.
[sizeEEG,~] = size(eeg);

%Her bir sinyal 3 farklı filtreden geçiriliyor.
for i=1:sizeEEG
eeg(i,:) = filter(Num,1,eeg(i,:));
eeg(i,:) = filter(Num2,1,eeg(i,:));
eeg(i,:) = filter(Num3,1,eeg(i,:));
end

%Her bir sinyal 10 örneklik %50 örtüşmeli pencerelere ayrılıyor.

signals = zeros(sizeEEG,length(eeg));

for k=1:sizeEEG
    
s = eeg(k,:);
l = length(s);
wind = 10;
avg = [];
a = 1;
i = 1; 

while( i + wind <= l  )
    
    sig = s(i:(i+wind));
    avg(i:(i+wind)) = sig - mean(sig);
    i = i + wind/2;
    
end

signals(k,1:length(avg)) = avg ;
    
end

%Sinyaller ilk 4 içsel mod fonksiyonuna ayrılıyor.
imf = cell(20,4);

for i=1:20
    
    temp = emd_n(signals(i,:),4);
    
    for k = 1:4
        imf{i,k} = temp(k,:);
    end
    
end

%Sınıflandırma adımı.(Devam ediyor.)


