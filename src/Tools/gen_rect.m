function [vertexes, A, b] = gen_rect(Width, Height)

    A = [-1 , 0; 1 , 0; 0 , 1; 0 , -1];
    b = [0, Width, Height, 0]';
    vertexes = [0, 0; 0, Height; Width, Height; Width, 0; 0, 0];