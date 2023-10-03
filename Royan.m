rgb = imread('C:\Users\ASUS-PLUS\Desktop\33-2days.p.in.jpg');
imshow(rgb)
blueChannel = rgb(:,:,3);
allBlack = zeros(size(rgb, 1), size(rgb, 2), 'uint8');

just_blue = cat(3, allBlack, allBlack, blueChannel);
I = rgb2gray(just_blue);
[~,threshold] = edge(I,'sobel');
fudgeFactor = 2;
BWs = edge(I,'sobel',threshold * fudgeFactor);
imshow(BWs)
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BWs,[se90 se0]);
imshow(BWsdil)
BWdfill = imfill(BWsdil,'holes');
imshow(BWdfill)
title('Binary Image with Filled Holes')
Bw=regionprops(BWdfill, 'Centroid', 'BoundingBox');
centroids = vertcat(Bw.Centroid);

%mask = (centroids(:,1) >= 400) && (centroids(:,1) <= 450) && (centroids(:,2) >= 300) && (centroids(:,2) <= 350);
%wanted_regions = Bw(mask);
%for i=1:
%%

imageRegionAnalyzer(BWdfill);
%%
%propsTable=cat(regionprops(Bw,);
%%
%detecting baseline
k=1;
Arra=table2array(propsTable);
for i=1:length(propsStruct)
    if (Arra(i,4)>0.9) && (abs(Arra(i,5))<15) && ((Arra(i,2)/Arra(i,3))>2) 
        Id(k,1)=i;
        k=k+1;
    end
end
widt=min(size(blueChannel));
len=max(size(blueChannel));
[AM,idxx]=max(Arra(Id,1));
AA=Arra(idxx,2);

%%
Area=propsTable.Area;
k=1;
% for i=1:length(propsStruct)
%     if Area(i)> 500 
%         %&& (centroids(i,1)>200) &&(centroids(i,1)<350)
%         Tact(k)=i;
%         k=k+1;
%     end
% end

[Areas,indx]= sort(Area,'descend');
props='what is a number of printed foot?';
inp=input(props);


Tact=sort(indx(1:inp));


Label=zeros(length(propsStruct),1);
footPrint=Arra(Tact,:);
Center= centroids(Tact,:);


%%
%changing center
teta=max(size(blueChannel))/20;
for i=1:length(propsStruct)
    for j=1:length(Tact)
        if ((abs(centroids(i,1)-Center(j,1))+ abs(centroids(i,2)-Center(j,2)))<teta)
            Label(i)=j;
        end
    end
end


for i=1:len
    for j=1:widt
        
    end 
end
%%
%run this section if you have extra footprinted
% X=find(Label==0);
% ff=footPrint(X,1);
% [A,L]=max(ff);
% for i=1:length(X)
%     if ((abs(centroids(i,1)-Center(I,1))+ abs(centroids(i,2)-Center(I,2)))<tata)
%             Label(i)=j+1;
%     end
% end
% Center(j+1,1)=centroids(L,1);
% Center(j+1,2)=centroids(L,2);

%%
%Toa spread

for i=1:length(Center)
    In=find(Label(:,1)==i);
    [Ax,AX1]=sort(Arra(In,1));
    if length(AX1)>3
    LL(i)=sum((centroids(AX1(2),:)+centroids(AX1(3),:))-(2*centroids(AX1(1),:)))/4;
    else LL(i)=sum(centroids(AX1(2),:)+centroids(AX1(3),:))/2;
    end
end

%%
%Stride
Lengt=0;
Lengt1=0;
for i=1:2:length(Center)-2

Lengt=sqrt((Center(i,1)-Center(i+2,1)).^2+(Center(i,2)-Center(i+2,2)).^2)+Lengt;
Angle(round(i/2),1)= Orient(i);
end
Lengt=Lengt/length(Angle);
Strideup=Lengt/AA;
for i=2:2:length(Center)-2

Lengt1=sqrt((Center(i,1)-Center(i+2,1)).^2+(Center(i,2)-Center(i+2,2)).^2)+Lengt1;
Angle1(round(i/2),1)= Orient(i);

end

Lengt1=(Lengt1/length(Angle1))/AA;
Stridedown=Lengt1/AA;
%%
%Step

for i=2:length(Center)
    minus(i-1,:)=Center(i,1)-Center(i-1,1);
    minus1(i-1,:)=Center(i,2)-Center(i-1,2);
end


%%
%All

Toaspread=(sum(LL)/length(Center))/AA;
Step=(sum(minus)/length(minus))/AA;
Width=(sum(minus1)/length(minus1))/AA;
Stride=((Strideup+Stridedown)/2)/AA;
Orient=footPrint(:,5);
Powarea=(footPrint(:,1))/(AA.^2);