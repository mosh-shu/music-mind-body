%% ジングルベルの作成

% 音の長さ
bpm = 80;
d4  = 60/bpm;   % 四分音符
d8  = d4/2;     % 八分音符
d16 = d4/4;     % 十六分音符
d6  = d16*3;    % 符点八分音符
d3  = d8*3;     % 符点四分音符
d2  = d4*2;     % 二分音符
d1  = d4*4;     % 全音符

% 基準音
a = 1;
wd = 0.05;
Fs = 8000;

melody = {"A" 5 d16; "0" 5 d16; "A" 5 d16; "0" 5 d16; "A" 5  d6; "0" 5 d16;...
          "A" 5 d16; "A" 5 d16; "0" 5 d16; "A" 5  d4; "0" 5 d16;...
          "A" 5 d16; "0" 5 d16; "C" 6 d16; "0" 5 d16; "F" 5 d16; "G" 5 d16;...
          "0" 5 d16; "A" 5  d4; "0" 5 d16; "0" 5  d4;...
          "B" 5 d16; "0" 5 d16; "B" 5 d16; "0" 5 d16; "B" 5 d16; "B" 5 d16;...
          "0" 5 d16; "B" 5  d6; "A" 5 d16; "0" 5 d16; "A" 5 d16; "0" 5 d16;...
          "A" 5 d16; "0" 5 d16; "A" 5 d16; "0" 5 d16; "G" 5 d16; "0" 5 d16;...
          "G" 5 d16; "A" 5 d16; "0" 5 d16; "G" 5  d6; "0" 5  d8; "C" 6  d8;...
          "0" 5  d8;...
          "A" 5 d16; "0" 5 d16; "A" 5 d16; "0" 5 d16; "A" 5  d6; "0" 5 d16;...
          "A" 5 d16; "A" 5 d16; "0" 5 d16; "A" 5  d4; "0" 5 d16;...
          "A" 5 d16; "0" 5 d16; "C" 6 d16; "0" 5 d16; "F" 5 d16; "G" 5 d16;...
          "0" 5 d16; "A" 5  d4; "0" 5 d16; "0" 5  d4;...
          "B" 5 d16; "0" 5 d16; "B" 5 d16; "0" 5 d16; "B" 5  d6; "B" 5  d6;...
          "A" 5 d16; "0" 5 d16; "A" 5 d16; "0" 5 d16; "A" 5 d16; "0" 5 d16;...
          "C" 6 d16; "0" 5 d16; "C" 6 d16; "0" 5 d16; "B" 5 d16; "G" 5 d16;...
          "0" 5 d16; "F" 5  d2};

base   = {"F"   3 d2; "Fis" 3 d2; ...
          "G"   3 d4; "Gis" 3 d4; "A"   3 d4; "A"   3 d8; "Gis" 3 d8;...
          "G"   3 d2; "F"   3 d2;...
          "D"   3 d4; "Cis" 3 d4; "C"   3 d4; "G"   2 d4;...
          "C"   3 d3; "C"   3 d8; "Cis" 3 d3; "Cis" 3 d8;...
          "D"   3 d4; "Cis" 3 d4; "C"   3 d4; "F"   2 d4;...
          "0"   3 d4; "B"   2 d4; "C"   3 d4; "D"   3 d4;...
          "G"   2 d4; "C"   3 d4; "F"   2 d2};

chord1 = {"E"   4 d2; "E"   4 d2; ...
          "E"   4 d2; "E"   4 d2; ...
          "E"   4 d2; "D"   4 d2; ...
          "F"   4 d4; "F"   4 d4; "E"   4 d4; "E"   4 d4;...
          "E"   4 d2; "E"   4 d2; ...
          "F"   4 d4; "F"   4 d4; "E"   4 d4; "Dis" 4 d4;...
          "0"   4 d4; "D"   4 d4; "E"   4 d4; "F"   4 d4;...
          "D"   4 d4; "E"   4 d4; "D"   4 d2};
      
