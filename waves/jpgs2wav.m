outputwav=zeros(9649080,2);
fs=44100;%输出音频取样率
fps=30;%输入视频帧率
k=1;
for n=1:6564
    %=====读取对应图片=====%
    im = imread(['E:\MATLAB\MATLAB\bin\wenjian\videos\Bad_Apple\',num2str(n),'.jpg']);
    
    %=====二值化后提取边缘信息，对每个坐标存于数对集合{(x,y)}中=====%
    im_ = bwperim(im2bw(im , 0.4 ));
    [x,y] = find( im_==1 );
    %=====于集合{(x,y)}中随机选取元素<s>，人体描边大师</s>=====%
    LENGTH = length( x );
    if LENGTH == 0
        x = 0;
        y = 0;
    end
    for  m = n*fs/fps : (n+1)*fs/fps-1
        rand_ = floor(rand()*LENGTH+1);
        outputwav(k,:) = [ x( rand_ ),y( rand_ ) ];
        k=k+1;
    end
    
    fprintf('%%%g finished now.\n',n/6564*100);
end
audiowrite ('outputwav.wav',outputwav/1440,fs);
