my_stack <- data_frame(
  cat = rep(c("a", "b", "c", "d", "e"), 5),
  subcat = rep(c("u", "x", "y", "z", "w"), each = 5),
  value = round(rnorm(25, mean = 40, sd = 10)),
  label = LETTERS[1:25]
)


my_stack %>%
  hchart(type = "bar",
         hcaes(
           x = cat,
           y = value,
           group = subcat,
           name = cat
         )) %>%
  hc_plotOptions(series = list(stacking = "stack")) %>%
  hc_legend(reversed = TRUE) %>%
  hc_tooltip(
    formatter = JS(
      "function(){
      
      var subcat = '';
      $.each(this.points.reverse(),function(i, point){
      subcat += '<span style=\U0022' + 'color:' + this.point.series.color + '\U0022>\u25CF</span>' + '<b>' + this.point.series.name + ': </b>' +
      Highcharts.numberFormat(this.point.plotY, 1) + ' (label: ' + this.point.label + ')' +
      '<br/>';
      });
      
      return 'Category: ' + this.points[0].key + '<br/>' +
      subcat;
      }"
),
shared = TRUE
    )
