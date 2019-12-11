%% �W���O���x���̍쐬

% ���̒���
bpm = 80;
d4  = 60/bpm;   % �l������
d8  = d4/2;     % ��������
d16 = d4/4;     % �\�Z������
d6  = d16*3;    % ���_��������
d3  = d8*3;     % ���_�l������
d2  = d4*2;     % �񕪉���
d1  = d4*4;     % �S����

% ���
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
          "G"   3 d4; "Gis" 3 d4; "A"   3 d4; "A"   3 d8; "G"   3 d8;...
          "G"   3 d2; "F"   3 d2;...
          "D"   3 d4; "Cis" 3 d4; "C"   3 d4; "G"   2 d4;...
          "C"   3 d3; "C"   3 d8; "Cis" 3 d3; "Cis" 3 d8;...
          "D"   3 d4; "Cis" 3 d4; "C"   3 d4; "G"   2 d4;...
          "0"   3 d4; "B"   3 d4; "C"   3 d4; "D"   2 d4;...
          "G"   3 d4; "C"   3 d4; "F"   3 d2};

ymelody = [];

for i = 1:length(melody)
    yi = createTone(a, purefreq(melody{i, 1}, melody{i, 2}), melody{i, 3}, wd, Fs);
    ymelody = [ymelody yi];
end

y = ymelody;

sound(y/max(y), Fs);

% �����쐬�֐�
function yw = createTone(a,f,d,rfd,Fs)
    % ���͈����F
    % Fs �T���v�����O���g��
    % f ���g�̎��g���iHz�j 
    % a ���g�̐U��
    % d ���g�̒����i�b�j
    % rfd ���g�̗����オ��/���������莞�Ԃ̒����i�b�j
    
    % 0�b����d�b�܂ŁA1/Fs�̍��ݕ��Ŏ��Ԏ����쐬
    t = 0:1/Fs:d ; 
    % �T�C���g�̍쐬
    y = a*sin(2*pi*f*t) ; 
    % �f�[�^�|�C���g��
    n = length(y); 
    % ���֐��̍쐬
    nw = round(Fs*rfd) ; % �����オ�葋�̃f�[�^��         
    rw = sin(linspace(0,pi/2,nw)) ; % ���֐��̗���蕔�̍쐬
    w  = [rw,ones(1,n-nw*2),fliplr(rw)] ; % ���֐��̍쐬
    yw  = y.*w ; % �T�C���g�ɑ��֐���������
    yw = yw(1:end-1) ; % �Ō���J�b�g���|�C���g���𒲐�
    
    if f == 0
        yw = zeros(1, length(t));
    end
end

% ���ϗ��̎��g�����o�͂���֐�
function Fout = calcS2F(Fref,semitone)
    Fout = 2^(semitone/12) * Fref ;
end

% �������̎��g�����o�͂���֐�
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