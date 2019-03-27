    //event when select checkbox
    $(".column-selected").on('click', function(event) {
        var id = $(this).attr('id');
        var checkBox = document.getElementById("ckb_"+id+"");

        var i=0;
        $( "tr.selected" ).each(function() {
            i++;
        });
        var j=0;
        $( "input[type=checkBox]" ).each(function() {
            if (this.checked) {
                j++;
            }     
        });

        if (false === event.ctrlKey) {
            if (checkBox.checked == false) {
                $("input.sub_chk").prop('checked',false );
            }else{
                $("input.sub_chk").prop('checked',false );
                if (i==0 && j!=0) {
                    $("#ckb_"+id+"").prop('checked', false); 
                }else if(i==1&&j==1){
                    $("#ckb_"+id+"").prop('checked', true); 
                }else if(i!=0){
                    $("#ckb_"+id+"").prop('checked', false); 
                }
            }
        }

        if(checkBox.checked == true)  {
            $("#ckb_"+id+"").prop('checked',false ); 
        } 
        else {  
            $("#ckb_"+id+"").prop('checked', true); 
        }  

    });