clear;
inp= rand(100,2)*100;

[outp,C] = kmeans(inp,10);

%figure;
size(outp)
%scatter(cat(1,inp(:,1),C(:,1)),cat(1,inp(:,2),C(:,2)),25,cat(1,zeros(100,1),ones(10,1)*45),'filled');

gscatter(inp(:,1),inp(:,2),outp);



 %plot(inp);
% [outp,C] = kmeans(inp,10);
% plot(inp(:,1),inp(:,2),'k*','MarkerSize',5);
% figure;
% plot(C(:,1),C(:,
%2),'k*','MarkerSize',5);
