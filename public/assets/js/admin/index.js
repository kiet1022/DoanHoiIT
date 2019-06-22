  // Init data table
  $('#dataTable').DataTable({
    "columnDefs": [
      { width: "5%", targets: 0 },
      { width: "20%", targets: 2 },
      { width: "15%", targets: 4 },
      { width: "20%", targets: 5 }
    ]
    // columnDefs: [ {
    //   orderable: false,
    //   className: 'select-checkbox',
    //   targets:   0
    // }],
    // select: {
    //   style: 'multi',
    //   selector: 'td:first-child'
    // },
  });