$(function() {
console.log(gon.data1)

var chart = c3.generate({
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
          x: {
            label: 'X Label'
          },
          y: {
            label: {
              text: 'Y Axis Label',
              position: 'outer-middle'
            }
          },
          y2: {
            show: true,
            label: {
              text: 'Y2 Axis Label',
              position: 'outer-middle'
            }
          }
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
});