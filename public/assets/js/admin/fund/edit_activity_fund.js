$(document).ready(function(){
    checkCount();
    // formatCurrency();
    if ($('#toggleisUnion').prop('checked') == false) {
        $('#in-card-content').removeAttr("style");
    } else {
        $('#in-card-content').css('display', 'none');
    }
});


function formatCurrency(){
    var $unitPrice = $(".unitPrice");
    // Get the value.
    var input = $unitPrice.val();
    var input = input.replace(/[\D\s\._\-]+/g, "");
    input = input ? parseInt( input, 10 ) : 0;
    $unitPrice.val( function() {
        return ( input === 0 ) ? "" : input.toLocaleString( "en-US" );
    });

    var $expectedValue = $(".expectedValue");
    // Get the value.
    var input = $expectedValue.val();
    var input = input.replace(/[\D\s\._\-]+/g, "");
    input = input ? parseInt( input, 10 ) : 0;
    $expectedValue.val( function() {
        return ( input === 0 ) ? "" : input.toLocaleString( "en-US" );
    });
}
/**
* Format curency value
* 
*/
var $form = $( "#test" );
var $unitPrice = $form.find( ".unitPrice" );
var $expectedValue = $form.find( ".expectedValue" );

// unitPrice event
$(document).on( "keyup",".unitPrice", function( event ) {
    // When user select text in the document, also abort.
    var selection = window.getSelection().toString();
    if ( selection !== '' ) {
        return;
    }
    // When the arrow keys are pressed, abort.
    if ( $.inArray( event.keyCode, [38,40,37,39] ) !== -1 ) {
        return;
    }
    var $this = $( this );
    // Get the value.
    var input = $this.val();
    var input = input.replace(/[\D\s\._\-]+/g, "");
    input = input ? parseInt( input, 10 ) : 0;
    $this.val( function() {
        return ( input === 0 ) ? "" : input.toLocaleString( "en-US" );
    });
});

// expectedValue event
$(document).on( "keyup",".expectedValue", function( event ) {
    var total = 0;
    // When user select text in the document, also abort.
    var selection = window.getSelection().toString();
    if ( selection !== '' ) {
        return;
    }
    // When the arrow keys are pressed, abort.
    if ( $.inArray( event.keyCode, [38,40,37,39] ) !== -1 ) {
        return;
    }
    var $this = $( this );
    // Get the value.
    var input = $this.val();
    var input = input.replace(/[\D\s\._\-]+/g, "");
    input = input ? parseInt( input, 10 ) : 0;
    $this.val( function() {
        return ( input === 0 ) ? "" : input.toLocaleString( "en-US" );
    });
});

// actual value event
$(document).on( "keyup",".actualValue", function( event ) {
    var total = 0;
    // When user select text in the document, also abort.
    var selection = window.getSelection().toString();
    if ( selection !== '' ) {
        return;
    }
    // When the arrow keys are pressed, abort.
    if ( $.inArray( event.keyCode, [38,40,37,39] ) !== -1 ) {
        return;
    }
    var $this = $( this );
    // Get the value.
    var input = $this.val();
    var input = input.replace(/[\D\s\._\-]+/g, "");
    input = input ? parseInt( input, 10 ) : 0;
    $this.val( function() {
        return ( input === 0 ) ? "" : input.toLocaleString( "en-US" );
    });
});

