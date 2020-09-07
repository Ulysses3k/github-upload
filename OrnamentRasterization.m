I = imread('BaroqueOrnament.png');

blur = 1;

Ic = I(65:180,40:550);
Ib = imgaussfilt(Ic,blur);
Ibw = imbinarize(Ic);
[B,L,n,A] = bwboundaries(Ibw);

[centers, radii, metric] = imfindcircles(Ibw,[10,200]);
theta = 0:179;
[R,xp] = radon(Ibw,theta);
Icor = corner(Ibw);
IBrisk = detectBRISKFeatures(Ibw);

subplot(2,1,1)
imshow(Ic)
subplot(2,1,2)
imshow(Ibw)
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'r');
end
% viscircles(centers, radii, 'EdgeColor','g')
plot(Icor(:,1),Icor(:,2),'b*')
plot(IBrisk.selectStrongest(20))