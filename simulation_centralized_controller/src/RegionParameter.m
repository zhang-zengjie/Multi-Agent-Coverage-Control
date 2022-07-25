function REGION_CONFIG = RegionParameter(vertexes, Coeff)

    REGION_CONFIG.BOUNDARIES_VERTEXES = vertexes;
    REGION_CONFIG.BOUNDARIES_COEFF = Coeff;
    REGION_CONFIG.REGION_MAX_X = max(vertexes(:,1));
    REGION_CONFIG.REGION_MAX_Y = max(vertexes(:,2));