    $(document).ready(function(){

        // init Toggle
        $('[data-toggle="tooltip"]').tooltip();

        // check show off if toggle is on
        if($('#toggleisUnion').prop('checked') == false){
            $('.show-off').css('display','none');
        } else {
            $('.show-off').removeAttr("style");
        }

        // show advance uinon info
        $(function() {
            $('#toggleisUnion').change(function() {
                if($(this).prop('checked') == false){
                    $('.show-off').css('display','none');
                    $('#toggleisUnion').val('0');
                } else {
                    $('.show-off').removeAttr("style");
                    $('#toggleisUnion').val('1');
                }
            })
        })
        
        // Union Date picker
        $('#unionDate').datepicker({
            uiLibrary: 'bootstrap4',
            keyboardNavigation: true,
            format: 'd/m/Y'
        });

        // Birthday Date picker
        $('#studentBirthday').datepicker({
            uiLibrary: 'bootstrap4',
            keyboardNavigation: true,
            format: 'd/m/Y'
        });
        
    });
    
    // isUnion and UnionFee Toggle
    $(function() {
        $('#toggleisUnion').bootstrapToggle({
            on: 'Yes',
            off: 'No',
            onstyle: 'primary',
            style: 'back-ground-toggle'
        });
        
        $('#toggleUnionFee').bootstrapToggle({
            on: 'Đã đóng',
            off: 'Chưa đóng',
            onstyle: 'primary',
            style: 'back-ground-toggle'
        });
    })

    $('#toggleUnionFee').change(function() {
        if($(this).prop('checked') == false){
            $('#toggleUnionFee').val('0');
        } else {
            $('#toggleUnionFee').val('1');
        }
    })

    // Change class when school year change
    $('#studentShoolYear').change(function(){
        var schoolYearId = $(this).val();
        changeClass(schoolYearId, classes);
    })
    
    // Change select class
    function changeClass(schoolYearId, classes){
        var html = '';
        var clas = [];
        classes.find(function(item){
            if(item.school_year_id == schoolYearId){
                clas.push(item);
            }
        });

        for(var i = 0 ; i< clas.length; i++){
            html += '<option value="'+clas[i].id+'">'+clas[i].class_name+'</option>';
        }

        if(html != ''){
            $('#studentClass').html(html);
        }
    }

    // Change district when province change
    $('#studentProvince').change(function(){
        var provinceId = $(this).val();
        changeDistrict(provinceId, district);
    })

    // Change select district
    function changeDistrict(provinceId, district){
        var html = '';
        var dis = [];
        district.find(function(item){
            if(parseInt(item.province_id) == parseInt(provinceId)){
                dis.push(item);
            }
        });

        changeWard(dis[0].id, ward);

        for(var i = 0 ; i< dis.length; i++){
            html += '<option value="'+dis[i].id+'">'+dis[i].name+'</option>';
        }

        if(html != ''){
            $('#studentDistrict').html(html);
        }
    }

    // Change ward when district change
    $('#studentDistrict').change(function(){
        var districtId = $(this).val();
        changeWard(districtId, ward);
    })

    // Change select ward
    function changeWard(districtId, wards){
        var html = '';
        var ward = [];
        wards.find(function(item){
            if(parseInt(item.district_id) == parseInt(districtId)){
                ward.push(item);
            }
        });

        for(var i = 0 ; i< ward.length; i++){
            html += '<option value="'+ward[i].id+'">'+ward[i].name+'</option>';
        }

        if(html != ''){
            $('#studentWard').html(html);
        }
    }

    // clear all value of input
    function clearValue(){
        $('input[name=sid]').val(null);
        $('input[name=studentName]').val(null);
        $('input[name=studentBirthday]').val(null);
        $('input[name=studentPhone]').val(null);
        $('input[name=studentAddress]').val(null);
        $('input[name=unionDate]').val(null);
        $('input[name=unionPlace]').val(null);
        $('.cm-error').css('display','none');
    }