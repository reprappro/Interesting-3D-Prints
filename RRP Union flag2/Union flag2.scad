1st_layer_height = 0.3;
layer_height = 0.2;
cc_x = 85.6;
cc_y = 53.98;
flag_layers = 2;
corner_radius = 3;
$fn=16;

intersection () {
	hull () {
		translate ([corner_radius,corner_radius,-layer_height]) cylinder (r=corner_radius, h=1st_layer_height+layer_height*5);
		translate ([corner_radius,cc_y-corner_radius,-layer_height]) cylinder (r=corner_radius, h=1st_layer_height+layer_height*5);
		translate ([cc_x-corner_radius,cc_y-corner_radius,-layer_height]) cylinder (r=corner_radius, h=1st_layer_height+layer_height*5);
		translate ([cc_x-corner_radius,corner_radius,-layer_height]) cylinder (r=corner_radius, h=1st_layer_height+layer_height*5);
		}

	translate ([0,0,0]) {
		
		// Layer 1,2
			
		color ("White") linear_extrude (height = 1st_layer_height+layer_height, convexity = 10) 
		translate ([0,cc_y,0]) mirror ([0,1,0]) import(file = "Union flag white.dxf");
		
		color ("Red") linear_extrude (height = 1st_layer_height+layer_height, convexity = 10) 
		translate ([0,cc_y,0]) mirror ([0,1,0]) import(file = "Union flag red.dxf");
		
		color ("Blue") linear_extrude (height = 1st_layer_height+layer_height, convexity = 10) 
		translate ([0,cc_y,0]) mirror ([0,1,0]) import(file = "Union flag blue.dxf");
		
		
		
		// Layer 3

		translate ([0,0,1st_layer_height+layer_height]) color ("White") cube ([cc_x,cc_y,layer_height]);

		// Layer 4
		
		translate ([0,0,1st_layer_height+layer_height+layer_height]) {
			difference () {
				color ("Blue") cube ([cc_x,cc_y,layer_height]);
				translate ([0,0,-layer_height]) linear_extrude (height = layer_height*3, convexity = 10) 
				import(file = "reprappro_words_ian.dxf");
			}
			
			color ("White") linear_extrude (height = layer_height, convexity = 10) import(file = "reprappro_words_ian.dxf");
		
		}
	}	
}