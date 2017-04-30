figure(1)
hold on

maxstress = max(stress(:,4));
minstress = min(stress(:,4));

V = [minstress maxstress];

colormap(jet(100));
caxis(V)

for e = 1:numele

	minix = x(node(:,e));
	miniy = y(node(:,e));

	patch(minix,miniy,stress(e,4))

end

%axis([0 50 -6 6])

