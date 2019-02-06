% ELEC 4700 Harmonic Wave Equation in 2D FD and Modes

clear all; clc;

nx = 50;
ny = 50;

G = sparse(nx*ny);
B = zeros(1,nx*ny);

sMap = zeros(nx,ny);

for i = 1:nx
    for j = 1:ny
       n = j + (i-1)*ny;
       
       if i == 1 % left
           G(n,:) = 0;
           G(n,n) = 1;
           
           % B(n) = 1;
       elseif i == nx % right
           G(n,:) = 0;
           G(n,n) = 1;
       elseif j == 1 % bottom
           G(n,:) = 0;
           G(n,n) = 1;
       elseif j == ny % top
           G(n,:) = 0;
           G(n,n) = 1;
       else
           nxm = j + (i-2)*ny;
           nxp = j +(i)*ny;
           nym = j-1 + (i-1)*ny;
           nyp = j+1 + (i-1)*ny;
           
           G(n,n) = -4;
           G(n, nxm) = 1;
           G(n, nxp) = 1;
           G(n, nym) = 1;
           G(n, nyp) = 1; 
           
           
       end
       
    end
    
end

figure(1);
spy(G)
title("Sparse G Matrix");


[E,D] = eigs(G, 9, 'SM');

X = diag(D);

figure(2);
plot(X);
xlabel("Eigenvalue #");
ylabel("Eigenvalue");
title("Eigenvalues");

for i=1:nx
    for j=1:ny
        n = j + (i-1)*ny;
        for x=1:9
            sMap(i,j,x) = E(n,x);
        end
    end
end

% Plot Eigenvectors
for x=1:9
    figure;
    surf(sMap(:,:,x))
    title(['Surface plot of Eigenvectors, mode = ', num2str(x)]);
end

% Part ix)

clear all; clc;

nx = 50;
ny = 50;

G = sparse(nx*ny);
B = zeros(1,nx*ny);

sMap = zeros(nx,ny);

for i = 1:nx
    for j = 1:ny
       n = j + (i-1)*ny;
       
       if i == 1 % left
           G(n,:) = 0;
           G(n,n) = 1;
           
           % B(n) = 1;
       elseif i == nx % right
           G(n,:) = 0;
           G(n,n) = 1;
       elseif j == 1 % bottom
           G(n,:) = 0;
           G(n,n) = 1;
       elseif j == ny % top
           G(n,:) = 0;
           G(n,n) = 1;
       elseif i>10 && i<20 && j>10 && j<20
           nxm = j + (i-2)*ny;
           nxp = j +(i)*ny;
           nym = j-1 + (i-1)*ny;
           nyp = j+1 + (i-1)*ny;
           
           G(n,n) = -2;
           G(n, nxm) = 1;
           G(n, nxp) = 1;
           G(n, nym) = 1;
           G(n, nyp) = 1;
           
       else
           nxm = j + (i-2)*ny;
           nxp = j +(i)*ny;
           nym = j-1 + (i-1)*ny;
           nyp = j+1 + (i-1)*ny;
           
           G(n,n) = -4;
           G(n, nxm) = 1;
           G(n, nxp) = 1;
           G(n, nym) = 1;
           G(n, nyp) = 1; 
       end
       
    end
    
end

figure(1);
spy(G)
title("Sparse G Matrix");


[E,D] = eigs(G, 9, 'SM');

X = diag(D);

figure(2);
plot(X);
xlabel("Eigenvalue #");
ylabel("Eigenvalue");
title("Eigenvalues");

for i=1:nx
    for j=1:ny
        n = j + (i-1)*ny;
        for x=1:9
            sMap(i,j,x) = E(n,x);
        end
    end
end

% Plot Eigenvectors
for x=1:9
    figure;
    surf(sMap(:,:,x))
    title(['Surface plot of Eigenvectors, mode = ', num2str(x)]);
end


