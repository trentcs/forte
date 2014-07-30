$(function() {
	console.log(gon.melodic_contour);
	console.log("Hey, wha happen?")
	var pitchRangeChart = c3.generate({
	        bindto: "#note_count",
	        data: {
	          columns: 
	            gon.pitch_range_data
	            // gon.data2
	          ,
	          axes: {
	            pitch_range_data: 'y'
	            // data2: 'y2',
	          },
	          type: "bar"
	        },
	        axis: {
	    
	          y: {
	            label: {
	              text: 'Range (octaves)',
	              position: 'outer-middle'
	            }
	          },
	        },
	        tooltip: {
	//          enabled: false
	        },
	        zoom: {
	//          enabled: true
	        },
	        subchart: {
	//          show: true
	        }
	      });

	var melodicCountourChart = c3.generate({

		bindto: "#melodic_contour",
	    data: {
	        columns: gon.melodic_contour,
	        type: 'spline'
	    },
	    axis: {
	    	
	    	x: {
	    		label: {
	    			text: 'Measures'
	    		}
	    	},

	    	y: {
	    		label: {
	    			text: 'Pitch',
	    			position: 'outer-middle'
	    		}
	    	},
	    }
	});
	
	var chart = c3.generate({
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
//     chart.load({
//         columns: [
//             ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
//             ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
//             ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
//         ]
//     });
// }, 1500);

setTimeout(function () {
    chart.unload('data1');
    chart.unload('data2');
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