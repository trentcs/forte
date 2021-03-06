$(function() {
	var pitchRangeChart = c3.generate({
	        bindto: "#pitch_range",
	        data: {
	          columns: 
	            gon.pitch_range_data
	          ,
	          axes: {
	            pitch_range_data: 'y'
	          },
	          type: "bar"
	        },
	        axis: {
            x: {
              tick: {
                format: function(x){return ""}
              },
            },    
	          y: {
	            label: {
	              text: 'Range (frequency)',
	              position: 'outer-middle'
	            }
	          },
	        },
	        tooltip: {
	         show: false
	        },
	        zoom: {
	//          enabled: true
	        },
	        subchart: {
	//          show: true
	        }
	      });

  $("#pitch_range").click(function() {
    
    pitchRangeChart.load({
        columns: gon.all_pitch_range_data
    });
});
  console.log(gon.melodic_contour)
  x_axis_pairs = {}
  for(i = 0; i < gon.melodic_contour.length; i+=2){
    x_axis_pairs[gon.melodic_contour[i][0]] = gon.melodic_contour[i+1][0]
  }
  console.log(x_axis_pairs)
	var melodicCountourChart = c3.generate({
		bindto: "#melodic_contour",
	    data: {

          xs: x_axis_pairs,
	        columns: gon.melodic_contour,
	        type: 'spline'
	    },
      point: {
        show: false
      },
	    axis: {
	    	
	    	x: {
	    		tick: {
              count: 8,
              format: function(x){return ""}
            },
	    	},

	    	y: {
	    		label: {
	    			text: 'Frequency',
	    			position: 'outer-middle'
	    		}
	    	},
	    }
	});
	
	var rhythmicDistributionChart = c3.generate({
		bindto: "#duration_count",
    data: {
        columns: gon.duration_counts,
        type : 'donut'
    },
    donut: {
        title: "Rhythmic Distribution",
        onclick: function (d, i) { console.log(d, i); },
        onmouseover: function (d, i) { console.log(d, i); },
        onmouseout: function (d, i) { console.log(d, i); }
    }
});

// setTimeout(function () {
//     rhythmicDistributionChart.load({
//         columns: [
//             ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
//             ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
//             ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
//         ]
//     });
// }, 1500);

setTimeout(function () {
    rhythmicDistributionChart.unload('data1');
    rhythmicDistributionChart.unload('data2');
}, 2500);

// var chart = c3.generate({
// 	bindto: "#melodic_contour",
//     data: {
//         // xs: {
//         //     soprano: 'Soprano',
//         //     alto: 'Alto',
//         //     piano: 'Piano'
//         // },
//         // iris data from R
//         columns: gon.melodic_contour,
//         type: 'scatter'
//     },
//     axis: {
//         x: {
//             label: 'Sepal.Width',
//             tick: {
//                 fit: false
//             }
//         },
//         y: {
//             label: 'Petal.Width'
//         }
//     }
// });


});