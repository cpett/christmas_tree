$( document ).ready(function() {

	$('#btnPlay').click(function(e) {
		e.preventDefault();

		$.ajax({
		
			url: "/treeon.php",
			type: "post"
			
		});
	});

        $('#btnStop').click(function(e) {
                e.preventDefault();
		
		$("button").attr("disabled", true);

                $.ajax({

                        url: "/treeoff.php",
                        type: "post",
			success: function() {
				$("button").removeAttr("disabled");
			}

                });
        });

        $('#sngCarol').click(function(e) {
                e.preventDefault();

		$("button").attr("disabled", true);

                $.ajax({

                        url: "/carol.php",
                        type: "post",
                        success: function() {
                                $("button").removeAttr("disabled");
                        }
                });
        });


	 $('#sngJingleBell').click(function(e) {
                e.preventDefault();

                $("button").attr("disabled", true);

                $.ajax({

                        url: "/jingleBell.php",
                        type: "post",
                        success: function() {
                                $("button").removeAttr("disabled");
                        }
                });
        });


	$('#sngJoyToWorld').click(function(e) {
                e.preventDefault();

                $("button").attr("disabled", true);

                $.ajax({

                        url: "/joyToTheWorld.php",
                        type: "post",
                        success: function() {
                                $("button").removeAttr("disabled");
                        }
                });
        });

	
	
	$('#sngCougarFight').click(function(e) {
                e.preventDefault();

                $("button").attr("disabled", true);

                $.ajax({

                        url: "/fightSong.php",
                        type: "post",
                        success: function() {
                                $("button").removeAttr("disabled");
                        }
                });
        });



});
                    
