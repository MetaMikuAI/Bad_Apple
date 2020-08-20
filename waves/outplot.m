[data,fs]=audioread('E:\MATLAB\MATLAB\bin\wenjian\oscillofun\outputwav.wav'); %导入音频

high=size(data);
high(2)=[];     %求音频数据量长度
FPS=30;         %设置帧率
ans_=0;         %起始值
count=0;        %帧数
d=1;
% d_=[-d,d,-d,d]; %显示范围
d_=[0,1,-0.75,0]
clear y;        %预先清除y以防冲突（有没有用咱也不知道来着）
K=[-1,1];       %方向系数
data(:,1)=K(1)*data(:,1);
data(:,2)=K(2)*data(:,2);   %根据K改一下方向
while (ans_<high) 
    for n=1:fs/FPS
        y(n,:)=data(n+ans_,:);
    end
    pause(0.02);
    clf;
    plot(y(:,2),y(:,1),'g.');
    axis(d_);
    title(['Bad Apple!!  #',num2str(count)]);
    ans_=ans_+n;
    fprintf('%g%%\n',ans_/high*100);    %输出完成率
    print(gcf,'-dpng',['E:\MATLAB\MATLAB\bin\wenjian\oscillofun\F\',num2str(count),'.jpg']);
    %输出jpg文件（根据需要可取消注释）
    count=count+1;
    pause(0.01)        %停顿
end
