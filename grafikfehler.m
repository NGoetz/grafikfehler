%entfernt Fehler aus Bildateien, welche im CSV-Format übergeben werden
M=csvread('clara.csv'); %einlesen
[m,n]=size(M);
p=0; %Zähler für Anzahl der Überarbeitungen
while p<3
for k=2:1:m-2  %nicht für Randpixel!
  for l=2:1:n-2
  %arithmetisches Mittel der angrenzenden Pixel
    M(k,l)=ceil((M(k+1,l)+M(k,l+1)+M(k-1,l)+M(k,l-1))/4);
   end
end
for k=2:1:m-2
  for l=2:1:n-2
  %Median der angrenzenden Pixel
    M(k,l)=median([M(k+1,l),M(k,l+1),M(k-1,l),M(k,l-1)]);
   end
end
p=p+1;
end
imagesc(M); %Ausgabe
%by Niklas Götz