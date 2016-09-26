$(document).ready(function() {

    $('#username_field').keypress(function(e) {
      if (e.keyCode == 13) {
        getPopularPurchases( $('#username_field').val() );
      }
    });

    $('#get_popular_purchases_button').click(function(e) {
      getPopularPurchases( $('#username_field').val() );
    });

    function getPopularPurchases(username) {
      payload = { username: username };

      $.get({
        url: "/popular_purchases",
        data: payload,
        success: function(data, textStatus, jqXHR) {
          console.log("returned data = " + JSON.stringify(data, undefined, 2));
          $('#popular_purchases_display').html(data["data"]);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(JSON.stringify(jqXHR, undefined, 2));
          console.log(textStatus);
          console.log(errorThrown);
        }
      });

    }

    $('#get_empty_username').click(function(e) {
      getPopularPurchases("");
    });

    $('#get_steve').click(function(e) {
      getPopularPurchases("steve");
    });

    $('#get_morgan_barton').click(function(e) {
      getPopularPurchases("Morgan_Barton");
    });


});
