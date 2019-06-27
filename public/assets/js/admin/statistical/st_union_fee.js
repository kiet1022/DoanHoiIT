var labels = ['Đã đóng', 'Chưa đóng'];
$(document).ready(function(){
  initChart()
  $('#dataTable').DataTable();
});

function initChart(){
  var yearid = $('#schoolyear').val();
  var yeary = years.find(function(element){
    return yearid == element.id
  })
  html ='<div class="col-12 mb-3 text-center"><canvas id="chartsummary" height="50"></canvas></div>';
  for(var i = 0; i< detail.length;i++){
    html += '<div class="col-4 mb-3"><canvas id="chart-detail-'+i+'" height="120"></canvas></div>'
  }
  $('#chart-area').html(html);
  var chartsummary = $('#chartsummary');
  renderChart(chartsummary, mapData(k15), 'Khóa '+yeary.course,labels)

  for(var i = 0; i< detail.length;i++){
    var obj = detail[i];
    $.each( obj, function( key, value ) {
      console.log(value);
      var name = "chart-detail-"+i;
      // var total = countTotalStudent(value);
      renderChart(name,mapData(value), 'Lớp: '+key, labels);
    });
  }
}

function mapData(data){
  var number = [];
  return number = data.map(function(x){
    return x.SoLuong;
  });
}

function renderChart(element, data, title, labels){
  new Chart(element, {
    type: 'pie',
    data: {
      labels: labels,
      datasets: [{
        label: 'K18',
        data: data,
        backgroundColor: [
          '#fcd779',
          '#f48277'
        ],
        borderColor: [
          '#f6c23e',
          '#e74a3b'
        ],
        borderWidth: 1
      }]
    },
    options:{
      title: {
        display: true,
        text: title
      }
    }
  });
}