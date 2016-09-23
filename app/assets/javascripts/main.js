$(document).ready(function() {


    $('#get_popular_purchases_button').click(function(e) {
      data = { bob_key: "bob_value" };

      $.ajax({
        method: "GET",
        url: "/popular_purchases",
        data: { username: "whatever" },
        success: function(data, textStatus, jqXHR) {
          console.log("returned data = " + JSON.stringify(data, undefined, 2))
          $('#popular_purchases_display').html(data["bob_key"]);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(JSON.stringify(jqXHR, undefined, 2))
          console.log(textStatus)
          console.log(errorThrown)
        }
      });

    });


});
