// function loadZipcodes(jsonFile){
//     let xhttp = new XMLHttpRequest();
//     xhttp.onreadystatechange = function(){
//         let json_info = JSON.parse(this.responseText)
//         console.log(json_info)
//         document.getElementById("zip").innerHTML = json_info.zip
//         document.getElementById("state").innerHTML = json_info.state
//         document.getElementById("city").innerHTML = json_info.city
//     }
//     xhttp.open("GET", jsonFile, true)
//     xhttp.send()
// } 
$("#zip").keyup(function() {
            var el = $(this);

            if (el.val().length === 5) {
                $.ajax({
                    url: "/WEB-INF/classes/com/uci/pa3/zip_codes.json",
                    cache: false,
                    dataType: "json",
                    data: "zip=" + el.val(),
                    success: function(result, success) {
                        $("#city").val(result.city);
                        $("#state").val(result.state);
                    }
                });
            }
        });