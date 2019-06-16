$(document).ready(function(){
  var el_k15 = $('#myChart1');
  var totalk15 = 0
  mapData(k15).forEach(element => {
    return totalk15 += element;
  });
  var totalk16 = 0
  mapData(k16).forEach(element => {
    return totalk16 += element;
  });
  var totalk17 = 0
  mapData(k17).forEach(element => {
    return totalk17 += element;
  });
  var totalk18 = 0
  mapData(k18).forEach(element => {
    return totalk18 += element;
  });
  renderChart(el_k15, mapData(k15), 'Số lượng sinh viên K15 (Tổng: '+totalk15+' SV)')
  var el_k16 = $('#myChart2');
  renderChart(el_k16, mapData(k16), 'Số lượng sinh viên K16 (Tổng: '+totalk16+' SV)')
  var el_k17 = $('#myChart3');
  renderChart(el_k17, mapData(k17), 'Số lượng sinh viên K17 (Tổng: '+totalk17+' SV)')
  var el_k18 = $('#myChart4');
  renderChart(el_k18, mapData(k18), 'Số lượng sinh viên K18 (Tổng: '+totalk18+' SV)')
});

function mapData(data){
  var number = [];
  return number = data.map(function(x){
    return x.SoLuong;
  });
}

function renderChart(element, data, title){
  var myChart = new Chart(element, {
    type: 'pie',
    data: {
        labels: ['Còn học', 'Đã tốt nghiệp', 'Bảo lưu', 'Đã nghỉ học'],
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