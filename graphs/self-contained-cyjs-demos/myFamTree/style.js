var myStyle = [

   {selector: "node", css: {
       "shape": "ellipse",
       "color": "rgb(97, 106, 107)",
      "text-valign":"center",
      "text-halign":"center",
      "content": "data(id)",
      "border-color":"rgb(244, 208, 63)","border-width":"1px",
      "width": "mapData(count, 0.0, 110.0, 30.0, 100.0)",
      "height":"mapData(count, 0.0, 120.0, 30.0, 100.0)",
      //"background-color": "mapData(pearson, -1.0, 0, green, white)",
       "background-color":"rgb(252, 243, 207)",
       "font-size":"8px"}},

   

   {selector:"node:selected", css: {
       "text-valign":"centere",
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
      "width": "2px",
      'curve-style': 'unbundles-bezier(multiple))'
      }},


   ];