// render more fund detail
var i = 10000;
$(document).on('click','.add', function(e){
    i++;
    count += 1;
    var html = '';
    html += '<div class="card mb-3" aria-hidden="true" id="card_'+i+'">';
    html += '<input type="hidden" name="detail_id_[]" value="0">';
    html += '   <div class="card-header">'
    html += '       <div class="form-row">'
    html += '           <div class="col-md-6">'
    html += '               <h6 class="m-0 font-weight-bold text-primary">Chi tiết dự trù</h6>'
    html += '           </div>'
    
    html += '<div class="col-md-6">'
    html += '<button type="button" class="close mr-2 text-danger delete" data-delete="'+i+'"><i class="fas fa-minus" title="Xóa nội dung"></i></button>'
    html += '<button type="button" class="close mr-2 text-success add"><i class="fas fa-plus" title="Thêm nội dung"></i></button>'
    html += '</div>'
    html += '</div></div>'
    html += '<div class="card-body">'
    html += '<div class="form-row">'
    html += '<div class="form-inline cm-inline-form col-md-2">'
    html += '<label for="accontent_'+i+'">Nội dung:</label>';
    html += '<input type="text"  class="form-control" name="content_[]" id="accontent_'+i+'" data-id="0" required>';
    html += '</div>';
    
    html += '<div class="form-inline cm-inline-form col-md-2">';
    html += '<label for="unit_'+i+'">Đơn vị tính:</label>';
    html += '<input type="text"  class="form-control" name="unit_[]" id="unit_'+i+'" data-id="0">';
    html += '</div>';
    
    html += '<div class="form-inline cm-inline-form col-md-2">';
    html += '<label for="unitPrice_'+i+'">Đơn giá:</label>';
    html += '<input type="text"  class="form-control unitPrice" name="unitPrice_[]" id="unitPrice_'+i+'" data-id="0" required>';
    html += '</div>';
    
    html += '<div class="form-inline cm-inline-form col-md-2">';
    html += '<label for="amount_'+i+'">Số lượng:</label>';
    html += '<input type="number"  class="form-control" name="amount_[]" id="amount_'+i+'" data-id="0" required>';
    html += '</div>';

    html += '<div class="form-inline cm-inline-form col-md-2">';
    html += '<label for="expectedValue_'+i+'">Thành tiền:</label>';
    html += '<input type="text"  class="form-control expectedValue" name="expectedValue_[]" id="expectedValue_'+i+'" data-id="0" required>';
    html += '</div>';

    html += '<div class="form-inline cm-inline-form col-md-2">';
    html += '<label for="actualValue_'+i+'">Thực chi:</label>'
    html += '<input type="text"  class="form-control actualValue" name="actualValue_[]" id="actualValue_'+i+'" data-id="0" required>';
    html += '</div>';

    html += '</div>';

    html += '<div class="form-row justify-content-center">';
    html += '<div class="form-inline cm-inline-form col-md-2">';
    html += '<label for="paymentType_'+i+'">Hình thức thanh toán:</label>';
    html += '<select name="paymentType_[]" id="paymentType_'+i+'" class="form-control" style="width:80%;" data-id="0" required>';
    html += '<option value="Hóa đơn đỏ">Hóa đơn đỏ</option>';
    html += '<option value="Ký nhận">Ký nhận</option>';
    html += '</select>';
    html += '</div>';

    html += '</div>';
    html += '</div>';
    html += '</div>';
    $('#in-card-content').append(html);
    checkCount();
});

// Remove fund detail
$(document).on('click','.delete', function(){
    var el = $(this).data('delete');
    $("div").remove('#card_'+el);
    count -= 1;
    checkCount();
});

function checkCount(){
    $el = $(document).find(".delete");
    // check label remove detail
    if(count <= 1){
        $el.css('display','none');
    } else {
        $el.css('display','initial');
    }
    
    // check button
    if(count <= 0){
        $('#submit').css('display','none');
        $('#clear').css('display','none');
    } else {
        $('#submit').css('display','initial');
        $('#clear').css('display','initial');
    }
}

// block UI when submit form
$(document).on('submit',"form", function(e){
    console.log(e);
    blockUI(true);
});


    // isUnion and UnionFee Toggle
    $(function () {
        $('#toggleisUnion').bootstrapToggle({
            on: 'Đã thanh toán',
            off: 'Chưa thanh toán',
            onstyle: 'primary',
            style: 'back-ground-toggle'
        });
    })

    $('#toggleisUnion').change(function () {
        if ($(this).prop('checked') == false) {
            $('#in-card-content').removeAttr("style");
            $('#toggleisUnion').val('0');
        } else {
            $('#in-card-content').css('display', 'none');
            $('#toggleisUnion').val('1');
        }
    })