chord2 = {"A"   4 d2; "A"   4 d2; ...
          "G"   4 d2; "A"   4 d2; ...
          "F"   4 d2; "A"   4 d2; ...
          "A"   4 d4; "Gis" 4 d4; "G"   4 d4; "G"   4 d4;...
          "F"   4 d2; "F"   4 d2; ...
          "A"   4 d4; "Gis" 4 d4; "G"   4 d4; "A"   4 d4;...
          "0"   4 d4; "F"   4 d4; "G"   4 d4; "A"   4 d4;...
          "G"   4 d4; "G"   4 d4; "A"   4 d2};

chord3 = {"C"   5 d2; "C"   5 d2; ...
          "B"   4 d2; "C"   5 d2; ...
          "B"   4 d2; "C"   5 d2; ...
          "C"   5 d4; "H"   4 d4; "B"   4 d4; "B"   4 d4;...
          "A"   4 d2; "A"   4 d2; ...
          "C"   5 d4; "H"   4 d4; "B"   4 d4; "C"   5 d4;...
          "0"   4 d4; "A"   4 d4; "A"   4 d4; "C"   5 d4;...
          "B"   4 d4; "B"   4 d4; "C"   5 d2};
      
ymelody = [];
ybase = [];
ychord = [];

for i = 1:length(melody)
    yi = createTone(a, purefreq(melody{i, 1}, melody{i, 2}), melody{i, 3}, wd, Fs);
    ymelody = [ymelody yi];
end

for i = 1:length(base)
    yi = createTone(a, purefreq(base{i, 1}, base{i, 2}), base{i, 3}, wd, Fs);
    ybase = [ybase yi];
end

for i = 1:length(chord1)
    yi1 = createTone(a, purefreq(chord1{i, 1}, chord1{i, 2}), chord1{i, 3}, wd, Fs);
    yi2 = createTone(a, purefreq(chord2{i, 1}, chord2{i, 2}), chord2{i, 3}, wd, Fs);
    yi3 = createTone(a, purefreq(chord3{i, 1}, chord3{i, 2}), chord3{i, 3}, wd, Fs);
    ychord = [ychord yi1+yi2+yi3];
end

l = [length(ymelody), length(ybase), length(ychord)];

minl = min(l);

ymelody = ymelody(1:minl);
ybase = ybase(1:minl);
ychord = ychord(1:minl);

y = ymelody + ybase + ychord;

sound(y/(1.1*max(y)), Fs);

% 純音作成関数
function yw = createTone(a,f,d,rfd,Fs)
    % 入力引数：
    % Fs サンプリング周波数
    % f 音波の周波数（Hz） 
    % a 音波の振幅
    % d 音波の長さ（秒）
    % rfd 音波の立ち上がり/立ち下がり時間の長さ（秒）
    
    % 0秒からd秒まで、1/Fsの刻み幅で時間軸を作成
    t = 0:1/Fs:d ; 
    % サイン波の作成
    y = a*sin(2*pi*f*t) ; 
    % データポイント数
    n = length(y); 
    % 窓関数の作成
    nw = round(Fs*rfd) ; % 立ち上がり窓のデータ数         
    rw = sin(linspace(0,pi/2,nw)) ; % 窓関数の立上り部の作成
    w  = [rw,ones(1,n-nw*2),fliplr(rw)] ; % 窓関数の作成
    yw  = y.*w ; % サイン波に窓関数をかける
    yw = yw(1:end-1) ; % 最後をカットしポイント数を調整
    
    if f == 0
        yw = zeros(1, length(t));
    end
end

% 平均律の周波数を出力する関数
function Fout = calcS2F(Fref,semitone)
    Fout = 2^(semitone/12) * Fref ;
end

% 純正律の周波数を出力する関数
function Fout = purefreq(note, octave)
    % sound is string of a tone in german
    % octave is int
    % e.g.) purefreq(Cis, 4)
    Fref = 16.5; % C0
    sounds = ["C", "Cis", "D", "Dis", "E", "F", "Fis", "G", "Gis", "A", "B", "H", "0"];
    p = [1, 16/15, 9/8, 6/5, 5/4, 4/3, 45/32, 3/2, 8/5, 5/3, 16/9, 15/8, 2/1, 0];
    
    Fref_oct = Fref * 2^octave;
    soundidx = find(sounds==note);
    
    Fout = Fref_oct * p(soundidx);
    
    if note=="0"
        Fout = 0;
    end
end