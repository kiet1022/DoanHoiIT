var labels = ['Còn học', 'Đã tốt nghiệp', 'Bảo lưu', 'Đã nghỉ học'];
$(document).ready(function(){
  initChart()
});

function initChart(){
  var el_k15 = $('#myChart1');
  var totalk15 = countTotalStudent(k15);
  var totalk16 = countTotalStudent(k16);
  var totalk17 = countTotalStudent(k17);
  var totalk18 = countTotalStudent(k18);
  renderChart(el_k15, mapData(k15), 'Số lượng sinh viên K15 (Tổng: '+totalk15+' SV)',labels)
  var el_k16 = $('#myChart2');
  renderChart(el_k16, mapData(k16), 'Số lượng sinh viên K16 (Tổng: '+totalk16+' SV)', labels)
  var el_k17 = $('#myChart3');
  renderChart(el_k17, mapData(k17), 'Số lượng sinh viên K17 (Tổng: '+totalk17+' SV)', labels)
  var el_k18 = $('#myChart4');
  renderChart(el_k18, mapData(k18), 'Số lượng sinh viên K18 (Tổng: '+totalk18+' SV)', labels)
}

function countTotalStudent(data){
  var result = 0;
  mapData(data).forEach(element => {
    return result += element;
  });
  return result;
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
          '#6986db',
          '#5addae',
          '#fcd779',
          '#f48277'
        ],
        borderColor: [
          '#4e73df',
          '#1cc88a',
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

$('#year').on('change',function(e){
  var clas = [];
  clas = classes.filter(a => a.school_year_id == e.target.value);
  if(clas.length > 0){
    renderClassSelectBox(clas);
  } else {
    renderClassSelectBox(classes);
  }
});

function renderClassSelectBox(clas){
  var html ='<option value="">Tất cả các lớp</option>';
  clas.forEach(function(element){
    html += '<option value="'+element.id+'">'+element.class_name+'</option>';
  })
  $('#class').html(html);
}

$('#filter').on('click', function(e){
  blockUI(true);
  var year = $('#year').val();
  var clas = $('#class').val();
  $.ajax({
    url: BASE_URL + "/filter.php",
    method: 'POST',
    data:{
      year: year,
      class: clas
    }
  }).done(function(data) {
    console.log(data);
    if(year == ""){
      initChart();
    } else if(year != ""){
      html ='<div class="col-12 mb-3 text-center"><canvas id="chartsummary" height="50"></canvas></div>'
      for(var i = 0; i< data['chartdetail'].length;i++){
        html += '<div class="col-4 mb-3"><canvas id="chart-detail-'+i+'" height="120"></canvas></div>'
      }
      $('#chart-area').html(html);
      var yeary = years.find(function(element){
        return year == element.id
      })
      var total = countTotalStudent(data['chartYear'][0][0]);
      renderChart(chartsummary,mapData(data['chartYear'][0][0]), 'Số lượng sinh viên khóa '+yeary.course+' (Tổng: '+total+")", labels);

      for(var i = 0; i< data['chartdetail'].length;i++){
        var obj = data['chartdetail'][i];
        $.each( obj, function( key, value ) {
          var name = "chart-detail-"+i;
          var total = countTotalStudent(value);
          renderChart(name,mapData(value), 'Số lượng sinh viên lớp: '+key+' (Tổng: '+total+")", labels);
        });
      }
      
    }
    blockUI(false);
  }).fail(function(xhr, status, error) {
    blockUI(false);
    console.log('lala');
    console.log(this.url);
    console.log(error);
  });
})