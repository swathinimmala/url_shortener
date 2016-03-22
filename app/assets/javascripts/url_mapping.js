$(document).ready(function(){
  $("#shorten_url").click(function(event){
    event.preventDefault();
    var form_data = $("#url_mapping_url").val();
    var data = {url:  form_data};
    create_url(data);
  });

  function create_url(data){
    $.ajax({
      type: 'POST',
      //url: '/api/shorten',
      url: '/url_mappings',
      data: data
    }).done(function(response){
        create_url_response(response);
      });
  }

  function create_url_response(response){
    if(response['success'] == false){
      $("#response").html('<div>' + response['message'] + '</div>');
    }
    else{
      $("#url_mapping_url").val('');
      $("#response").html('<div>Original Url: ' + '<a href="' + response['original_url'] + '" target = "_blank">'+ response['original_url'] + '</div>');
      $("#response").append('<div>Short Url: ' + '<a href="' + response['short_url'] + '" target = "_blank">'+ response['short_url'] + '</div>');
    }   
  }
});