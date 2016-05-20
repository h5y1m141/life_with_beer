angular.module('LifeWithBeerApp')
  .directive('d3Graph', ['d3Service', 'BeerStyle', function (d3Service, BeerStyle) {
  // D3.jsのラッピングとControllerとの連携は以下を参考に実装
  // http://qiita.com/Quramy/items/b701b824c2f42c683aa7
  var d3 = d3Service.d3;
  return{
    restrict: 'EAC',
    scope:{
      relationBaseWord: '=',
      relatinSearchFail: '='
    },
    link: function(scope, element){
      function radarChart(target, data) {
        var header = data.shift(),
            d = data,
            color = d3.scale.category10(),
            width = 400,
            height = 400,
            main,svg,r,s,rScale,circle,axisScale, axisLine,i, len, angles = [], scales = [];

        svg = d3.select(target)
          .append('svg')
          .attr('width', width)
          .attr('height', height);

        main = svg.append('g').attr({
          width: width,
          height: height,
          transform: 'translate(20,20,20,20)'
        });
        r = (width > height ? height : width) / 2;
        rScale = d3.scale.linear()
              .domain([0, 100])
              .range([0, r]);

        // 円を書く
        circle = main.selectAll('circle').data(d3.range(20, 101, 20)).enter().append('circle').attr({
          r: function (d) {
            return rScale(d);
          },
          cx: width / 2,
          cy: height / 2,
          fill: 'none',
          stroke: '#888'
        });

        axisScale = d3.scale.linear()
          .domain([0, 1])
          .range([height / 2, height / 2 - r]);

        axisLine = d3.svg.line()
          .x(function (d) {
            return (width / 2);
          })
          .y(function (d) {
            return axisScale(d);
          });

        // 軸を書く
        d3.range(0, 360, 360 / header.length).forEach(function (angle) {
          if (Math.abs(360 - angle) < 10) return;
          angles.push(angle);

          main.append('path').datum([0, 1]).attr({
            'class': 'axis',
            d: axisLine,
            transform: 'rotate(' + angle + ', ' + width / 2 + ', ' + height / 2 + ')',
            fill: 'none',
            stroke: '#888'
          });
        });

        s = d3.scale.linear()
          .domain([-r, r])
          .range([0, r * 2]);

        // 軸ごとにスケールを作る
        for (i = 0, len = angles.length; i < len; i++) {
          scales[i] = {
            x: d3.scale.linear()
              .domain([0, 100])
              .range([s(0), s(r * Math.cos(angles[i] * (Math.PI / 180) - Math.PI / 2))]),
            y: d3.scale.linear()
              .domain([0, 100])
              .range([s(0), s(r * Math.sin(angles[i] * (Math.PI / 180) - Math.PI / 2))])
          };
        }

        main.selectAll('polygon').data(d).enter().append('polygon').attr({
          points: function (d) {
            return d.map(function (d, i) {
              return [scales[i].x(d), scales[i].y(d)].join(",");
            }).join(" ");
          },
          fill: function (d, i) {
            return color(i);
          },
          stroke: function (d, i) {
            return color(i);
          },
          opacity: 0.5
        });

        return svg;
      }
      radarChart(element[0], [
        ['飲みごたえ', '香り', '苦味','アルコール度数', 'コク'],
        [10, 10, 60, 50, 10],
        [80, 70, 90, 80, 80],
        [80, 90, 80, 90, 60]
      ]);
    }
  };
}]);
