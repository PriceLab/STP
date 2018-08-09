var myStyle = [

   {selector: "node", css: {
       "shape": "ellipse",
       "color": "rgb(97, 106, 107)",
      "text-valign":"center",
      "text-halign":"center",
      "content": "data(id)",
      "border-color":"rgb(244, 208, 63)","border-width":"1px",
      //"width": "100px",
       //"height": "100px",
       "width": "mapData(degree, 0, 10, 30, 100)",
       "height":"mapData(degree, 0, 10, 30, 100)",
       "background-color":"rgb(252, 243, 207)",
       "font-size":"8px"}},

   

   {selector:"node:selected", css: {
       "text-valign":"center",
       "text-halign":"center",
       "border-color": "black",
       "content": "data(id)",
       "border-width": "3px",
       "overlay-opacity": 0.5,
       "overlay-color": "purple"
       }},

   {selector: 'edge', css: {
      "line-color": "rgb(200, 200, 200)",
      "target-arrow-shape": "triangle",
      "target-arrow-color": "rgb(97, 106, 107)",
      "width": "2px"
      }},


   ];

