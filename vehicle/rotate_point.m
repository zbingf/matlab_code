function p1 = rotate_point(pc,p0,angle)
% p0 ÈÆpcÐý×ª
% angle µ¥Î» deg
% pc = [x,y];
% p0 = [x1,y1;x2,y2;...]
length_p = length(p0(:,1));
p1 = zeros(length_p,2);
for n =1:length(p0(:,1))
    p = p0(n,:)-pc;
    x = p(1)*cosd(angle)-p(2)*sind(angle)+pc(1);
    y = p(1)*sind(angle)+p(2)*cosd(angle)+pc(2);
    p1(n,:) = [x,y];
end
end